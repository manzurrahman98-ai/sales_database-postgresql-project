# sales_database-postgresql-project
This project is designed to demonstrate how a modern sales system works at the database level. It includes a fully normalized schema, realistic sample data, and analytical SQL queries that help extract meaningful business insights such as revenue, top customers, and product performance.
# Sales PostgreSQL Database Project

## Overview
A complete relational database project built with PostgreSQL for sales analytics.

## Features
- Customers & Orders management
- Product & Category system
- Payment tracking
- Sales analytics queries

## Tech Stack
- PostgreSQL
- SQL

## How to Run
1. Create database:
   CREATE DATABASE sales_db;

2. Run schema:
   psql -d sales_db -f schema.sql

3. Insert data:
   psql -d sales_db -f data.sql

4. Run queries:
   psql -d sales_db -f queries.sql

## Author
Manzur Rahman
