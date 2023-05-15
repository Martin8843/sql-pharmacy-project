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
4. [Designing database](https://github.com/Martin8843/Online_Pharmacy_Data_Base#designing-database)
	* [Model conceptual](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-conceptual)
	* [Model logical](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-logical)
	* [Model physscal](https://github.com/Martin8843/Online_Pharmacy_Data_Base#Model-physical)
5. [How project is progressing](https://github.com/Martin8843/Online_Pharmacy_Data_Base#how-project-is-progressing)
	* [Features completed](https://github.com/Martin8843/Online_Pharmacy_Data_Basee#features)
	* [Features not completed](https://github.com/Martin8843/Online_Pharmacy_Data_Basee#features)
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

## Designing database
The whole project can be divided into parts:
* Database schema design
* Implementation of business requirements

I've spent a lot of time to design this database relational schema according to best practices. It is compatible requirements of the third normal form (3NF). 
It contains data, dictionary and linking tables, moreover there are defined relations between tables to keep consistency and integrity of data.
Whole structure is designed to make sure there is possibility to deploy business processes and information flow.
I used `Data Modeler` to create logical and physical database model.  

### Model conceptual



