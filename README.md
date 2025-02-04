⚠️ **To repozytorium jest zarchiwizowane!**  
👉 Nowe repozytorium znajduje się tutaj: [app_epharmacy](https://github.com/Martin8843/app_epharmacy)




# PHARMACY

![lang](https://img.shields.io/static/v1?label=lang&message=PL/SQL&color=blue)
![lang](https://img.shields.io/static/v1?label=lang&message=SQL&color=blue)
![engine](https://img.shields.io/static/v1?label=engine&message=Oracle&color=green)
![engine-ver](https://img.shields.io/static/v1?label=version&message=18c&color=green)

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
4. [Designing database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#designing-database)
	* [Model conceptual](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-conceptual)
	* [Model logical](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-logical)
	* [Model physical](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-physical)
5. [How project is progressing](https://github.com/Martin8843/Online_Pharmacy_Data_Base#how-project-is-progressing)
	* [Features implemented](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Features-implemented)
	* [Features not implemented yet](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Features-not-implemented-yet)
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

## Designing database
The whole project can be divided into parts:
* Database schema design
* Implementation of business requirements

I've spent a lot of time to design this database relational schema according to best practices. It is compatible requirements of the third normal form (3NF). 
It contains data, dictionary and linking tables, moreover there are defined relations between tables to keep consistency and integrity of data.
Whole structure is designed to make sure there is possibility to deploy business processes and information flow.
I used `Data Modeler` to create logical and physical database model.  

### Model conceptual

This model is the starting point for the project.
The concept model allowed us to look at the database from a broader perspective.
In addition, a simplified [UML diagram](https://github.com/Martin8843/Pharmacy_Data_Base/blob/32e0900ffd9d97137adb4b0befaabded494bcea9/Concept_Diagram%20UML.drawio.png)
was made, which allowed to identify the scope of necessary data and dependencies between entities.

### Model logical

The logical model was very important from the point of view of defining business logic.
At this stage,  I normalized the tables to 3NF in the [excel file](https://github.com/Martin8843/Pharmacy_Data_Base/blob/fcf957927325ebdc9ed15017d25add4b10b8ae8c/Normalization%20Tables%20(3NF).xlsx)

![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/5b21e050-cca2-4abb-877b-b3e2f326559f)

Then I made an entity relationship diagram (ERD) and additionally described (file *.xlsx) the [relationships between entities in the model](https://github.com/Martin8843/Pharmacy_Data_Base/blob/b3a33143f34d51f7474f0169ac5003864e5066da/Description%20of%20Entity%20Relationships.xlsx).
In the [ERD diagram](https://github.com/Martin8843/Pharmacy_Data_Base/blob/b3a33143f34d51f7474f0169ac5003864e5066da/Diagram%20ER.png), tables in yellow indicate `link tables` with an m:n relationship

Finally, I wrote a conceptual [dictionary](https://github.com/Martin8843/Pharmacy_Data_Base/blob/958c9b4815fa4b06b1860ce5ad0587489a378b76/Glossary.docx)


### Model physical

At this stage, the entity-relation model was transformed into a relational model. 
(The model does not contain one `orders_payment` table, which was added later, directly to the schema).
![Relational_1](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/487d6571-aef1-476c-a02e-4c1a6041b192)

Table `orders_payment`

![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/cb5bef68-e49c-47b4-9606-3c0b1a6dd480)

The model was structured and generated as a [SQL DDL script](https://github.com/Martin8843/Pharmacy_Data_Base/blob/2e29671d6a1b1c7fc0f718d017de272f1b49669e/script%20ddl.sql) (the script is not  original form because I added `sequences` and `CONSTRAINT CHECK`)

## How project is progressing

This project is still tested and in progress

The planned and implemented mechanisms are described in the [specification](https://github.com/Martin8843/Pharmacy_Data_Base/blob/0fd992055ccb991a36317b0f4d65b67d973112c0/SPECIFICATION.docx) that I attach to the set of files.

### Features implemented

I did not have an analyst in my project, so I had to perform a business analysis and implement the logic from the technical side.
I have successfully implemented CHECK constraints, packages (with functions and procedures) triggers in my project.

Examples [CONSTRAINT CHECK](https://github.com/Martin8843/Pharmacy_Data_Base/blob/a838dcb4a3b6b4f3722a843434ada2ae40d03079/constraint%20check.sql):

* The given user's email should have the allowed character format:
  [7-10alphanumeric_characters ._-]@[3-10lowercase] characters allowed. [2-5 lowercase_letters]
* The drug strength attribute should be given in the unit mg. If there are more than one molecules, each subsequent value should be separated by /.
  For example: 100mg, 100mg/200mg, 10mg/200mg/200mg
* The entered SKU code should take a unique sequence of alphanumeric characters.
  Example format: [MAH]-[character]-[presentation]-[wholesale control number]
  e.g. [GSK]-[T]-[100]-[902] or [AP]-[KP]-[10]-[902]
  
  ![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/1e4c4ccd-ccef-40f0-967c-4169b5964d3d)
  
Programs PL/SQL:
* A mechanism for automatically marking the availability status of a product in a pharmacy, depending on the number of packages in stock, i.e. when the quantity:
	* equal to 0 pcs. then the status "Available on request"
	* less than or equal to 100 then the status "Low Out"
	* greater than 100 pcs., but less than or equal to 300 pcs. then the status "Average quantity"
	* greater than 300 pcs., then the status "Large quantity".
* The procedure for adding a new item (SKU number) to the list of items.
* Program that updates the gross price of a given product based on the given product code and the net price.
  (***If the drug is refund, use the formula calculating the amount after reimbursement in accordance with the adopted formula.
  The amount after the refund does not include VAT).
  
  ![image](https://github.com/Martin8843/Pharmacy_Data_Base/assets/133570177/4f4dcda4-a6fa-4e03-b293-c47cff6d7330)
* Reservation number generation mechanism
* Mechanism of adding next products refund to the reservation by the user  with validation (exception handling) in the event that:
	* user tries to add more than 10 items to the reservation
	* user wants to add more than 5 items of the same product.
	* product is not refunded
* Mechanism of automatic reservation handling by the system indicating the reservation status:
	* "Pharmacy pick-up" if all refund products booked are available
	* "Only on order"  if at least one selected refund product is unavailable
* A mechanism that generates a list with booking numbers, statuses and user logins for a specific time range given as input parameter values.
  (*** The program should additionally inform the non-technical user
  about entering dates in the wrong order and returning information about the number of records)
* The mechanism for generating the invoice number, which uniquely identifies it, in the format: ORDER_NR/MM/YYYY e.g. 1/01/2023
* Function that returns the names of reimbursed products and their availability statuses in order from the most expensive.

### Features not implemented yet
At the stage of my own analysis, I defined the need to introduce additional functionalities:
* The mechanism generation number order.
* The mechanism for adding next order items by the user with exception handling when:
	• user is trying to order more than 10 of the same product
* Mechanism for adding the type of delivery and payment method selected by the logged in user to the order.
* A program that calculates the cost of the user's order based on the selected delivery and the current price of the products.
* Mechanism of marking the order status:
	• "Cancelled" - if it has not been paid by the Customer within 7 calendar days from the date of its submission.
	• "Order confirmed" - if the payment was made within 7 days.
* The mechanism of adding the next item to the invoice.
* Program that returns: the sum of net sales, the sum of VAT, the total amount of gross receivables, the total number of goods sold
* Program that updates the amount due and other elements of the invoice based on the items added to the invoice. 
  The program should update the data for a specific invoice number.
## Contact
If You notice any problem please contact me. Any advices or guidance are welcome.

Martin Neręg

email: neras012@gmail.com

LinkedIn: https://www.linkedin.com/in/martin-ner%C4%99g/
