# PHARMACY

![lang](https://img.shields.io/static/v1?label=lang&message=PL/SQL&color=blue)
![lang](https://img.shields.io/static/v1?label=lang&message=SQL&color=blue)
![engine](https://img.shields.io/static/v1?label=engine&message=Oracle&color=green)
![engine-ver](https://img.shields.io/static/v1?label=version&message=19c&color=green)

---

### This project is still tested and in progress.

## Table of Contents
1. [About](https://github.com/Martin8843/Online_Pharmacy_Data_Base#about)
2. [Built With](https://github.com/Martin8843/Online_Pharmacy_Data_Base#built-with)
	* [Tools](https://github.com/Martin8843/Online_Pharmacy_Data_Base#tools)
3. [Getting started](https://github.com/Martin8843/Online_Pharmacy_Data_Base#getting-started)
	* [Prerequisites](https://github.com/Martin8843/Online_Pharmacy_Data_Base#prerequisites)
	* [Installing SQL Developer on Windows](https://github.com/Martin8843/Online_Pharmacy_Data_Base#installing-sql-developer-on-windows)
	* [Connecting to database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#connecting-to-database)
4. [How to use this database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#how-to-use-this-database)
5. [How project is progressing](https://github.com/Martin8843/Online_Pharmacy_Data_Base#how-project-is-progressing)
	* [Designing database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#designing-database)
	* [Populating database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#populating-database)
	* [Features ](https://github.com/Martin8843/Online_Pharmacy_Data_Basee#features)
6. [Known issues](https://github.com/Martin8843/Online_Pharmacy_Data_Base#known-issues)
7. [Contact](https://github.com/Martin8843/Online_Pharmacy_Data_Base#contact)

## About
    
It is a project of transactional database for stationary and online pharmacy which sells medical products. 

The main goals of this project are:

1. Learning how to design a database.
2. Learning how to code and solve problems in Oracle database environment using PL/SQL.
3. Use it to get hired as a developer.

## Built with
    
Oracle technology is used to design, populate and deploy main features.
    
### Tools:

* `Oracle Database 18c Express Edition`
* `PL/SQL`
* `SQL`
* `Data Modeler`
* `SQL Developer`
*  `draw.io - creating UML diagrams`

## Getting started
### Prerequisites
1. To download `SQL Developer` You need a free `Oracle Account`. You can create one here.
2. `SQL Developer` is an Oracle's cross-platform client application designed for working with databases. You can download it here from Oracle's website.
It's important to work with tool which can present basic graphical table schema of database.
3. In order to transform the logical model into a relational model, it is recommended to use the `SQL Data Modeler` software.

### Installing SQL Developer on Windows
Process of instalation is quite simple, but if You would have a problem here is documentation on the subject.

### Connecting to database
1. I have created a user with restricted privileges and with password on subjected database
* user: apteka
* password: apteka
2. Run SQL Developer
At the left side of the window You should see the pane named Connections.

![image](https://github.com/Martin8843/Online_Pharmacy_Data_Base/assets/133570177/6df3896e-d536-4be4-801f-20f1a174ccae)

3. If not, click option 'View' on main option bar then choose Connections from the menu.

![image](https://github.com/Martin8843/Online_Pharmacy_Data_Base/assets/133570177/cbe6fbc6-e4df-4197-92b9-09d5ea824321)

4. Now lets set the connection

* Choose your name for the connection and type it into Name field.
* Database Type leave as Oracle
* Authentication Type leave as default
* For Username type: apteka
* For Password type: apteka
* Role leave as it is (default)
For Connection Type choose Basic
Details
* Hostname: localhost
* Port: 1521
	* Service name: xepdb1
Click 'Test' button and You should see the message Status : Success.

![image](https://github.com/Martin8843/Online_Pharmacy_Data_Base/assets/133570177/875e080e-644b-473c-9491-4a2b6274404e)

If it's succeded then click Save to save the connection in the Connections pane, then Connect. Now You are connected with Computer_Store database.

5. To see a graphical list of Pharmacy tables, expand the menu of the newly created user (Connections panel), and then expand the Tables list.

![image](https://github.com/Martin8843/Online_Pharmacy_Data_Base/assets/133570177/43697008-7697-4621-92e8-b2aa358e753d)

## How to use this database
* query the database using **select** statement  
there's no need to refer to *apteka* schema because all tables have been aliased
```sql
select *
from products
```
* currently, the functionality and business requirements have been implemented:
1. [Constraint CHECK](https://github.com/Martin8843/Online_Pharmacy_Data_Base/blob/bc03db4f12ad39bf6935928189943325cc6040f3/constraint%20check.sql)
* The entered SKU should take a unique sequence of alphanumeric characters. Example format:
[MAH]-[character]-[presentation]-[wholesale control number] e.g. [GSK]-[T]-[100]-[902] or [AP]-[KP]-[10]-[902]
![image](https://github.com/Martin8843/Online_Pharmacy_Data_Base/assets/133570177/4aba4db0-fd9d-4b1c-9e93-c27daafb5268)
* The short name of the product in stock should meet the following condition:
PRODUCTNAME_MOCLEK_PRESENTATION e.g. AMLOZEK_10_10
* The entered order status can only accept names with a capital letter
* The entered EAN product code must consist of 13 numerical characters and start with the prefix 590 specifying the sales market.
* The product may be in the form and start with a capital letter:
Tablet, Solution, Drops, Syrup, Lipstick, Suspension, Liquid, Ointment, Cream, Paste, Please, Capsule
* The drug strength attribute should be given in the unit of mg. If there are more than one molecules, each subsequent value should be separated by /. For example: 100mg, 100mg/200mg, 10mg/200mg/200mg
* Product availability status in a pharmacy should be named: Na wyczerpaniu, Średnia ilość, Dostępny na zamówienie, Duża ilość
* The name and surname of the entered user should start with a capital letter
* The user's e-mail address should have the allowed character format:
  [7-10alphanumeric_characters allowed characters . -]@[3-10lowercase_letters]. [2-5 lowercase_letters] e.g. Maciejdom5@gmail.com
* The user's phone number should be in the following format:
  [0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9] e.g. 949 -333-384
* The product category should have four specific VAT rates: 0, 5, 8, 23
* Reservations should have the following statuses:
NEW,ANULOWANIE, ZREALIZOWANA, DO ODBIORU W APTECE, NA ZAMÓWIENIE, OCZEKUJE NA ZATWIERDZENIE UŻYTKOWNIKA, ZATWIERDZONE PRZEZ UŻYTKOWNIKA
* The base should accept the following forms of delivery: Kurier DPD, DPD Pick up, Paczkomat Inpost, Odbiór własny
* The identifier of the warehouse operation should comply with the following format:
[3 alphanumeric characters] [2 numeric characters] e.g. PSP34
2. [Views](https://github.com/Martin8843/Online_Pharmacy_Data_Base/blob/2199cfeeebf5c156383db1a9833cd331c50a8449/views.sql)
o Searching for current expired goods or those whose expiry date ends in six months
o Search only current refunded products (Rx)
o Searching for the current number of products by their category, the quantity of which is running out in the pharmacy.



