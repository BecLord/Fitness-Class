# Fitness Class Database

A relational database design project for a fitness centre. The database manages
staff, members, fitness classes, and class bookings.

This project was created for the Introduction to Databases module during the
second semester of my first year.

## Features

- Staff and instructor information
- Member and membership details
- Fitness class schedules and rooms
- Member-class bookings
- Primary, foreign, and candidate keys
- One-to-many and many-to-many relationships
- Example joins and aggregate queries

## Technologies

- MySQL
- SQL
- MySQL Workbench

## Database Structure

```text
Staff ─────< Fitness Class >──── Bookings ───── Member
```

The database contains four main entities:

| Entity | Description |
|---|---|
| `staff` | Staff details and positions |
| `member` | Member details and membership information |
| `fitness_class` | Class schedules, rooms, and assigned instructors |
| `bookings` | Links members to the fitness classes they have booked |

### Relationships

- **Staff to Fitness Class — one-to-many**  
  A staff member can instruct multiple classes, while each class has one
  instructor.

- **Member to Fitness Class — many-to-many**  
  A member can book multiple classes, and a class can have multiple members.

  The `bookings` table acts as a junction table for this relationship.

## Prerequisites

- MySQL or MariaDB
- A SQL client such as MySQL Workbench
- Optional: Git

## Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/BecLord/Fitness-Class.git
   cd Fitness-Class
   ```

2. Open MySQL Workbench or another MySQL client.

3. Execute [`FitnessClass.sql`](./FitnessClass.sql).

The script:

- Creates the `fitness4life` database
- Creates and populates the required tables
- Contains example queries

> **Note:** Review the script before running it because it may overwrite or
> recreate existing tables.

## Example Queries

The SQL script demonstrates how to:

- List fitness classes with their instructors
- Count the members booked into each class
- Find annual members and their classes
- List instructors and the classes they teach
- Use table joins and aggregate functions

## Key SQL Concepts

- Primary and foreign keys
- Candidate keys
- Entity relationships and multiplicities
- Bridge tables
- Inner joins
- Aggregate queries
- SQL `GROUP BY` and aggregate functions
