# 📚 Library Database Management using SQL

This project demonstrates the creation and management of a **Library Database System** using SQL.  
It was developed as part of the **Database System Lab (CSE 210)** course at **Green University of Bangladesh**.

The lab focuses on implementing **database constraints, table relationships, and schema modifications using ALTER commands**.


# 🎯 Objectives

The main objectives of this lab experiment were:

- Create a database named **library_lab**
- Create tables **MEMBER**, **BOOK**, and **LOAN**
- Apply important database constraints:
  - Primary Key
  - Foreign Key
  - UNIQUE
  - CHECK
- Insert sample data into tables
- Test errors for invalid data
- Modify table structures using **ALTER TABLE**
- Rename tables and modify existing columns

---

# 🗄️ Database Structure

The database contains three main tables:

### 1️⃣ MEMBER Table

Stores information about library members.

| Column | Description |
|------|-------------|
| MemberID | Unique ID for each member (Primary Key) |
| FullName | Member name |
| Email | Unique email address |
| Age | Member age (must be ≥ 12) |
| Gender | Gender of member |

Constraints used:

- PRIMARY KEY
- UNIQUE
- CHECK

---

### 2️⃣ BOOK Table

Stores information about books available in the library.

| Column | Description |
|------|-------------|
| BookID | Unique book ID |
| Title | Book title |
| ISBN | Unique ISBN number |
| Price | Book price |
| Book_Status | Availability status |

Constraints used:

- PRIMARY KEY
- UNIQUE
- DEFAULT value

---

### 3️⃣ LOAN Table

Stores records of borrowed books.

| Column | Description |
|------|-------------|
| LoanID | Unique loan ID |
| MemberID | Reference to MEMBER table |
| BookID | Reference to BOOK table |

Constraints used:

- PRIMARY KEY
- FOREIGN KEY

---

# 💻 SQL Implementation

### Create Database

```sql
CREATE DATABASE library_lab;
USE library_lab;
