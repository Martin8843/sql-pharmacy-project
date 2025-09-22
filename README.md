PHARMACY

![lang](https://img.shields.io/static/v1?label=lang&message=PL/SQL&color=blue)
![lang](https://img.shields.io/static/v1?label=lang&message=SQL&color=blue)
![engine](https://img.shields.io/static/v1?label=engine&message=Oracle&color=green)
![engine-ver](https://img.shields.io/static/v1?label=version&message=18c&color=green)

---

## Table of Contents
1. [About](https://github.com/Martin8843/Online_Pharmacy_Data_Base#about)
2. [Built With](https://github.com/Martin8843/Online_Pharmacy_Data_Base#built-with)
	* [Tools](https://github.com/Martin8843/Online_Pharmacy_Data_Base#tools)
3. [Getting started](https://github.com/Martin8843/Online_Pharmacy_Data_Base#getting-started)
	* [Installing SQL Developer on Windows](https://github.com/Martin8843/Online_Pharmacy_Data_Base#installing-sql-developer-on-windows)
	* [Connecting to database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#connecting-to-database)
4. [Designing database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#designing-database)
	* [Model conceptual](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-conceptual)
	* [Model logical](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-logical)
	* [Model physical](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-physical)
5. [How project is progressing](https://github.com/Martin8843/Online_Pharmacy_Data_Base#how-project-is-progressing)
	* [Features implemented](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Features-implemented)
6. [Contact](https://github.com/Martin8843/Online_Pharmacy_Data_Base#contact)

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
1. To download SQL Developer You need a free Oracle Account. You can create one here.
2. SQL Developer is an Oracle's cross-platform client application designed for working with databases. You can download it here from Oracle's website.
  It's important to work with tool which can present basic graphical table schema of database.
3. In order to transform the logical model into a relational model, it is recommended to use the SQL Data Modeler software.

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

## Designing database
The project is divided into two main parts:

* Database schema design

* Implementation of business requirements

The relational schema was designed following best practices and adheres to the third normal form (3NF). It includes data, dictionary, and linking tables, with relationships defined to ensure consistency and data integrity. The structure supports business processes and information flow.
I used Data Modeler to create both logical and physical database models.

### Model conceptual
The conceptual model serves as the starting point of the project, providing a broad overview of the database.
A simplified [UML diagram](https://github.com/Martin8843/Pharmacy_Data_Base/blob/32e0900ffd9d97137adb4b0befaabded494bcea9/Concept_Diagram%20UML.drawio.png)
was created to define the scope of required data and the relationships between entities.

### Model logical

The logical model played a key role in defining the business logic.
At this stage, I normalized the tables to 3NF, as documented in this [excel file ](https://github.com/Martin8843/Pharmacy_Data_Base/blob/fcf957927325ebdc9ed15017d25add4b10b8ae8c/Normalization%20Tables%20(3NF).xlsx)

![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/5b21e050-cca2-4abb-877b-b3e2f326559f)

I then created an Entity Relationship Diagram (ERD) and documented the relationships between entities
 in an Excel file [relationships between entities in the model](https://github.com/Martin8843/Pharmacy_Data_Base/blob/b3a33143f34d51f7474f0169ac5003864e5066da/Description%20of%20Entity%20Relationships.xlsx).
In the [ERD diagram](https://github.com/Martin8843/Pharmacy_Data_Base/blob/b3a33143f34d51f7474f0169ac5003864e5066da/Diagram%20ER.png), tables in yellow indicate `link tables` with an m:n relationship

Finally, I created a conceptual [dictionary](https://github.com/Martin8843/Pharmacy_Data_Base/blob/958c9b4815fa4b06b1860ce5ad0587489a378b76/Glossary.docx)


### Model physical

At this stage, the entity-relationship model was transformed into a relational model.
(The orders_payment table was not included in the original model and was added later directly to the schema).
![Relational_1](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/487d6571-aef1-476c-a02e-4c1a6041b192)

Table `orders_payment`

![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/cb5bef68-e49c-47b4-9606-3c0b1a6dd480)

The model was structured and generated as a [SQL DDL script](https://github.com/Martin8843/Pharmacy_Data_Base/blob/2e29671d6a1b1c7fc0f718d017de272f1b49669e/script%20ddl.sql) (the script is not  original form because I added `sequences` and `CONSTRAINT CHECK`)

## How project is progressing

This project is still tested and in progress

The planned and implemented mechanisms are described in the [specification](https://github.com/Martin8843/Pharmacy_Data_Base/blob/0fd992055ccb991a36317b0f4d65b67d973112c0/SPECIFICATION.docx) that I attach to the set of files.

### Features implemented

Since there was no analyst involved, I conducted the business analysis myself and implemented the logic from the technical side.
In this project, I successfully implemented CHECK constraints, packages (with functions and procedures), and triggers.

Examples [CONSTRAINT CHECK](https://github.com/Martin8843/Pharmacy_Data_Base/blob/a838dcb4a3b6b4f3722a843434ada2ae40d03079/constraint%20check.sql):

* The user’s email must follow the allowed character format:
[7–10 alphanumeric characters ._-]@[3–10 lowercase letters].[2–5 lowercase letters]

* The drug strength attribute must be given in milligrams (mg).
If there is more than one molecule, each subsequent value must be separated by /.
Examples: 100mg, 100mg/200mg, 10mg/200mg/200mg

* The SKU code must be a unique sequence of alphanumeric characters.
Format: [MAH]-[character]-[presentation]-[wholesale control number]
Examples: [GSK]-[T]-[100]-[902], [AP]-[KP]-[10]-[902]
  
  ![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/1e4c4ccd-ccef-40f0-967c-4169b5964d3d)
  
Programs PL/SQL:
* Automatic product availability status
A mechanism that assigns availability status based on stock quantity:
	*  0 pcs. → Available on request
	* ≤ 100 pcs. → Low Out
	* 101–300 pcs. → Average quantity
	* > 300 pcs. → Large quantity

* Procedure for adding a new item
Inserts a new product (SKU number) into the product list.

* Gross price update procedure
Updates the gross price of a product based on its SKU and net price.
If the product is reimbursed, applies a formula to calculate the post-reimbursement price.
The reimbursement calculation excludes VAT.
  ![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/4f4dcda4-a6fa-4e03-b293-c47cff6d7330)
  
* Reservation number generator
Creates a unique reservation number for each new reservation.

* Reservation refund validation
Adds reimbursed products to a reservation with exception handling in cases when:
user tries to add more than 10 items per reservation
user tries to add more than 5 units of the same product
product is not reimbursed

* Automatic reservation status
The system automatically sets the reservation status based on product availability:
Pharmacy pick-up – all reimbursed products are available
Only on order – at least one reimbursed product is unavailable

* Reservation report generator
Produces a list of reservations with booking numbers, statuses, and user logins within a given time range.
Includes validation for incorrect date order and informs the user about the number of returned records.

* Invoice number generator
Creates unique invoice numbers in the format:
ORDER_NR/MM/YYYY → e.g. 1/01/2023

* Reimbursed products function
Returns a list of reimbursed products with their availability statuses, sorted by price (descending).

## Contact
If You notice any problem please contact me. Any advices or guidance are welcome.

Martin Neręg

email: neras012@gmail.com

LinkedIn: https://www.linkedin.com/in/martin-ner%C4%99g/
