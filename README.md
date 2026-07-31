# Database Design Project

This repository contains a small MySQL database for customers, credit cards, products, purchases, and purchase items. It also includes sample data, an entity-relationship diagram, and a Python script that verifies the database connection.

## Repository contents

```text
.
|-- db-schema.sql              # Creates the database tables
|-- seed-data.sql              # Inserts sample products, purchases, and items
|-- logic.py                   # Connects to MySQL and prints a success message
`-- ER Diagrams/
    |-- ER-Diagram.drawio      # Editable draw.io source
    `-- ER-Diagram.png         # Diagram image
```

## Requirements

- MySQL Server 8.0 or newer
- MySQL client (`mysql` command)
- Python 3.9 or newer
- `mysql-connector-python`

The instructions below use Windows PowerShell. They assume the MySQL user is `root`, MySQL is running locally, and the server listens on port `3306`.

## Install MySQL

1. Download **MySQL Installer for Windows** from [mysql.com/downloads](https://dev.mysql.com/downloads/installer/).
2. Choose the Developer Default setup, or install at least **MySQL Server** and **MySQL Shell/Client**.
3. During configuration, choose a root password. The sample `logic.py` expects the password `root`; use that password for the simplest setup, or update `logic.py` later.
4. Leave the default port as `3306` and configure MySQL to run as a Windows service.

Check the installation from PowerShell:

```powershell
mysql --version
```

If `mysql` is not recognized, run it using the full path, commonly:

```powershell
& 'C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe' --version
```

If you use a non-root MySQL user, replace the username, password, and database values in `logic.py` before running it.

## Create the local database

Open a MySQL session as an administrator:

```powershell
mysql -u root -p
```

Enter the root password when prompted, then create the database:

```sql
CREATE DATABASE finaldb;
EXIT;
```

From the repository root, load the schema:

```powershell
mysql -u root -p finaldb < db-schema.sql
```

The schema creates these tables:

| Table | Purpose |
| --- | --- |
| `Customer` | Stores customer IDs. |
| `Credit_Card` | Stores credit-card numbers. |
| `Product` | Stores product names, prices, and stock amounts. |
| `Purchase` | Links a customer and credit card to a purchase and status. |
| `Item` | Links purchases to products and stores quantities. |

`Item` uses `(Purchase_ID, Product_ID)` as a composite primary key. `Purchase` references `Customer` and `Credit_Card`; `Item` references `Purchase` and `Product`.

## Seed the database

Load the complete sample dataset, including customers and credit cards:

```powershell
mysql -u root -p finaldb < seed-data.sql
```

The sample data contains six customers, six credit cards, ten products, ten purchases, and twenty purchase items. The credit-card values are test data only.

To confirm that the data loaded:

```powershell
mysql -u root -p finaldb -e "SELECT * FROM Product; SELECT * FROM Purchase; SELECT * FROM Item;"
```

## Run the Python console application

Create or activate a virtual environment if desired, then install the only Python dependency:

```powershell
python -m venv .venv
```

Activate it in Windows PowerShell:

```powershell
.\.venv\Scripts\Activate.ps1
```

Install the connector and run the application:

```powershell
python -m pip install mysql-connector-python
python logic.py
```

After connecting, the menu supports:

- viewing all products or searching by name and maximum price;
- adding a product;
- viewing a customer's orders.

`logic.py` currently connects with these hard-coded settings:

```text
host: localhost
port: 3306
user: root
password: root
database: finaldb
```

If your MySQL password or connection settings differ, edit the `mysql.connector.connect(...)` call in `logic.py` before running it. The application does not create tables or seed data; run the schema and seed steps first.

## Reset the local database

To remove and recreate this development database, run the following from a MySQL session:

```sql
DROP DATABASE finaldb;
CREATE DATABASE finaldb;
EXIT;
```

Then repeat the schema and seed steps above. Do not run this against a database containing data you need to keep.

## Troubleshooting

- **`mysql` is not recognized:** add the MySQL `bin` directory to `PATH`, or use the full path to `mysql.exe` on Windows.
- **Connection refused:** confirm the MySQL service is running and that port `3306` is available.
- **Access denied:** verify the username and password, then make the same values match `logic.py`.
- **Foreign-key errors while seeding:** load `db-schema.sql` first, then run the complete `seed-data.sql` file.
- **`ModuleNotFoundError: mysql`:** run `python -m pip install mysql-connector-python` in the same Python environment used to run `logic.py`.
