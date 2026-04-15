# Periodic Table Database CLI

A simple Bash script that queries a PostgreSQL database to retrieve information about chemical elements.

## 📌 Description

This project is a command-line tool written in Bash that looks up chemical element data from a PostgreSQL database.  
You can search for an element by:

- Atomic number (e.g. `1`)
- Symbol (e.g. `H`)
- Name (e.g. `Hydrogen`)

The script prints formatted information about the matching element.

---

## 🚀 Usage

Run the script with one argument:

```bash
./element.sh <argument>
```

### Examples

```bash
./element.sh 1
./element.sh H
./element.sh Hydrogen
```

### Example Output

```
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

---

## 🛠️ Requirements

- Bash
- PostgreSQL (`psql` CLI)
- A running PostgreSQL server

---

## 🗄️ Database Setup

A database dump is included:

```
periodic_table.sql
```

### 1. Create the database

```bash
createdb periodic_table
```

### 2. Import the schema and data

```bash
psql -d periodic_table -f periodic_table.sql
```

> 💡 If your PostgreSQL setup uses a specific user, add `-U <username>` to the commands above.

---

## ⚙️ Configuration

By default, the script connects like this:

```bash
psql --dbname=periodic_table
```

If your local PostgreSQL setup requires a specific user, update the `PSQL` variable in `element.sh`:

```bash
PSQL="psql --username=<your_username> --dbname=periodic_table -t --no-align -c"
```

---

## 📂 Project Structure

```
.
├── element.sh           # Main Bash script
├── periodic_table.sql   # Database dump
└── README.md
```

---

## ⚠️ Notes

- The script assumes that user input is safe and does not implement full SQL injection protection.
- Designed for educational purposes, not production use.
- Output formatting matches project requirements from FreeCodeCamp.

---

## 📖 What I Learned

- Writing Bash scripts with arguments and functions
- Querying PostgreSQL from the command line
- Using JOINs to combine data from multiple tables
- Parsing query output in Bash
- Structuring commits using conventional commit messages

