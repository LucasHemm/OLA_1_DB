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
  - [Task 2](#task-2)
  - [Task 3](#task-3)
    - [Stored Procedures](#stored-procedures)
      - [register player](#register-player)
      - [joinTournament](#jointournament)
      - [submitMatchResult](#submitmatchresult)
  - [Task 4](#task-4)
  - [Task 5](#task-5)

---

## Introduction


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

## Task 2

## Task 3

### Stored Procedures

#### register player

```sql
CREATE PROCEDURE registerPlayer
    @username VARCHAR(255),
    @email VARCHAR(255),
    @ranking INT = NULL
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Players (username, email, ranking, created_at)
    VALUES (@username, @email, @ranking, GETDATE());
END;
GO
```
#### joinTournament

```sql
CREATE PROCEDURE joinTournament
    @tournament_id INT,
    @player_id INT
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO TournamentRegistrations (tournament_id, player_id, registered_at)
    VALUES (@tournament_id, @player_id, GETDATE());
END;
GO
```

#### submitMatchResult 

```sql
CREATE PROCEDURE submitMatchResult
    @tournament_id INT,
    @player1_id INT,
    @player2_id INT,
    @winner_id INT,
    @match_date DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO Matches (tournament_id, player1_id, player2_id, winner_id, match_date)
    VALUES (@tournament_id, @player1_id, @player2_id, @winner_id, @match_date);
END;
GO
```

## Task 4

## Task 5



