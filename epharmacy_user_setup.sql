--Utworzenie nowego użytkownika:
CREATE USER PDB2_epharmacy IDENTIFIED BY apteka1234
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp;


-- Przyznanie uprawnień do logowania oraz tworzenia obiektów
GRANT CONNECT TO PDB2_epharmacy;

-- Uprawnienia do sesji
GRANT CREATE SESSION TO PDB2_epharmacy;


-- po wykonaniu powyższych tworzymy połączenie w sql developer


-- Uprawnienia do korzystania z przestrzeni tabel
GRANT UNLIMITED TABLESPACE TO PDB2_epharmacy;

-- Uprawnienia do zmiany konfiguracji sesji 
GRANT ALTER SESSION TO PDB2_epharmacy; 

-- Zapobieganie wymuszaniu zmiany hasła
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED; 

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
GRANT CREATE SEQUENCE TO PDB2_epharmacy;

-- Tworzenie indeksów na dowolnych tabelach w bazie danych
GRANT CREATE ANY INDEX TO PDB2_epharmacy;

-- Zarządzanie strukturą na dowolnych tabelach 
GRANT ALTER ANY TABLE TO PDB2_epharmacy; 
GRANT CREATE TYPE TO PDB2_epharmacy;

-- Przyznanie uprawnień do tworzenia obiektów w tabelach
GRANT CREATE TABLE TO PDB2_epharmacy;

-- Przyznanie uprawnień do tworzenia widoków
GRANT CREATE VIEW TO PDB2_epharmacy;

-- Przyznanie uprawnień do tworzenia procedur, funkcji i triggerów
GRANT CREATE PROCEDURE TO PDB2_epharmacy;
GRANT CREATE TRIGGER TO PDB2_epharmacy;

-- Przyznanie uprawnień do zarządzania indeksami
GRANT CREATE ANY INDEX TO PDB2_epharmacy;

-- Przyznanie uprawnień do przydzielania uprawnień innym użytkownikom, jeśli to potrzebne
GRANT ALTER SESSION TO PDB2_epharmacy;