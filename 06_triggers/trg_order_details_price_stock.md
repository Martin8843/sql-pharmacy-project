## 1\. Opis ogólny

Trigger trg\_order\_details\_price\_stock jest wyzwalany podczas operacji INSERT, UPDATE lub DELETE na tabeli order\_details. Jego zadaniem jest:

* Automatyczna aktualizacja kolumny total\_price w tabeli order\_details przed zapisaniem rekordu.  
* Aktualizacja stanu magazynowego w tabeli stock po wykonaniu operacji na order\_details.

Trigger jest typu COMPOUND TRIGGER, co oznacza, że posiada sekcje BEFORE EACH ROW i AFTER EACH ROW, umożliwiając optymalizację operacji i zmniejszenie liczby wywołań zapytań SQL.

---

## 2\. Działanie krok po kroku

### A. BEFORE EACH ROW (Przed zapisem każdego rekordu)

1. Obliczenie ceny całkowitej zamówienia:  
   * Przed dodaniem lub aktualizacją rekordu w tabeli order\_details, trigger wylicza wartość total\_price.  
   * total\_price \= ord\_qnty \* unit\_price (ilość zamówiona \* cena jednostkowa).  
2. Efekt:  
   * Każdy nowy lub zaktualizowany rekord będzie miał poprawnie wyliczoną wartość total\_price przed zapisaniem do bazy danych.

---

### 

### B. AFTER EACH ROW (Po zapisaniu każdego rekordu)

1. Aktualizacja stanu magazynowego:  
   * Wykonywane jest zapytanie MERGE INTO stock, które aktualizuje ilość produktu w magazynie.  
   * Działanie triggera opiera się na porównaniu starej (:OLD.ord\_qnty) i nowej (:NEW.ord\_qnty) ilości zamówionych produktów.  
2. Sposób aktualizacji stock:  
   * Pobierana jest aktualna ilość produktu w magazynie (s.quantity).  
   * Dodawana jest różnica ilości przed i po operacji (nvl(old\_qnty, 0\) \- nvl(new\_qnty, 0)), gdzie:  
     * Jeśli wstawiono nowy rekord: zmniejsza stan magazynowy o nową ilość.  
     * Jeśli usunięto rekord: zwraca do magazynu starą ilość.  
     * Jeśli zmieniono ilość: magazyn dostosowuje się do zmiany.

---

## 3\. Przykłady użycia

### Przypadek 1: Dodanie nowego zamówienia

INSERT INTO order\_details (order\_id, product\_id, ord\_qnty, unit\_price)  
VALUES (101, 21, 5, 20);

Efekt:

* total\_price zostanie automatycznie ustawione na 5 \* 20 \= 100\.  
* W magazynie zmniejszy się ilość produktu o 5\.

### Przypadek 2: Aktualizacja ilości zamówionego produktu

UPDATE order\_details  
SET ord\_qnty \= ord\_qnty \+ 20  
WHERE product\_id \= 21 AND order\_id \= 170;

Efekt:

* total\_price zaktualizuje się automatycznie.  
* Magazyn zostanie zmieniony o różnicę w ilości zamówionego produktu.

### Przypadek 3: Usunięcie zamówienia

DELETE FROM order\_details WHERE order\_id \= 170 AND product\_id \= 21;

Efekt:

* Produkt wróci do magazynu w ilości, która była zamówiona.

---

## 4\. Podsumowanie

Trigger trg\_order\_details\_price\_stock automatyzuje aktualizację cen zamówienia oraz stanu magazynowego. Jest efektywny, ponieważ: ✅ Przed zapisaniem rekordu oblicza cenę całkowitą. ✅ Po zapisaniu rekordu aktualizuje ilość produktu w magazynie. ✅ Działa dla operacji INSERT, UPDATE, DELETE, co zapewnia integralność danych.

Trigger pomaga uniknąć błędów wynikających z ręcznej aktualizacji cen i stanów magazynowych, a jednocześnie zapewnia automatyzację i spójność danych.

