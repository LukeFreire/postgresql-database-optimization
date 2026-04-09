# PostgreSQL Database Optimization Through Normalization and Indexing

This project focuses on optimizing a relational database by applying normalization (up to Third Normal Form) and indexing strategies to improve query performance.

## Overview
A dataset consisting of customers, products, and orders was imported into PostgreSQL. The data was analyzed, normalized, and optimized to reduce redundancy and improve efficiency.

## Key Work
- Imported unnormalized CSV datasets into PostgreSQL
- Analyzed data for redundancy and anomalies
- Normalized schema to 1NF, 2NF, and 3NF
- Designed relational tables with proper dependencies
- Implemented indexing strategies for performance optimization
- Measured query performance before and after indexing

## Project Structure
- `/data` → CSV datasets (customers, products, orders)
- `/sql` → SQL scripts for setup, normalization, indexing, and queries
- `/screenshots` → query results and performance outputs
- `report.pdf` → detailed explanation of the process and analysis

## Performance Results
Query performance improved after indexing:
- Orders by customer: 2.308ms → 0.134ms
- Orders by date range: improved
- Revenue per product: minimal improvement due to joins and aggregation

## How to Run
1. Install PostgreSQL
2. Create a new database
3. Run the SQL scripts in order:
   - `01_initial_setup.sql`
   - `02_normalization.sql`
   - `03_indexing_and_queries.sql`
4. Ensure CSV files are located in the `/data` folder

## Note
If the `COPY` command fails due to file path issues, update the file path to match your local system.

## Tools Used
- PostgreSQL
- DBeaver
- SQL

## Purpose
This project demonstrates practical experience in database design, normalization, indexing, and performance optimization.
