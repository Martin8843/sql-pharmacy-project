**Opis triggera:**  trg\_after\_dml\_products  
Trigger trg\_after\_dml\_products jest wyzwalany po operacjach DML (INSERT, UPDATE, DELETE) na tabeli products. Jego głównym celem jest logowanie zmian dokonanych na produktach w tabeli products do tabeli logów za pomocą procedury log\_event.

**Kluczowe informacje:**  
Typ wyzwalacza: Trigger AFTER – oznacza, że jest uruchamiany po zakończeniu operacji INSERT, UPDATE lub DELETE na tabeli products.

Zakres działania: FOR EACH ROW – trigger działa dla każdej zmienionej lub usuniętej wiersza indywidualnie.

Wyzwalacze: Trigger reaguje na trzy typy operacji:  
INSERT: Trigger wywołuje logowanie, gdy nowy produkt zostaje dodany do tabeli products.  
UPDATE: Trigger wywołuje logowanie, gdy istniejący produkt zostaje zaktualizowany.  
DELETE: Trigger wywołuje logowanie, gdy produkt zostaje usunięty z tabeli products.

Logowanie: W zależności od typu operacji (INSERT, UPDATE, DELETE) do procedury log\_event przekazywane są różne szczegóły logu, takie jak:  
Typ operacji (np. 'INSERT', 'UPDATE', 'DELETE').  
Szczegóły logu (np. opis dodania, aktualizacji lub usunięcia produktu).  
Identyfikator produktu, który jest modyfikowany.

Parametry:  
p\_log\_type: Określa typ operacji (INSERT, UPDATE, DELETE).  
p\_log\_details: Szczegóły operacji, w tym identyfikator produktu oraz informacja o tym, czy produkt został dodany, zaktualizowany lub usunięty.  
p\_product\_id: Identyfikator produktu, który jest zmieniany (w zależności od operacji, używany jest :nowy.product\_id dla INSERT i UPDATE oraz :stary.product\_id dla DELETE).

Zastosowanie:  
Trigger trg\_after\_dml\_products jest wykorzystywany do śledzenia zmian w tabeli products, zapewniając rejestrację wszelkich operacji na produktach w systemie. Dzięki temu możliwe jest dokładne monitorowanie, które produkty zostały dodane, zmienione lub usunięte, co jest istotne z punktu widzenia audytu i zarządzania historią zmian w systemie.

Przykład działania:  
INSERT: Gdy nowy produkt zostaje dodany, trigger zapisuje log z informacją, że produkt o danym product\_id został dodany.  
UPDATE: Gdy istniejący produkt jest aktualizowany, trigger zapisuje log z informacją, że produkt o danym product\_id został zaktualizowany.  
DELETE: Gdy produkt zostaje usunięty, trigger zapisuje log z informacją, że produkt o danym product\_id został usunięty.

**Wyjątki:**

Trigger obsługuje wszelkie błędy występujące podczas jego działania za pomocą sekcji EXCEPTION. W przypadku nieoczekiwanego błędu (np. problem z zapisem w tabeli logów), wyjątek jest przechwytywany w bloku WHEN OTHERS. W takiej sytuacji:

Logowanie błędu: Błąd jest logowany w tabeli logów system\_logs, gdzie szczegóły błędu są zapisane z poziomem typu logu "ERROR". Komunikat o błędzie zawiera pełen tekst błędu uzyskany z SQLERRM.  
Przerwanie operacji: Po zapisaniu informacji o błędzie, trigger ponownie podnosi wyjątek (za pomocą RAISE), co powoduje przerwanie operacji wykonanej na tabeli products (np. dodania, zaktualizowania lub usunięcia rekordu).   
Dzięki temu, operacja nie zostaje zakończona pomyślnie, a cała transakcja jest cofana.

Przykład obsługi błędu:

EXCEPTION  
    WHEN OTHERS THEN  
        \-- Logowanie błędu do tabeli logów  
        log\_event(  
            p\_log\_type     \=\> 'ERROR',  
            p\_log\_details  \=\> 'Błąd podczas próby logowania zmian w tabeli products: ' || SQLERRM,  
            p\_product\_id   \=\> NULL  
        );  
        \-- Przerwanie wykonania operacji w przypadku błędu  
        RAISE;

Uwagi:  
Podniesienie wyjątku (RAISE) w przypadku błędu zapewnia, że zmiany w tabeli products (w tym przypadku operacje DML) nie będą zatwierdzone, jeśli wystąpią jakiekolwiek problemy z logowaniem lub innymi błędami podczas działania triggera.  
Zabezpieczenie integralności danych: Dzięki tej obsłudze błędów, transakcje pozostają spójne, a system zapewnia, że błąd w logowaniu zmian nie wpłynie na dane w tabeli produktów.

