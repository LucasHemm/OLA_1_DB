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
    - [Functions](#functions)
      - [getTotalWins](#gettotalwins)
      - [getTournamentStatus](#gettournamentstatus)
    - [Triggers](#triggers)
      - [beforeInsertRegistration](#beforeinsertregistration)
      - [afterInsertMatch](#afterinsertmatch)
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
[SQL Script](./OLA1_DB_Script&TestData.sql)


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

### Functions

#### getTotalWins

```sql
CREATE FUNCTION getTotalWins
(
    @player_id INT
)
RETURNS INT
AS
Begin
    DECLARE @totalWins INT;
    SELECT @totalWins = COUNT(*) FROM Matches WHERE winner_id = @player_id;
    RETURN @totalWins;
END;
GO
```

#### getTournamentStatus

```sql
CREATE FUNCTION getTournamentStatus
(
    @tournament_id INT
)
RETURNS VARCHAR(255)
AS
BEGIN
    DECLARE @status VARCHAR(255);
    DECLARE @start_date DATE;

    SELECT @start_date = start_date
    FROM Tournaments
    WHERE tournament_id = @tournament_id;

    -- Check if the tournament exists
    IF (@start_date IS NULL)
    BEGIN
        SET @status = 'Tournament Not Found';
    END
    -- Tournament hasn't started yet
    ELSE IF (GETDATE() < @start_date)
    BEGIN
        SET @status = 'Upcoming';
    END
    -- Tournament is ongoing (within 7 days after the start date)
    ELSE IF (GETDATE() >= @start_date AND GETDATE() < DATEADD(day, 7, @start_date))
    BEGIN
        SET @status = 'Ongoing';
    END
    -- Tournament is finished (more than 7 days since the start date)
    ELSE
    BEGIN
        SET @status = 'Completed';
    END

    RETURN @status;
END;
GO
```
### Triggers

#### beforeInsertRegistration
```sql
CREATE TRIGGER beforeInsertRegistration
ON TournamentRegistrations
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @tournament_id INT,
            @currentCount INT,
            @maxPlayers INT;

    SELECT @tournament_id = tournament_id FROM inserted;

    -- Count the existing registrations for this tournament
    SELECT @currentCount = COUNT(*) 
    FROM TournamentRegistrations 
    WHERE tournament_id = @tournament_id;

    -- Get the maximum allowed players for this tournament
    SELECT @maxPlayers = max_players 
    FROM Tournaments 
    WHERE tournament_id = @tournament_id;

    -- If the tournament is already full, throw an error and cancel the insert
    IF (@currentCount >= @maxPlayers)
    BEGIN
        RAISERROR('Turneringen er fuld, der er ikke plads til flere spillere.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Otherwise, perform the insert
    INSERT INTO TournamentRegistrations (tournament_id, player_id, registered_at)
    SELECT tournament_id, player_id, registered_at
    FROM inserted;
END;
GO
```
#### afterInsertMatch

```sql
CREATE TRIGGER afterInsertMatch
ON Matches
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @player1_id INT,
            @player2_id INT,
            @winner_id INT;

    SELECT @player1_id = player1_id, @player2_id = player2_id, @winner_id = winner_id
    FROM inserted;

    -- Update the ranking for the players
    UPDATE Players
    SET ranking = ranking + 10
    WHERE player_id = @winner_id;

    UPDATE Players
    SET ranking = ranking - 10
    WHERE player_id IN (@player1_id, @player2_id);
END;
GO
```




## Task 4

## Task 5



