# Smart IoT Market - Database Testing & Validation

## 📌 Project Overview
This repository contains the relational database schema and functional testing scripts for a "Smart IoT Market" system. The project integrates traditional retail inventory management with IoT sensor data to monitor product safety (e.g., refrigerator temperatures). The primary objective of this repository is to showcase backend **Database Testing**, focusing on data integrity, relational constraints, and automated trigger validation.

## 🛠️ Tech Stack & Tools
* **Database Management System:** MySQL
* **Testing Type:** Backend / Database Testing, Data Integrity Validation
* **Languages:** SQL (DDL, DML, TCL)

## 🗄️ Database Architecture
The database (`SmartIoTMarket`) consists of 5 interconnected tables designed with strict referential integrity[cite: 1]:
1. **`Categories` & `Products`:** Manages the store's inventory and categorization[cite: 1].
2. **`Sensors`:** Tracks IoT temperature sensors deployed across different market locations (e.g., freezers, fridges)[cite: 1].
3. **`Temp_Logs`:** Records real-time temperature readings linked to specific sensors[cite: 1].
4. **`Alert_Tasks`:** Logs automated emergency tasks and system warnings[cite: 1].

## 🎯 Testing Scope & Scenarios
As part of the Quality Assurance process, the following database components were rigorously tested:

* **Referential Integrity Validation:** Verified Primary Key (PK) and Foreign Key (FK) constraints across all tables to prevent orphan records and ensure data consistency[cite: 1].
* **Cascading Deletions:** Tested the `ON DELETE CASCADE` rule between the `Sensors` and `Temp_Logs` tables to ensure dependent logs are automatically removed when a sensor is decommissioned[cite: 1].
* **Automated Trigger Validation:** Verified the core business logic handled by the `check_temp_anomaly` trigger. Tested boundary values to ensure that any temperature log exceeding the maximum allowed threshold ( > 5°C) successfully and instantly generates an emergency record in the `Alert_Tasks` table[cite: 1].

## 📁 Repository Structure
* `Smartiotmarket ِ AboElkher.sql`: The main SQL script containing the database schema, table creations, relationships, and triggers[cite: 1].

## 🚀 How to Run the Tests
1. Open your preferred MySQL client (e.g., MySQL Workbench, phpMyAdmin, or CLI).
2. Execute the `Smartiotmarket ِ AboElkher.sql` script to build the database architecture[cite: 1].

## 📬 Contact
**Mahmoud Abo Elkher Mohammad**
* **Role:** Junior Software Quality Engineer
* **LinkedIn:** https://www.linkedin.com/in/mahmoud-abo-elkher
* **Email:** http:// aboelkher602@gmail.com
