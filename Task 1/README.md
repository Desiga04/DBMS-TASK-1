# Task 1 – Requirement Analysis and Customer Database Module

## Objective
Analyze the business requirements of the E-Commerce Order Management System and define the Customer database module.

## Functional Requirements
1. Register and store customer details.
2. Maintain unique customer email addresses.
3. Store customer phone and address information.
4. Allow customer records to be updated.
5. Allow customer records to be deleted when appropriate.
6. Support customer order history through the Orders relationship.

## Non-Functional Requirements
- Data integrity through primary and unique keys.
- Consistent relational design using foreign keys in dependent modules.
- Queries should be simple and efficient for normal CRUD/reporting operations.
- Customer passwords, if authentication is later added, must be stored as secure hashes rather than plaintext.

## Main Entity
**Customer**: customer_id, first_name, last_name, email, phone, address, city, state, postal_code, created_at.

## Relationships
- Customer 1 : Many Orders
- Customer 1 : Many Reviews
- Customer 1 : Many Payments through customer orders

## Scope
This folder contains the requirement specification and Customer table SQL. Tasks 2–6 extend the same E-Commerce Order Management database.
