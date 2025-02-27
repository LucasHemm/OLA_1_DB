USE [master]
GO
/****** Object:  Database [DB_OLA_1]    Script Date: 26-02-2025 13:11:32 ******/
CREATE DATABASE [DB_OLA_1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_OLA_1', FILENAME = N'/var/opt/mssql/data/DB_OLA_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_OLA_1_log', FILENAME = N'/var/opt/mssql/data/DB_OLA_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_OLA_1] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_OLA_1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_OLA_1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_OLA_1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_OLA_1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_OLA_1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_OLA_1] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_OLA_1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_OLA_1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_OLA_1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_OLA_1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_OLA_1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_OLA_1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_OLA_1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_OLA_1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_OLA_1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_OLA_1] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_OLA_1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_OLA_1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_OLA_1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_OLA_1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_OLA_1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_OLA_1] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DB_OLA_1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_OLA_1] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_OLA_1] SET  MULTI_USER 
GO
ALTER DATABASE [DB_OLA_1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_OLA_1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_OLA_1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_OLA_1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_OLA_1] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_OLA_1] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_OLA_1', N'ON'
GO
ALTER DATABASE [DB_OLA_1] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_OLA_1] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_OLA_1]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26-02-2025 13:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matches]    Script Date: 26-02-2025 13:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[match_id] [int] IDENTITY(1,1) NOT NULL,
	[tournament_id] [int] NOT NULL,
	[player1_id] [int] NOT NULL,
	[player2_id] [int] NOT NULL,
	[winner_id] [int] NOT NULL,
	[match_date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 26-02-2025 13:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[player_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](450) NOT NULL,
	[email] [nvarchar](450) NOT NULL,
	[ranking] [int] NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentRegistrations]    Script Date: 26-02-2025 13:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentRegistrations](
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[tournament_id] [int] NOT NULL,
	[player_id] [int] NOT NULL,
	[registered_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TournamentRegistrations] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 26-02-2025 13:11:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[tournament_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](450) NOT NULL,
	[game] [nvarchar](max) NOT NULL,
	[max_players] [int] NOT NULL,
	[start_date] [datetime2](7) NOT NULL,
	[created_at] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[tournament_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250226114506_Initial', N'9.0.2')
GO
SET IDENTITY_INSERT [dbo].[Matches] ON 

INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (1, 1, 1, 2, 1, CAST(N'2025-02-26T12:06:32.2633333' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (2, 2, 5, 6, 5, CAST(N'2025-02-26T12:06:32.2700000' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (3, 3, 8, 9, 8, CAST(N'2025-02-26T12:06:32.2700000' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (4, 4, 12, 13, 12, CAST(N'2025-02-26T12:06:32.2733333' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (5, 5, 14, 15, 14, CAST(N'2025-02-26T12:06:32.2766667' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (6, 6, 18, 19, 19, CAST(N'2025-02-26T12:06:32.2800000' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (7, 7, 21, 22, 21, CAST(N'2025-02-26T12:06:32.2833333' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (8, 8, 24, 25, 25, CAST(N'2025-02-26T12:06:32.2866667' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (9, 9, 26, 27, 26, CAST(N'2025-02-26T12:06:32.2900000' AS DateTime2))
INSERT [dbo].[Matches] ([match_id], [tournament_id], [player1_id], [player2_id], [winner_id], [match_date]) VALUES (10, 10, 29, 30, 29, CAST(N'2025-02-26T12:06:32.2933333' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Matches] OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (1, N'Player1', N'player1@example.com', 1200, CAST(N'2025-02-26T12:06:32.0400000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (2, N'Player2', N'player2@example.com', 1250, CAST(N'2025-02-26T12:06:32.0500000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (3, N'Player3', N'player3@example.com', 1300, CAST(N'2025-02-26T12:06:32.0500000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (4, N'Player4', N'player4@example.com', 1180, CAST(N'2025-02-26T12:06:32.0533333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (5, N'Player5', N'player5@example.com', 1220, CAST(N'2025-02-26T12:06:32.0566667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (6, N'Player6', N'player6@example.com', 1270, CAST(N'2025-02-26T12:06:32.0600000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (7, N'Player7', N'player7@example.com', 1210, CAST(N'2025-02-26T12:06:32.0633333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (8, N'Player8', N'player8@example.com', 1230, CAST(N'2025-02-26T12:06:32.0666667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (9, N'Player9', N'player9@example.com', 1290, CAST(N'2025-02-26T12:06:32.0700000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (10, N'Player10', N'player10@example.com', 1240, CAST(N'2025-02-26T12:06:32.0733333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (11, N'Player11', N'player11@example.com', 1260, CAST(N'2025-02-26T12:06:32.0766667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (12, N'Player12', N'player12@example.com', 1200, CAST(N'2025-02-26T12:06:32.0766667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (13, N'Player13', N'player13@example.com', 1250, CAST(N'2025-02-26T12:06:32.0800000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (14, N'Player14', N'player14@example.com', 1300, CAST(N'2025-02-26T12:06:32.0833333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (15, N'Player15', N'player15@example.com', 1180, CAST(N'2025-02-26T12:06:32.0866667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (16, N'Player16', N'player16@example.com', 1220, CAST(N'2025-02-26T12:06:32.0900000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (17, N'Player17', N'player17@example.com', 1270, CAST(N'2025-02-26T12:06:32.0933333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (18, N'Player18', N'player18@example.com', 1210, CAST(N'2025-02-26T12:06:32.0966667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (19, N'Player19', N'player19@example.com', 1230, CAST(N'2025-02-26T12:06:32.1000000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (20, N'Player20', N'player20@example.com', 1290, CAST(N'2025-02-26T12:06:32.1000000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (21, N'Player21', N'player21@example.com', 1240, CAST(N'2025-02-26T12:06:32.1033333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (22, N'Player22', N'player22@example.com', 1260, CAST(N'2025-02-26T12:06:32.1066667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (23, N'Player23', N'player23@example.com', 1200, CAST(N'2025-02-26T12:06:32.1100000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (24, N'Player24', N'player24@example.com', 1250, CAST(N'2025-02-26T12:06:32.1133333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (25, N'Player25', N'player25@example.com', 1300, CAST(N'2025-02-26T12:06:32.1166667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (26, N'Player26', N'player26@example.com', 1180, CAST(N'2025-02-26T12:06:32.1166667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (27, N'Player27', N'player27@example.com', 1220, CAST(N'2025-02-26T12:06:32.1200000' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (28, N'Player28', N'player28@example.com', 1270, CAST(N'2025-02-26T12:06:32.1233333' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (29, N'Player29', N'player29@example.com', 1210, CAST(N'2025-02-26T12:06:32.1266667' AS DateTime2))
INSERT [dbo].[Players] ([player_id], [username], [email], [ranking], [created_at]) VALUES (30, N'Player30', N'player30@example.com', 1230, CAST(N'2025-02-26T12:06:32.1300000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[TournamentRegistrations] ON 

INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (1, 1, 1, CAST(N'2025-02-26T12:06:32.1633333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (2, 1, 2, CAST(N'2025-02-26T12:06:32.1666667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (3, 1, 3, CAST(N'2025-02-26T12:06:32.1700000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (4, 1, 4, CAST(N'2025-02-26T12:06:32.1700000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (5, 2, 5, CAST(N'2025-02-26T12:06:32.1733333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (6, 2, 6, CAST(N'2025-02-26T12:06:32.1766667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (7, 2, 7, CAST(N'2025-02-26T12:06:32.1800000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (8, 3, 8, CAST(N'2025-02-26T12:06:32.1833333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (9, 3, 9, CAST(N'2025-02-26T12:06:32.1866667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (10, 3, 10, CAST(N'2025-02-26T12:06:32.1900000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (11, 3, 11, CAST(N'2025-02-26T12:06:32.1933333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (12, 4, 12, CAST(N'2025-02-26T12:06:32.1966667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (13, 4, 13, CAST(N'2025-02-26T12:06:32.2000000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (14, 5, 14, CAST(N'2025-02-26T12:06:32.2000000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (15, 5, 15, CAST(N'2025-02-26T12:06:32.2033333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (16, 5, 16, CAST(N'2025-02-26T12:06:32.2066667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (17, 5, 17, CAST(N'2025-02-26T12:06:32.2100000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (18, 6, 18, CAST(N'2025-02-26T12:06:32.2133333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (19, 6, 19, CAST(N'2025-02-26T12:06:32.2166667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (20, 6, 20, CAST(N'2025-02-26T12:06:32.2200000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (21, 7, 21, CAST(N'2025-02-26T12:06:32.2233333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (22, 7, 22, CAST(N'2025-02-26T12:06:32.2266667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (23, 7, 23, CAST(N'2025-02-26T12:06:32.2300000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (24, 8, 24, CAST(N'2025-02-26T12:06:32.2333333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (25, 8, 25, CAST(N'2025-02-26T12:06:32.2366667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (26, 9, 26, CAST(N'2025-02-26T12:06:32.2400000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (27, 9, 27, CAST(N'2025-02-26T12:06:32.2400000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (28, 9, 28, CAST(N'2025-02-26T12:06:32.2466667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (29, 10, 29, CAST(N'2025-02-26T12:06:32.2500000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (30, 10, 30, CAST(N'2025-02-26T12:06:32.2500000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (31, 10, 1, CAST(N'2025-02-26T12:06:32.2566667' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (32, 10, 2, CAST(N'2025-02-26T12:06:32.2600000' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (33, 5, 3, CAST(N'2025-02-26T12:07:18.4433333' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([registration_id], [tournament_id], [player_id], [registered_at]) VALUES (34, 5, 4, CAST(N'2025-02-26T12:07:38.5400000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TournamentRegistrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournaments] ON 

INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (1, N'Tournament 1', N'Wow', 8, CAST(N'2025-03-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1333333' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (2, N'Tournament 2', N'Apex', 6, CAST(N'2025-04-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1366667' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (3, N'Tournament 3', N'Marvel rivals', 10, CAST(N'2025-05-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1400000' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (4, N'Tournament 4', N'Siege', 8, CAST(N'2025-06-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1433333' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (5, N'Tournament 5', N'Poker', 10, CAST(N'2025-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1466667' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (6, N'Tournament 6', N'Fifa', 16, CAST(N'2025-08-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1500000' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (7, N'Tournament 7', N'NBA 2k', 12, CAST(N'2025-09-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1533333' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (8, N'Tournament 8', N'Mortal kombat', 8, CAST(N'2025-10-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1533333' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (9, N'Tournament 9', N'Mario kart', 8, CAST(N'2025-11-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1566667' AS DateTime2))
INSERT [dbo].[Tournaments] ([tournament_id], [name], [game], [max_players], [start_date], [created_at]) VALUES (10, N'Tournament 10', N'Fortnite', 10, CAST(N'2025-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-26T12:06:32.1600000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Tournaments] OFF
GO
/****** Object:  Index [IX_Matches_player1_id]    Script Date: 26-02-2025 13:11:32 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_player1_id] ON [dbo].[Matches]
(
	[player1_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_player2_id]    Script Date: 26-02-2025 13:11:32 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_player2_id] ON [dbo].[Matches]
(
	[player2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_tournament_id]    Script Date: 26-02-2025 13:11:32 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_tournament_id] ON [dbo].[Matches]
(
	[tournament_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_winner_id]    Script Date: 26-02-2025 13:11:32 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_winner_id] ON [dbo].[Matches]
(
	[winner_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Players_email]    Script Date: 26-02-2025 13:11:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Players_email] ON [dbo].[Players]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Players_username]    Script Date: 26-02-2025 13:11:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Players_username] ON [dbo].[Players]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TournamentRegistrations_player_id]    Script Date: 26-02-2025 13:11:32 ******/
CREATE NONCLUSTERED INDEX [IX_TournamentRegistrations_player_id] ON [dbo].[TournamentRegistrations]
(
	[player_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TournamentRegistrations_tournament_id]    Script Date: 26-02-2025 13:11:32 ******/
CREATE NONCLUSTERED INDEX [IX_TournamentRegistrations_tournament_id] ON [dbo].[TournamentRegistrations]
(
	[tournament_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_tournaments_name]    Script Date: 26-02-2025 13:11:32 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tournaments_name] ON [dbo].[Tournaments]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players_player1_id] FOREIGN KEY([player1_id])
REFERENCES [dbo].[Players] ([player_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players_player1_id]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players_player2_id] FOREIGN KEY([player2_id])
REFERENCES [dbo].[Players] ([player_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players_player2_id]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players_winner_id] FOREIGN KEY([winner_id])
REFERENCES [dbo].[Players] ([player_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players_winner_id]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Tournaments_tournament_id] FOREIGN KEY([tournament_id])
REFERENCES [dbo].[Tournaments] ([tournament_id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Tournaments_tournament_id]
GO
ALTER TABLE [dbo].[TournamentRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_TournamentRegistrations_players_id] FOREIGN KEY([player_id])
REFERENCES [dbo].[Players] ([player_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TournamentRegistrations] CHECK CONSTRAINT [FK_TournamentRegistrations_players_id]
GO
ALTER TABLE [dbo].[TournamentRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_TournamentRegistrations_Tournaments_tournament_id] FOREIGN KEY([tournament_id])
REFERENCES [dbo].[Tournaments] ([tournament_id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TournamentRegistrations] CHECK CONSTRAINT [FK_TournamentRegistrations_Tournaments_tournament_id]
GO
USE [master]
GO
ALTER DATABASE [DB_OLA_1] SET  READ_WRITE 
GO
