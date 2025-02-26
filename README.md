# OLA_1_DB

## Table of Contents
- [OLA\_1\_DB](#ola_1_db)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Task 1](#task-1)
    - [Datamodel](#datamodel)
      - [Players](#players)
      - [Tournaments](#tournaments)
      - [Tournament Registrations](#tournament-registrations)
      - [Matches](#matches)
    - [SQL Script](#sql-script)

---

## Introduction

*Provide a brief overview of the OLA_1_DB project here.*

---

## Task 1

### Datamodel

#### Players

| Column      | Datatype       | Description             | Constraints                    |
|-------------|----------------|-------------------------|--------------------------------|
| `player_id` | INT            | Unique identifier       | Primary Key, Auto Increment    |
| `username`  | VARCHAR(255)   | Player's username       | NOT NULL, Unique               |
| `email`     | VARCHAR(255)   | Player's email address  | NOT NULL, Unique               |
| `ranking`   | INT            | Player's ranking score  |                                |
| `created_at`| DATETIME       | Timestamp of creation   | NOT NULL                       |

#### Tournaments

| Column         | Datatype       | Description                                      | Constraints                    |
|----------------|----------------|--------------------------------------------------|--------------------------------|
| `tournament_id`| INT            | Unique identifier for the tournament           | Primary Key, Auto Increment    |
| `name`         | VARCHAR(255)   | Name of the tournament                           | NOT NULL, Unique               |
| `game`         | VARCHAR(255)   | Game associated with the tournament              | NOT NULL                       |
| `max_players`  | INT            | Maximum number of players allowed in the tournament | NOT NULL                   |
| `start_date`   | DATE           | Date when the tournament begins                  | NOT NULL                       |
| `created_at`   | DATETIME       | Timestamp of tournament record creation          | NOT NULL                       |

#### Tournament Registrations

| Column            | Datatype    | Description                                         | Constraints                                        |
|-------------------|-------------|-----------------------------------------------------|----------------------------------------------------|
| `registration_id` | INT         | Unique identifier for the registration            | Primary Key, Auto Increment                        |
| `tournament_id`   | INT         | Identifier of the tournament                        | Foreign Key (Tournaments), NOT NULL                |
| `player_id`       | INT         | Identifier of the player                            | Foreign Key (Players), NOT NULL                    |
| `registered_at`   | DATETIME    | Timestamp when the registration was made            | NOT NULL                                           |

#### Matches

| Column         | Datatype    | Description                                           | Constraints                                          |
|----------------|-------------|-------------------------------------------------------|------------------------------------------------------|
| `match_id`     | INT         | Unique identifier for the match                       | Primary Key, Auto Increment                          |
| `tournament_id`| INT         | Identifier of the tournament                          | Foreign Key (Tournaments), NOT NULL                  |
| `player1_id`   | INT         | Identifier for the first player                       | Foreign Key (Players), NOT NULL                      |
| `player2_id`   | INT         | Identifier for the second player                      | Foreign Key (Players), NOT NULL                      |
| `winner_id`    | INT         | Identifier of the winning player                      | Foreign Key (Players)                                |
| `match_date`   | DATETIME    | Date and time when the match was played               | NOT NULL                                             |

### SQL Script

*Include your SQL script here.*
