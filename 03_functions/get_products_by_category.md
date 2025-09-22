Opis funkcji: **get\_products\_by\_category**

Funkcja get\_products\_by\_category jest funkcją typu PIPELINED w języku PL/SQL, która zwraca zestaw danych zawierający informacje o produktach z określonej kategorii. Dla każdego produktu funkcja generuje obiekt typu prod\_info\_rec, który zawiera następujące informacje:

product\_name: Nazwa produktu  
exp\_date: Data ważności  
price: Cena  
quantity: Ilość w magazynie

**Operacje wykonywane przez funkcję:**  
Pobieranie danych: Funkcja wykonuje zapytanie SQL, które łączy tabele products i stock na podstawie identyfikatora produktu (product\_id). Filtruje wyniki, aby uwzględnić tylko produkty należące do kategorii o identyfikatorze p\_category\_id.

Generowanie obiektów: Dla każdego rekordu uzyskanego z zapytania SQL funkcja tworzy obiekt typu prod\_info\_rec, inicjalizując go danymi z rekordu.

Pipelining danych: Funkcja wykorzystuje mechanizm PIPELINED, aby iteracyjnie zwracać obiekty prod\_info\_rec do zapytania wywołującego. Dzięki temu dane są przesyłane w czasie rzeczywistym, co może poprawić wydajność w porównaniu do zwracania całego zestawu danych na raz.   
DOCS.ORACLE.COM

**Użycie typu tablicowego:**

Funkcja zwraca kolekcję obiektów typu prod\_info\_rec, zdefiniowaną jako typ tablicowy prod\_info\_nt. Użycie typu tablicowego pozwala na grupowanie powiązanych danych w jednym obiekcie, co ułatwia manipulację i przetwarzanie danych w aplikacji. Dodatkowo, kolekcje w PL/SQL umożliwiają efektywne przechowywanie i przetwarzanie wielu elementów, co jest korzystne w przypadku pracy z dużymi zbiorami danych. 

**Wywołanie funkcji:**

Funkcję get\_products\_by\_category można wywołać w zapytaniu SQL. Przykład:

SELECT \*  
FROM TABLE(get\_products\_by\_category(p\_category\_id \=\> 1));

W powyższym przykładzie funkcja jest wywoływana z parametrem p\_category\_id ustawionym na wartość 1\. Wynik zapytania zawiera wszystkie kolumny zdefiniowane w obiekcie prod\_info\_rec.

**Uwagi dodatkowe:**

Funkcja get\_products\_by\_category jest przykładem funkcji typu PIPELINED, która umożliwia zwracanie danych w sposób strumieniowy, co może prowadzić do lepszej wydajności w porównaniu do tradycyjnych funkcji zwracających całą kolekcję danych na raz. Dzięki zastosowaniu mechanizmu pipeliningu, funkcja może zwracać dane do zapytania wywołującego w miarę ich generowania, co redukuje zużycie pamięci i czas oczekiwania na wyniki. 

Dodatkowo, użycie typu tablicowego pozwala na efektywne grupowanie powiązanych danych, co ułatwia ich przetwarzanie i manipulację w aplikacji. Kolekcje w PL/SQL są szczególnie przydatne w przypadku pracy z dużymi zbiorami danych, ponieważ umożliwiają przechowywanie i przetwarzanie wielu elementów w sposób zorganizowany i efektywny.