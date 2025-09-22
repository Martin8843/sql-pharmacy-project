#### Opis ogólny

Trigger **trg\_update\_product\_status** działa po aktualizacji (AFTER UPDATE) tabeli stock i jest uruchamiany dla każdego rekordu (FOR EACH ROW). Jego zadaniem jest aktualizacja statusu dostępności (avail\_status) w tabeli products na podstawie zmienionej ilości (quantity) w tabeli stock.

---

### Krok po kroku – jak działa trigger?

1. Aktywacja triggera  
   * Trigger aktywuje się, gdy w tabeli stock zostanie wykonana operacja UPDATE.  
   * Działa dla każdego wiersza (FOR EACH ROW), czyli każda zmiana ilości (quantity) w stock wywoła trigger.  
2. Instrukcja MERGE INTO  
   * Wykorzystuje mechanizm MERGE, który łączy (USING) nowe wartości z tabeli stock (przekazane za pomocą :NEW).  
   * Tworzy tymczasową tabelę (s), która zawiera:  
     * product\_id (ID produktu)  
     * stock\_qnty (aktualna ilość w stock)  
   * Łączy tę tabelę z products na podstawie product\_id.  
3. Aktualizacja avail\_status w products  
   * Jeśli znaleziono dopasowanie (WHEN MATCHED), wykonywana jest aktualizacja (UPDATE SET).  
   * avail\_status przyjmuje jedną z trzech wartości w zależności od ilości w magazynie (stock.quantity):  
     * Available → jeśli ilość wynosi 100 lub więcej.  
     * Out of Stock → jeśli ilość wynosi 0\.  
     * Limited Stock → jeśli ilość jest większa od 0, ale mniejsza niż 100\.

---

#### Co się dzieje po aktualizacji?

* Trigger trg\_update\_product\_status się uruchamia.  
* MERGE INTO sprawdza, czy product\_id \= 16 istnieje w tabeli products.  
* Ponieważ quantity \= 120, warunek WHEN s.stock\_qnty \>= 100 spełnia się.  
* avail\_status w tabeli products zmienia się na 'Available'.

