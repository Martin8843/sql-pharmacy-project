
INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Jan', 'Kowalski', 'jan.kowalski@example.com', '123456789', 'password1', TO_DATE('2024-01-12', 'YYYY-MM-DD'), 'Active', 'Client', sysdate);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Anna', 'Nowak', 'anna.nowak@example.com', '987654321', 'securepass2', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'Active', 'Client', sysdate);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Krzysztof', 'Wiśniewski', 'krzysztof.wisniewski@example.com', '564738291', 'mypassword3', TO_DATE('2023-12-01', 'YYYY-MM-DD'), 'Locked', 'Client', sysdate-32);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Magdalena', 'Kaczmarek', 'magdalena.kaczmarek@example.com', '678905432', 'supersecure4', TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Active', 'Client', sysdate-44);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Piotr', 'Lewandowski', 'piotr.lewandowski@example.com', '765432109', 'strongpass5', TO_DATE('2024-01-05', 'YYYY-MM-DD'), 'Inactive', 'Admin', sysdate);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Ewa', 'Zielińska', 'ewa.zielinska@example.com', '908172635', 'pass12345', TO_DATE('2023-11-28', 'YYYY-MM-DD'), 'Active', 'Client', sysdate-100);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Marek', 'Wojciechowski', 'marek.wojciechowski@example.com', '124578963', 'complexpass6', TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Active', 'Admin', sysdate-33);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Karolina', 'Szymańska', 'karolina.szymanska@example.com', '123098765', 'password7', TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Inactive', 'Client', sysdate);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Tomasz', 'Kozłowski', 'tomasz.kozlowski@example.com', '908765432', 'mypassword8', TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Active', 'Client', sysdate-20);

INSERT INTO users (first_name, last_name, email, phone, password, reg_date, account_status, role, created_at)
VALUES ('Joanna', 'Król', 'joanna.krol@example.com', '761092345', 'securepass9', TO_DATE('2024-03-22', 'YYYY-MM-DD'), 'Locked', 'Admin', sysdate-8);
