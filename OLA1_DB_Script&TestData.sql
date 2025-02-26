USE [master]
GO
/****** Object:  Database [OLA_1_DB]    Script Date: 26-02-2025 11:15:31 ******/
CREATE DATABASE [OLA_1_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OLA_1_DB', FILENAME = N'/var/opt/mssql/data/OLA_1_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OLA_1_DB_log', FILENAME = N'/var/opt/mssql/data/OLA_1_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OLA_1_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OLA_1_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OLA_1_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OLA_1_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OLA_1_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OLA_1_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OLA_1_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OLA_1_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OLA_1_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OLA_1_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OLA_1_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OLA_1_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OLA_1_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OLA_1_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OLA_1_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OLA_1_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OLA_1_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OLA_1_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OLA_1_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OLA_1_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OLA_1_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OLA_1_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OLA_1_DB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OLA_1_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OLA_1_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [OLA_1_DB] SET  MULTI_USER 
GO
ALTER DATABASE [OLA_1_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OLA_1_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OLA_1_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OLA_1_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OLA_1_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OLA_1_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OLA_1_DB', N'ON'
GO
ALTER DATABASE [OLA_1_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [OLA_1_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OLA_1_DB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 26-02-2025 11:15:31 ******/
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
/****** Object:  Table [dbo].[Matches]    Script Date: 26-02-2025 11:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matches](
	[Match_Id] [int] IDENTITY(1,1) NOT NULL,
	[Tournament_Id] [int] NOT NULL,
	[Player1_Player_Id] [int] NOT NULL,
	[Player2_Player_Id] [int] NOT NULL,
	[Winner_Player_Id] [int] NOT NULL,
	[Match_Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Matches] PRIMARY KEY CLUSTERED 
(
	[Match_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 26-02-2025 11:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[Player_Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](450) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Ranking] [int] NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Players] PRIMARY KEY CLUSTERED 
(
	[Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentRegistrations]    Script Date: 26-02-2025 11:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentRegistrations](
	[TournamentRegistration_Id] [int] IDENTITY(1,1) NOT NULL,
	[Tournament_Id] [int] NOT NULL,
	[Player_Id] [int] NOT NULL,
	[Registered_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TournamentRegistrations] PRIMARY KEY CLUSTERED 
(
	[TournamentRegistration_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 26-02-2025 11:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[Tournament_Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Game] [nvarchar](max) NOT NULL,
	[Max_Players] [int] NOT NULL,
	[Start_Date] [datetime2](7) NOT NULL,
	[Created_At] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Tournaments] PRIMARY KEY CLUSTERED 
(
	[Tournament_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250226094501_Initial', N'9.0.2')
GO
SET IDENTITY_INSERT [dbo].[Matches] ON 

INSERT [dbo].[Matches] ([Match_Id], [Tournament_Id], [Player1_Player_Id], [Player2_Player_Id], [Winner_Player_Id], [Match_Date]) VALUES (1, 1, 1, 2, 1, CAST(N'2025-02-24T11:09:54.3375426' AS DateTime2))
INSERT [dbo].[Matches] ([Match_Id], [Tournament_Id], [Player1_Player_Id], [Player2_Player_Id], [Winner_Player_Id], [Match_Date]) VALUES (2, 1, 3, 1, 1, CAST(N'2025-02-25T11:09:54.3376871' AS DateTime2))
INSERT [dbo].[Matches] ([Match_Id], [Tournament_Id], [Player1_Player_Id], [Player2_Player_Id], [Winner_Player_Id], [Match_Date]) VALUES (3, 2, 2, 4, 4, CAST(N'2025-02-25T11:09:54.3376903' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Matches] OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([Player_Id], [Username], [Email], [Ranking], [Created_At]) VALUES (1, N'PlayerOne', N'playerone@example.com', 1000, CAST(N'2025-01-27T11:09:53.5565806' AS DateTime2))
INSERT [dbo].[Players] ([Player_Id], [Username], [Email], [Ranking], [Created_At]) VALUES (2, N'PlayerTwo', N'playertwo@example.com', 1200, CAST(N'2025-02-01T11:09:53.5591048' AS DateTime2))
INSERT [dbo].[Players] ([Player_Id], [Username], [Email], [Ranking], [Created_At]) VALUES (3, N'PlayerThree', N'playerthree@example.com', 900, CAST(N'2025-02-06T11:09:53.5591080' AS DateTime2))
INSERT [dbo].[Players] ([Player_Id], [Username], [Email], [Ranking], [Created_At]) VALUES (4, N'PlayerFour', N'playerfour@example.com', 1100, CAST(N'2025-02-11T11:09:53.5591084' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[TournamentRegistrations] ON 

INSERT [dbo].[TournamentRegistrations] ([TournamentRegistration_Id], [Tournament_Id], [Player_Id], [Registered_At]) VALUES (1, 1, 1, CAST(N'2025-02-25T11:09:54.2088533' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([TournamentRegistration_Id], [Tournament_Id], [Player_Id], [Registered_At]) VALUES (2, 1, 2, CAST(N'2025-02-25T11:09:54.2090070' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([TournamentRegistration_Id], [Tournament_Id], [Player_Id], [Registered_At]) VALUES (3, 1, 3, CAST(N'2025-02-25T11:09:54.2090093' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([TournamentRegistration_Id], [Tournament_Id], [Player_Id], [Registered_At]) VALUES (4, 2, 1, CAST(N'2025-02-25T11:09:54.2090098' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([TournamentRegistration_Id], [Tournament_Id], [Player_Id], [Registered_At]) VALUES (5, 2, 2, CAST(N'2025-02-25T11:09:54.2090103' AS DateTime2))
INSERT [dbo].[TournamentRegistrations] ([TournamentRegistration_Id], [Tournament_Id], [Player_Id], [Registered_At]) VALUES (6, 2, 4, CAST(N'2025-02-25T11:09:54.2090121' AS DateTime2))
SET IDENTITY_INSERT [dbo].[TournamentRegistrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournaments] ON 

INSERT [dbo].[Tournaments] ([Tournament_Id], [Name], [Game], [Max_Players], [Start_Date], [Created_At]) VALUES (1, N'Spring Championship', N'League of Legends', 16, CAST(N'2025-03-08T11:09:53.9104577' AS DateTime2), CAST(N'2025-02-21T11:09:53.9105878' AS DateTime2))
INSERT [dbo].[Tournaments] ([Tournament_Id], [Name], [Game], [Max_Players], [Start_Date], [Created_At]) VALUES (2, N'Summer Showdown', N'CS:GO', 8, CAST(N'2025-03-18T11:09:53.9107244' AS DateTime2), CAST(N'2025-02-23T11:09:53.9107258' AS DateTime2))
INSERT [dbo].[Tournaments] ([Tournament_Id], [Name], [Game], [Max_Players], [Start_Date], [Created_At]) VALUES (3, N'Autumn Brawl', N'Dota 2', 12, CAST(N'2025-04-07T11:09:53.9107264' AS DateTime2), CAST(N'2025-02-24T11:09:53.9107268' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Tournaments] OFF
GO
/****** Object:  Index [IX_Matches_Player1_Player_Id]    Script Date: 26-02-2025 11:15:31 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_Player1_Player_Id] ON [dbo].[Matches]
(
	[Player1_Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_Player2_Player_Id]    Script Date: 26-02-2025 11:15:31 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_Player2_Player_Id] ON [dbo].[Matches]
(
	[Player2_Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_Tournament_Id]    Script Date: 26-02-2025 11:15:31 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_Tournament_Id] ON [dbo].[Matches]
(
	[Tournament_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Matches_Winner_Player_Id]    Script Date: 26-02-2025 11:15:31 ******/
CREATE NONCLUSTERED INDEX [IX_Matches_Winner_Player_Id] ON [dbo].[Matches]
(
	[Winner_Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Players_Email]    Script Date: 26-02-2025 11:15:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Players_Email] ON [dbo].[Players]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Players_Username]    Script Date: 26-02-2025 11:15:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Players_Username] ON [dbo].[Players]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TournamentRegistrations_Player_Id]    Script Date: 26-02-2025 11:15:31 ******/
CREATE NONCLUSTERED INDEX [IX_TournamentRegistrations_Player_Id] ON [dbo].[TournamentRegistrations]
(
	[Player_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TournamentRegistrations_Tournament_Id]    Script Date: 26-02-2025 11:15:31 ******/
CREATE NONCLUSTERED INDEX [IX_TournamentRegistrations_Tournament_Id] ON [dbo].[TournamentRegistrations]
(
	[Tournament_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Tournaments_Name]    Script Date: 26-02-2025 11:15:31 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tournaments_Name] ON [dbo].[Tournaments]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players_Player1_Player_Id] FOREIGN KEY([Player1_Player_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players_Player1_Player_Id]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players_Player2_Player_Id] FOREIGN KEY([Player2_Player_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players_Player2_Player_Id]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Players_Winner_Player_Id] FOREIGN KEY([Winner_Player_Id])
REFERENCES [dbo].[Players] ([Player_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Players_Winner_Player_Id]
GO
ALTER TABLE [dbo].[Matches]  WITH CHECK ADD  CONSTRAINT [FK_Matches_Tournaments_Tournament_Id] FOREIGN KEY([Tournament_Id])
REFERENCES [dbo].[Tournaments] ([Tournament_Id])
GO
ALTER TABLE [dbo].[Matches] CHECK CONSTRAINT [FK_Matches_Tournaments_Tournament_Id]
GO
ALTER TABLE [dbo].[TournamentRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_TournamentRegistrations_Players_Player_Id] FOREIGN KEY([Player_Id])
REFERENCES [dbo].[Players] ([Player_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TournamentRegistrations] CHECK CONSTRAINT [FK_TournamentRegistrations_Players_Player_Id]
GO
ALTER TABLE [dbo].[TournamentRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_TournamentRegistrations_Tournaments_Tournament_Id] FOREIGN KEY([Tournament_Id])
REFERENCES [dbo].[Tournaments] ([Tournament_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TournamentRegistrations] CHECK CONSTRAINT [FK_TournamentRegistrations_Tournaments_Tournament_Id]
GO
USE [master]
GO
ALTER DATABASE [OLA_1_DB] SET  READ_WRITE 
GO
