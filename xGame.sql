USE [master]
GO
/****** Object:  Database [XGame]    Script Date: 3/1/2021 1:41:02 PM ******/
CREATE DATABASE [XGame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\XGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\XGame_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [XGame] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [XGame] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [XGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XGame] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XGame] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XGame] SET  MULTI_USER 
GO
ALTER DATABASE [XGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XGame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XGame] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'XGame', N'ON'
GO
ALTER DATABASE [XGame] SET QUERY_STORE = OFF
GO
USE [XGame]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[region_ID] [int] IDENTITY(0,1) NOT NULL,
	[regionName] [nvarchar](100) NOT NULL,
	[regionDanger] [int] NOT NULL,
	[hasShop] [int] NOT NULL,
	[regionDesc] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[region_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[item_ID] [int] IDENTITY(0,1) NOT NULL,
	[itemName] [nvarchar](100) NOT NULL,
	[healthModifier] [int] NULL,
	[magicaModifier] [int] NULL,
	[staminaModifier] [int] NULL,
	[itemType] [int] NULL,
	[goldPrice] [int] NULL,
	[armorMod] [int] NOT NULL,
	[damageMod] [int] NOT NULL,
	[weaponType] [int] NULL,
	[armorType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Characters]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Characters](
	[character_ID] [int] IDENTITY(0,1) NOT NULL,
	[characterName] [nvarchar](200) NOT NULL,
	[characterClass_FK] [int] NOT NULL,
	[characterLocation_FK] [int] NOT NULL,
	[characterUser_FK] [int] NOT NULL,
	[characterGold] [int] NOT NULL,
	[characterLvl] [int] NOT NULL,
	[characterXP] [int] NOT NULL,
	[characterHealth] [int] NULL,
	[Armor] [int] NOT NULL,
	[MaxHP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[character_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventories]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventories](
	[inventory_ID] [int] IDENTITY(0,1) NOT NULL,
	[character_FK] [int] NOT NULL,
	[item_FK] [int] NOT NULL,
	[isEquipted] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[inventory_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[viewOne]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewOne] AS 
SELECT c.characterName, i.itemName,r.regionName
FROM Characters AS c
JOIN Inventories AS v on v.character_FK = c.character_ID
JOIN Items AS i on v.item_FK = i.item_ID
JOIN Regions AS r ON c.characterLocation_FK = r.region_ID;
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[class_ID] [int] IDENTITY(0,1) NOT NULL,
	[className] [nvarchar](100) NOT NULL,
	[classArmor] [int] NOT NULL,
	[classStamina] [int] NULL,
	[classMagica] [int] NULL,
	[classDamage] [int] NOT NULL,
	[baseHP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[class_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogging]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogging](
	[log_ID] [int] IDENTITY(0,1) NOT NULL,
	[errorName] [nvarchar](200) NOT NULL,
	[errorMsg] [nvarchar](max) NOT NULL,
	[errorSrc] [nvarchar](200) NOT NULL,
	[errorDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[log_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monsterDrops]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monsterDrops](
	[drop_ID] [int] IDENTITY(0,1) NOT NULL,
	[item_FK] [int] NOT NULL,
	[monster_FK] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[drop_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monsters]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monsters](
	[monster_ID] [int] IDENTITY(0,1) NOT NULL,
	[monsterName] [nvarchar](100) NOT NULL,
	[monsterHealth] [int] NOT NULL,
	[monsterArmor] [int] NOT NULL,
	[monsterDamage] [int] NOT NULL,
	[monsterDanger] [int] NOT NULL,
	[monsterBehaviour] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[monster_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[role_ID] [int] IDENTITY(0,1) NOT NULL,
	[roleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_ID] [int] IDENTITY(0,1) NOT NULL,
	[role_FK] [int] NOT NULL,
	[userName] [nvarchar](500) NOT NULL,
	[userPassword] [nvarchar](200) NOT NULL,
	[dateAdded] [datetime] NOT NULL,
	[dateModified] [datetime] NULL,
	[Email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Characters] ON 

INSERT [dbo].[Characters] ([character_ID], [characterName], [characterClass_FK], [characterLocation_FK], [characterUser_FK], [characterGold], [characterLvl], [characterXP], [characterHealth], [Armor], [MaxHP]) VALUES (154, N'Test', 4, 0, 1130, 0, 1, 0, 150, 0, 150)
INSERT [dbo].[Characters] ([character_ID], [characterName], [characterClass_FK], [characterLocation_FK], [characterUser_FK], [characterGold], [characterLvl], [characterXP], [characterHealth], [Armor], [MaxHP]) VALUES (155, N'Leonitas', 4, 0, 1130, 50, 1, 0, 170, 0, 150)
INSERT [dbo].[Characters] ([character_ID], [characterName], [characterClass_FK], [characterLocation_FK], [characterUser_FK], [characterGold], [characterLvl], [characterXP], [characterHealth], [Armor], [MaxHP]) VALUES (162, N'Default', 4, 0, 1159, 100, 1, 0, 150, 0, 150)
INSERT [dbo].[Characters] ([character_ID], [characterName], [characterClass_FK], [characterLocation_FK], [characterUser_FK], [characterGold], [characterLvl], [characterXP], [characterHealth], [Armor], [MaxHP]) VALUES (164, N'MagicEx', 4, 0, 1126, 100, 1, 0, 120, 0, 150)
INSERT [dbo].[Characters] ([character_ID], [characterName], [characterClass_FK], [characterLocation_FK], [characterUser_FK], [characterGold], [characterLvl], [characterXP], [characterHealth], [Armor], [MaxHP]) VALUES (166, N'StaminaEx', 6, 0, 1126, 70, 1, 0, 55, 0, 50)
INSERT [dbo].[Characters] ([character_ID], [characterName], [characterClass_FK], [characterLocation_FK], [characterUser_FK], [characterGold], [characterLvl], [characterXP], [characterHealth], [Armor], [MaxHP]) VALUES (167, N'GeneralEx', 4, 0, 1126, 10, 1, 0, 140, 0, 150)
SET IDENTITY_INSERT [dbo].[Characters] OFF
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([class_ID], [className], [classArmor], [classStamina], [classMagica], [classDamage], [baseHP]) VALUES (3, N'Hunter', 1, 125, 0, 10, 100)
INSERT [dbo].[Classes] ([class_ID], [className], [classArmor], [classStamina], [classMagica], [classDamage], [baseHP]) VALUES (4, N'Warrior', 2, 150, 0, 35, 150)
INSERT [dbo].[Classes] ([class_ID], [className], [classArmor], [classStamina], [classMagica], [classDamage], [baseHP]) VALUES (5, N'Thief', 1, 140, 50, 15, 75)
INSERT [dbo].[Classes] ([class_ID], [className], [classArmor], [classStamina], [classMagica], [classDamage], [baseHP]) VALUES (6, N'Mage', 3, 50, 150, 10, 50)
INSERT [dbo].[Classes] ([class_ID], [className], [classArmor], [classStamina], [classMagica], [classDamage], [baseHP]) VALUES (7, N'Paladin', 2, 130, 50, 25, 130)
INSERT [dbo].[Classes] ([class_ID], [className], [classArmor], [classStamina], [classMagica], [classDamage], [baseHP]) VALUES (8, N'Ranger', 1, 130, 50, 20, 90)
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[ErrorLogging] ON 

INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1, N'Error Test', N'Message Test', N'Source Test', CAST(N'2019-06-19T15:11:19.883' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1013, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_adduser'' expects parameter ''@loginame'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExcepti', N'Procedure or function ''sp_adduser'' expects parameter ''@loginame'', which was not supplied.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-20T15:04:42.383' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1015, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_adduser'' expects parameter ''@loginame'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExcepti', N'Procedure or function ''sp_adduser'' expects parameter ''@loginame'', which was not supplied.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-20T15:11:54.170' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1017, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''sp_adduser'' expects parameter ''@loginame'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExcepti', N'Procedure or function ''sp_adduser'' expects parameter ''@loginame'', which was not supplied.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-20T15:16:33.680' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1019, N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''SP_AddUsers''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Acti', N'Could not find stored procedure ''SP_AddUsers''.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-20T15:17:39.667' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1028, N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''SP_UpdateUser''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Ac', N'Could not find stored procedure ''SP_UpdateUser''.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-20T21:56:02.390' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1031, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-21T12:44:19.647' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1034, N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''SP_RemoveTestCharacter''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConne', N'Could not find stored procedure ''SP_RemoveTestCharacter''.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-21T15:23:11.003' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1036, N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''SP_RemoveTestCharacter''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConne', N'Could not find stored procedure ''SP_RemoveTestCharacter''.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-21T15:24:57.627' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1043, N'System.InvalidCastException: Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.
   at XGame_DAL.ModifyClass.GetClassInfo(CharacterDO character, Int32 classID) in C:\Users\Admin-', N'Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.', N'XGame_DAL', CAST(N'2019-06-23T19:08:24.067' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1044, N'System.InvalidCastException: Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.
   at XGame_DAL.ModifyClass.GetClassInfo(CharacterDO character, Int32 classID) in C:\Users\Admin-', N'Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.', N'XGame_DAL', CAST(N'2019-06-23T19:16:24.810' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1045, N'System.InvalidCastException: Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.
   at XGame_DAL.ModifyClass.GetClassInfo(CharacterDO character, Int32 classID) in C:\Users\Admin-', N'Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.', N'XGame_DAL', CAST(N'2019-06-23T19:18:51.687' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1046, N'System.InvalidCastException: Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.
   at XGame_DAL.ModifyClass.GetClassInfo(CharacterDO character, Int32 classID) in C:\Users\Admin-', N'Unable to cast object of type ''System.DBNull'' to type ''System.Int32''.', N'XGame_DAL', CAST(N'2019-06-23T19:25:58.370' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1047, N'System.InvalidOperationException: ExecuteReader: Connection property has not been initialized.
   at System.Data.SqlClient.SqlCommand.ValidateCommand(Boolean async, String method)
   at System.Data.', N'ExecuteReader: Connection property has not been initialized.', N'System.Data.SqlClient', CAST(N'2019-06-23T20:01:31.043' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1048, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddMonster'' expects parameter ''@parm_monsterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_AddMonster'' expects parameter ''@parm_monsterName'', which was not supplied.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-23T21:58:52.800' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1049, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_RemoveTestMonster'' expects parameter ''@parm_monsterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.', N'Procedure or function ''SP_RemoveTestMonster'' expects parameter ''@parm_monsterName'', which was not supplied.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-23T22:19:29.463' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1050, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateMonster'' expects parameter ''@parm_monsterBehaviour'', which was not supplied.
   at System.Data.SqlClient.SqlConnection', N'Procedure or function ''SP_UpdateMonster'' expects parameter ''@parm_monsterBehaviour'', which was not supplied.', N'Core .Net SqlClient Data Provider', CAST(N'2019-06-24T08:22:33.910' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1051, N'System.InvalidOperationException: ExecuteReader: Connection property has not been initialized.
   at System.Data.SqlClient.SqlCommand.ValidateCommand(Boolean async, String method)
   at System.Data.', N'ExecuteReader: Connection property has not been initialized.', N'System.Data.SqlClient', CAST(N'2019-06-24T08:55:52.920' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1058, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:53.877' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1059, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.180' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1060, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.187' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1061, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.337' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1062, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.377' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1063, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.577' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1064, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.580' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1065, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.610' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1066, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.630' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1067, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.643' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1068, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "dbo.Characters", column ''character_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.663' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1069, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "dbo.Characters", column ''character_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.670' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1070, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "dbo.Characters", column ''character_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:06:54.680' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1071, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyInventories.GetCharacterInventory(Int32 characterID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\M', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-06-26T15:13:07.860' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1072, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyInventories.GetCharacterInventory(Int32 characterID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\M', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-06-26T15:13:40.220' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1073, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyInventories.GetCharacterInventory(Int32 characterID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\M', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-06-26T15:15:15.710' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1074, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyInventories.GetCharacterInventory(Int32 characterID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\M', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-06-26T15:18:50.060' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1075, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyInventories.GetCharacterInventory(Int32 characterID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\M', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-06-26T15:19:13.743' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1076, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyInventories.GetCharacterInventory(Int32 characterID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\M', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-06-26T15:20:17.740' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1077, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:02.310' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1079, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.287' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1080, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.307' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1081, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.327' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1082, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.333' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1083, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.340' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1084, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.383' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1085, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.390' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1086, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "dbo.Characters", column ''character_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:27:34.423' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1088, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.810' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1089, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.817' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1090, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.823' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1091, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.837' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1092, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.843' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1093, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.887' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1094, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.893' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1095, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "dbo.Characters", column ''character_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:29:29.910' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1096, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-26T15:37:59.763' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1098, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:04.517' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1099, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:04.693' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1100, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlExce', N'Procedure or function ''SP_AddUsers'' expects parameter ''@parm_email'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:04.827' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1101, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:05.207' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1102, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:05.223' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1103, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:05.230' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1104, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:05.257' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1105, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Inventori__chara__7B5B524B". The conflict occurred in database "XGame", table "dbo.Characters", column ''character_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-06-27T14:30:05.340' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1106, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-07-04T15:46:22.100' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1107, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T12:47:41.680' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1108, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T22:18:46.203' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1109, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T22:19:05.470' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1110, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T22:19:11.430' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1111, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T22:19:13.807' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1112, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T22:19:14.623' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1113, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T22:22:40.037' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1114, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-05T22:22:42.733' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1115, N'System.IndexOutOfRangeException: baseHP
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.Da', N'baseHP', N'System.Data', CAST(N'2019-07-10T14:54:34.873' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1116, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyClass.GetClassInfo(Int32 classID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyClass.cs:line ', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-10T14:58:26.390' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1117, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyClass.GetClassInfo(Int32 classID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyClass.cs:line ', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-10T16:34:34.490' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1118, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnect', N'Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T20:57:19.283' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1119, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnect', N'Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T20:57:40.157' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1120, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnect', N'Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T20:58:02.130' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1121, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnect', N'Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T21:00:14.290' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1122, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnect', N'Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T21:00:39.713' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1123, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnect', N'Procedure or function ''SP_UpdateUserCharacter'' expects parameter ''@parm_characterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T21:01:22.490' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1124, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T21:38:20.390' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1125, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T21:42:43.997' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1126, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-07-10T21:44:40.300' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1127, N'System.IndexOutOfRangeException: MapHP
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.Dat', N'MapHP', N'System.Data', CAST(N'2019-07-12T13:41:15.310' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1128, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-12T13:43:18.583' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1129, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-12T13:46:26.230' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1130, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-12T13:47:52.707' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1131, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyClass.GetClassInfo(Int32 classID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyClass.cs:line ', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-12T14:41:28.143' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1132, N'System.IndexOutOfRangeException: class_ID
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.', N'class_ID', N'System.Data', CAST(N'2019-07-12T14:48:28.000' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1133, N'System.IndexOutOfRangeException: Armor
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.Dat', N'Armor', N'System.Data', CAST(N'2019-07-16T11:03:58.717' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1134, N'System.IndexOutOfRangeException: Armor
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.Dat', N'Armor', N'System.Data', CAST(N'2019-07-16T11:06:24.820' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1135, N'System.IndexOutOfRangeException: item_FK
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.D', N'item_FK', N'System.Data', CAST(N'2019-07-17T10:30:11.953' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1136, N'System.IndexOutOfRangeException: item_FK
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.D', N'item_FK', N'System.Data', CAST(N'2019-07-17T10:31:43.667' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1137, N'System.IndexOutOfRangeException: item_FK
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.D', N'item_FK', N'System.Data', CAST(N'2019-07-17T10:33:56.893' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1138, N'System.IndexOutOfRangeException: item_FK
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at System.D', N'item_FK', N'System.Data', CAST(N'2019-07-17T10:34:56.840' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1139, N'System.IndexOutOfRangeException: inventory_ID
   at System.Data.ProviderBase.FieldNameLookup.GetOrdinal(String fieldName)
   at System.Data.SqlClient.SqlDataReader.GetOrdinal(String name)
   at Sys', N'inventory_ID', N'System.Data', CAST(N'2019-07-17T10:37:53.140' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1140, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_CheckForUsername'' expects parameter ''@parm_userName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnEr', N'Procedure or function ''SP_CheckForUsername'' expects parameter ''@parm_userName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-18T14:15:11.293' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1141, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_CheckForUsername'' expects parameter ''@parm_userName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnEr', N'Procedure or function ''SP_CheckForUsername'' expects parameter ''@parm_userName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-18T14:16:59.900' AS DateTime))
GO
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1142, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:21:35.480' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1143, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:27:08.207' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1144, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:28:01.787' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1145, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:28:43.443' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1146, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:31:51.320' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1147, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:32:02.837' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1148, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:32:09.400' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1149, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:34:22.830' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1150, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:35:12.400' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1151, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyClass.GetClassInfo(Int32 classID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyClass.cs:line ', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:35:18.557' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1152, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:36:14.733' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1153, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:36:23.717' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1154, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:36:30.003' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1155, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyClass.GetClassInfo(Int32 classID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyClass.cs:line ', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:36:34.987' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1156, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:42:58.450' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1157, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:45:04.223' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1158, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:46:14.900' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1159, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:46:24.563' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1160, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:46:57.977' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1161, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:48:27.857' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1162, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:48:43.630' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1163, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:48:53.147' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1164, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T14:51:51.140' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1165, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:00:47.660' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1166, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:05:53.583' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1167, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:11:10.347' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1168, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:17:13.037' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1169, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:17:44.140' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1170, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:20:38.660' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1171, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:20:52.550' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1172, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:21:19.653' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1173, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:22:37.030' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1174, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:27:59.120' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1175, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:28:55.973' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1176, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:29:13.680' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1177, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:29:26.390' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1178, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:29:52.303' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1179, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:30:50.297' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1180, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:32:10.127' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1181, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:32:51.450' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1182, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:33:15.100' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1183, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:34:26.063' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1184, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:36:25.573' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1185, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:36:41.130' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1186, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:37:07.843' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1187, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:37:25.437' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1188, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:37:41.720' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1189, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:38:13.660' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1190, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:38:26.513' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1191, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:38:33.370' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1192, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T15:38:42.333' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1193, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:12:28.030' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1194, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:12:41.843' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1195, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:13:05.690' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1196, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:13:54.983' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1197, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:14:32.840' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1198, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:16:13.783' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1199, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:25:24.003' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1200, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:25:39.417' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1201, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:25:51.387' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1202, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:26:04.910' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1203, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:30:07.180' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1204, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:30:19.157' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1205, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:30:28.420' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1206, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:31:19.150' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1207, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:41:12.480' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1208, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:41:28.780' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1209, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:46:54.850' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1210, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T16:48:00.823' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1211, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T17:53:00.480' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1212, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-18T18:09:15.433' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1213, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T08:42:12.227' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1214, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T08:54:29.440' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1215, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:00:19.647' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1216, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:00:48.650' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1217, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:26:44.097' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1218, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:27:17.450' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1219, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:30:19.680' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1220, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:38:20.287' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1221, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:40:50.073' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1222, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:41:20.893' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1223, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:51:35.747' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1224, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T09:58:20.570' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1225, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:00:10.907' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1226, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:24:58.577' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1227, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:27:00.147' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1228, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:27:48.607' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1229, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:27:56.810' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1230, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:47:05.867' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1231, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:53:31.927' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1232, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:53:45.807' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1233, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:53:54.143' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1234, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:54:15.340' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1235, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:54:52.707' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1236, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:56:07.797' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1237, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:57:05.767' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1238, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:58:38.903' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1239, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:59:04.193' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1240, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:59:13.637' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1241, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:59:38.550' AS DateTime))
GO
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1242, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:59:47.423' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1243, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T10:59:55.880' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1244, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T11:00:06.310' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1245, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:19:54.870' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1246, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:20:06.667' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1247, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:20:17.203' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1248, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:20:41.090' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1249, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:44:00.173' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1250, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:44:39.697' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1251, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T13:48:07.587' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1252, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:48:07.700' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1253, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T13:48:19.353' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1254, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:48:19.417' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1255, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T13:52:32.867' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1256, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:52:32.950' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1257, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T13:53:26.593' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1258, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:53:26.667' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1259, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T13:55:51.177' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1260, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:55:51.223' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1261, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T13:57:07.330' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1262, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:57:07.383' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1263, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T13:57:41.937' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1264, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T13:57:41.993' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1265, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T14:00:23.590' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1266, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:00:23.623' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1267, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:09:16.570' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1268, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:19:39.230' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1269, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:21:41.087' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1270, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:23:00.603' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1271, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:25:19.830' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1272, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:25:26.543' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1273, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:25:30.260' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1274, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T14:25:54.540' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1275, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:26:01.740' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1276, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:26:58.317' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1277, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T14:27:07.753' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1278, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:27:12.593' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1279, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:27:28.383' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1280, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyCharacters.GetCharacterList(Int32 userID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyCharac', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-19T14:35:45.620' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1281, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T14:44:25.247' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1282, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-19T15:09:18.357' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1283, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddCharacter'' expects parameter ''@parm_characterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnE', N'Procedure or function ''SP_AddCharacter'' expects parameter ''@parm_characterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-22T13:30:52.707' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1284, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T08:36:01.830' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1285, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T09:07:34.457' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1286, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T09:08:31.183' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1287, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T09:09:54.110' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1288, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T09:10:08.257' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1289, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_username'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T09:11:58.100' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1290, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError(SqlE', N'Procedure or function ''SP_GetUsers'' expects parameter ''@parm_password'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T09:12:01.027' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1291, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T14:15:19.167' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1292, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T14:16:13.840' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1293, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-23T14:17:20.170' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1294, N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure '' SP_UpdateInventoryItem''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConn', N'Could not find stored procedure '' SP_UpdateInventoryItem''.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T09:41:51.070' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1295, N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure '' SP_UpdateInventoryItem''.
   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConn', N'Could not find stored procedure '' SP_UpdateInventoryItem''.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T09:47:17.803' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1296, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T13:59:30.297' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1297, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T14:03:16.867' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1298, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T14:14:05.583' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1299, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_AddMonster'' expects parameter ''@parm_monsterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_AddMonster'' expects parameter ''@parm_monsterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T14:35:54.180' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1300, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T15:58:31.280' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1301, N'System.Data.SqlClient.SqlException (0x80131904): The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "', N'The INSERT statement conflicted with the FOREIGN KEY constraint "FK__Character__chara__7C4F7684". The conflict occurred in database "XGame", table "dbo.Users", column ''user_ID''.
The statement has been terminated.', N'.Net SqlClient Data Provider', CAST(N'2019-07-24T16:00:24.357' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1302, N'System.InvalidCastException: Specified cast is not valid.
   at XGame_DAL.ModifyClass.GetClassInfo(Int32 classID) in C:\Users\Admin-2\source\repos\XGame_Xavier\XGame_DAL\ModifyClass.cs:line ', N'Specified cast is not valid.', N'XGame_DAL', CAST(N'2019-07-25T10:33:23.737' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1303, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-26T11:59:20.280' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1304, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-26T12:35:03.573' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1305, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-26T12:38:07.387' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1306, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateCharacter'' expects parameter ''@parm_charcterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.O', N'Procedure or function ''SP_UpdateCharacter'' expects parameter ''@parm_charcterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-29T08:44:04.780' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1307, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateCharacter'' expects parameter ''@parm_charcterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.O', N'Procedure or function ''SP_UpdateCharacter'' expects parameter ''@parm_charcterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-29T08:44:17.043' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1308, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateCharacter'' expects parameter ''@parm_charcterName'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.O', N'Procedure or function ''SP_UpdateCharacter'' expects parameter ''@parm_charcterName'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-29T08:45:02.717' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1309, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-29T22:14:40.857' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1310, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-29T22:19:42.423' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1311, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-29T22:19:59.050' AS DateTime))
INSERT [dbo].[ErrorLogging] ([log_ID], [errorName], [errorMsg], [errorSrc], [errorDate]) VALUES (1312, N'System.Data.SqlClient.SqlException (0x80131904): Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.
   at System.Data.SqlClient.SqlConnection.OnError', N'Procedure or function ''SP_UpdateUser'' expects parameter ''@parm_newPassword'', which was not supplied.', N'.Net SqlClient Data Provider', CAST(N'2019-07-31T10:13:11.540' AS DateTime))
SET IDENTITY_INSERT [dbo].[ErrorLogging] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventories] ON 

INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (666, 155, 18, 0)
INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (668, 155, 17, 1)
INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (669, 155, 17, 0)
INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (671, 155, 5, 0)
INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (674, 164, 20, 1)
INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (675, 166, 17, 1)
INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (677, 166, 4, 0)
INSERT [dbo].[Inventories] ([inventory_ID], [character_FK], [item_FK], [isEquipted]) VALUES (678, 166, 4, 0)
SET IDENTITY_INSERT [dbo].[Inventories] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (0, N'Test Item: Dont remove', 10, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (3, N'Health Potion', 5, 0, 0, 0, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (4, N'Better Health Potion', 15, 0, 0, 0, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (5, N'Arcane Health Potion', 30, 0, 0, 0, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (6, N'Stamina Scrap', 0, 0, 5, 1, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (7, N'Energy Potion', 0, 0, 15, 1, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (8, N'Pure Energy', 0, 0, 20, 1, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (9, N'Wiff of Magica', 0, 5, 0, 2, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (10, N'Bottled Essence', 0, 15, 0, 2, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (11, N'Spirit of arcane', 0, 40, 0, 2, 10, 0, 0, 0, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (12, N'Ragged Robes', 0, 30, 0, 3, 10, 1, 0, 0, 1)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (13, N'Simple Leather Armor', 0, 0, 30, 3, 10, 10, 0, 0, 2)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (14, N'Dingy Iron Armor', 30, 0, 0, 3, 10, 20, 0, 0, 3)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (15, N'Light Dagger', 0, 0, -10, 4, 10, 0, 10, 1, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (16, N'Stinger', 0, 0, -15, 4, 10, 0, 15, 2, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (17, N'A Sword?', 0, 0, -20, 4, 10, 0, 25, 3, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (18, N'Pwn Hammer', 0, 0, -20, 4, 10, 0, 25, 4, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (19, N'The Logger', 0, 0, -20, 4, 10, 0, 25, 5, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (20, N'Gandalfs Staff', 0, -20, 0, 4, 10, 0, 50, 6, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (21, N'The book of liffe', 0, -100, 0, 4, 10, 0, 100, 7, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (22, N'Admin Power', 0, 0, 0, 4, 10, 0, 999, 7, 0)
INSERT [dbo].[Items] ([item_ID], [itemName], [healthModifier], [magicaModifier], [staminaModifier], [itemType], [goldPrice], [armorMod], [damageMod], [weaponType], [armorType]) VALUES (23, N'Pointy Things', 0, 0, -10, 4, 10, 0, 15, 8, 0)
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[Monsters] ON 

INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (50, N'KingSLime', 300, 0, 10, 1, 2)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (51, N'Spider', 25, 5, 20, 2, 2)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (52, N'Sprite', 30, 5, 20, 3, 1)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (53, N'Bandit', 60, 15, 25, 4, 2)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (54, N'Orc', 70, 10, 35, 5, 2)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (55, N'Elemental', 85, 15, 30, 6, 1)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (56, N'Dark Elf', 100, 30, 40, 7, 2)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (57, N'Phantom', 90, 10, 60, 8, 0)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (58, N'Troll', 130, 25, 60, 9, 1)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (59, N'Eldare Dragon', 200, 35, 100, 10, 0)
INSERT [dbo].[Monsters] ([monster_ID], [monsterName], [monsterHealth], [monsterArmor], [monsterDamage], [monsterDanger], [monsterBehaviour]) VALUES (61, N'King', 50, 10, 50, 2, 2)
SET IDENTITY_INSERT [dbo].[Monsters] OFF
GO
SET IDENTITY_INSERT [dbo].[Regions] ON 

INSERT [dbo].[Regions] ([region_ID], [regionName], [regionDanger], [hasShop], [regionDesc]) VALUES (0, N'XGame', 1, 1, N'The capital of the land of XGame. You can see busy people rushing about, and noble talking and laughing as they drink thier fancy tea. 
As you look around the many shops and businesses a large grey castle can be seen in the distance.')
INSERT [dbo].[Regions] ([region_ID], [regionName], [regionDanger], [hasShop], [regionDesc]) VALUES (2, N'Black Mountain', 7, 0, N'You feel the cold air of the mountain as you arrive. No sound but the eerie wind and pepples benearth your feet. Altough not seeing anyone you feel
as if youre being watched. Dont let your guard down here.')
INSERT [dbo].[Regions] ([region_ID], [regionName], [regionDanger], [hasShop], [regionDesc]) VALUES (3, N'Shifting Swamp', 5, 0, N'Welcom to the swamp. The smell of decay and sweet flowers hits your nose making you scrunc your face at the mixture. The sounds of 
wildlife can be heard everywhere as you stand a few meters from a large body of water. You feel a mistep could get you killed here...')
INSERT [dbo].[Regions] ([region_ID], [regionName], [regionDanger], [hasShop], [regionDesc]) VALUES (4, N'Bleeding Meadow', 3, 0, N'The bleeding meadow. You see a beautiful field of gentle grass a few flowers scattered throught the area. The more you stand here 
the colder you feel. You remember the legends of the elven war that took blace here. Shaking your head you think of what to do.')
INSERT [dbo].[Regions] ([region_ID], [regionName], [regionDanger], [hasShop], [regionDesc]) VALUES (5, N'Misty Mountain', 10, 1, N'Walking into the thick mist you squint your eyes trying to look ahead. The area suprisingly warm as you walk. Your steps making 
soft taps on the grey stone. This place has rumors of dangerous creatures roaming about. Dont let your guard down.')
SET IDENTITY_INSERT [dbo].[Regions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_ID], [roleName]) VALUES (0, N'User')
INSERT [dbo].[Roles] ([role_ID], [roleName]) VALUES (1, N'Administrator')
INSERT [dbo].[Roles] ([role_ID], [roleName]) VALUES (3, N'GameMaster')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_ID], [role_FK], [userName], [userPassword], [dateAdded], [dateModified], [Email]) VALUES (1126, 0, N'User', N'Password99@', CAST(N'2019-06-27T14:29:06.453' AS DateTime), CAST(N'2019-06-27T14:29:06.453' AS DateTime), N'None')
INSERT [dbo].[Users] ([user_ID], [role_FK], [userName], [userPassword], [dateAdded], [dateModified], [Email]) VALUES (1130, 1, N'User1', N'Password99@', CAST(N'2019-06-27T14:39:08.343' AS DateTime), CAST(N'2019-06-27T14:39:08.343' AS DateTime), N'xxx@mail.com')
INSERT [dbo].[Users] ([user_ID], [role_FK], [userName], [userPassword], [dateAdded], [dateModified], [Email]) VALUES (1159, 3, N'GameMaster', N'Password99@', CAST(N'2019-07-29T22:18:47.027' AS DateTime), CAST(N'2019-07-29T22:18:47.027' AS DateTime), N'xxx@mail.com')
INSERT [dbo].[Users] ([user_ID], [role_FK], [userName], [userPassword], [dateAdded], [dateModified], [Email]) VALUES (1160, 1, N'Game', N'Password99@', CAST(N'2019-07-29T22:19:14.040' AS DateTime), CAST(N'2019-07-29T22:19:14.040' AS DateTime), N'xxx@mail.com')
INSERT [dbo].[Users] ([user_ID], [role_FK], [userName], [userPassword], [dateAdded], [dateModified], [Email]) VALUES (1161, 1, N'HappyDude', N'Password99@', CAST(N'2019-07-31T10:05:21.900' AS DateTime), CAST(N'2019-07-31T10:05:21.900' AS DateTime), N'mail@mail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Characters] ADD  DEFAULT ((0)) FOR [Armor]
GO
ALTER TABLE [dbo].[ErrorLogging] ADD  DEFAULT (getdate()) FOR [errorDate]
GO
ALTER TABLE [dbo].[Inventories] ADD  DEFAULT ((0)) FOR [isEquipted]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [armorMod]
GO
ALTER TABLE [dbo].[Items] ADD  DEFAULT ((0)) FOR [damageMod]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [dateModified]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('No Email') FOR [Email]
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD FOREIGN KEY([characterClass_FK])
REFERENCES [dbo].[Classes] ([class_ID])
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD FOREIGN KEY([characterLocation_FK])
REFERENCES [dbo].[Regions] ([region_ID])
GO
ALTER TABLE [dbo].[Characters]  WITH CHECK ADD FOREIGN KEY([characterUser_FK])
REFERENCES [dbo].[Users] ([user_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventories]  WITH CHECK ADD FOREIGN KEY([character_FK])
REFERENCES [dbo].[Characters] ([character_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventories]  WITH CHECK ADD FOREIGN KEY([item_FK])
REFERENCES [dbo].[Items] ([item_ID])
GO
ALTER TABLE [dbo].[monsterDrops]  WITH CHECK ADD FOREIGN KEY([item_FK])
REFERENCES [dbo].[Items] ([item_ID])
GO
ALTER TABLE [dbo].[monsterDrops]  WITH CHECK ADD FOREIGN KEY([monster_FK])
REFERENCES [dbo].[Monsters] ([monster_ID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([role_FK])
REFERENCES [dbo].[Roles] ([role_ID])
GO
/****** Object:  StoredProcedure [dbo].[SP_AddCharacter]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddCharacter] 
	-- Add the parameters for the stored procedure here
	@parm_characterName NVARCHAR(200),
	@parm_characterClass INT,
	@parm_characterUser INT,
	@parm_characterHealth INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Characters(characterName, characterClass_FK,characterLocation_FK, characterUser_FK, characterGold, characterLvl, characterXP,characterHealth, MaxHP)
	VALUES(
	@parm_characterName, 
	@parm_characterClass,
	0,
	@parm_characterUser,
	100,
	1,
	0,
	@parm_characterHealth,
	@parm_characterHealth
	);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddMonster]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddMonster] 
	-- Add the parameters for the stored procedure here
	@parm_monsterName NVARCHAR(100),
	@parm_monsterHealth INT,
	@parm_monsterArmor INT,
	@parm_monsterDamage INT, 
	@parm_monsterDanger INT,
	@parm_monsterBehaviour INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Monsters(monsterName, monsterHealth, monsterArmor, monsterDamage, monsterDanger, monsterBehaviour)
	VALUES(
	@parm_monsterName,
	@parm_monsterHealth,
	@parm_monsterArmor,
	@parm_monsterDamage, 
	@parm_monsterDanger, 
	@parm_monsterBehaviour
	)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddToInventory]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddToInventory] 
	-- Add the parameters for the stored procedure here
	@parm_characterID INT,
	@parm_itemID INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Inventories(character_FK, item_FK)
	VALUES(
	@parm_characterID,
	@parm_itemID
	)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_AddUsers]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AddUsers]
	-- Add the parameters for the stored procedure here
	@parm_username NVARCHAR(500),
	@parm_password NVARCHAR(200),
	@parm_email NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Users(userName, role_FK, userPassword, Email)
	VALUES(
	@parm_username,
	0,
	@parm_password,
	@parm_email
	);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ChangeUserRole]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_ChangeUserRole]
	-- Add the parameters for the stored procedure here
	@parm_userID INT,
	@parm_newRole INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Users
	SET role_FK = @parm_newRole
	WHERE user_ID = @parm_userID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CheckForUsername]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_CheckForUsername] 
	-- Add the parameters for the stored procedure here
	@parm_userName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT userName FROM Users
	WHERE userName = @parm_userName;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ClearInventory]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_ClearInventory] 
	-- Add the parameters for the stored procedure here
	@parm_characterID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Inventories
	WHERE character_FK = @parm_characterID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCharacter]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
/*
                                character.Armor = (int)reader["Armor"];*/
CREATE PROCEDURE  [dbo].[SP_GetCharacter]
	-- Add the parameters for the stored procedure here
	@parm_characterID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT characterName, characterClass_FK, characterHealth,MaxHP, characterLocation_FK, characterXP, characterGold,characterLvl,Armor FROM Characters
	WHERE character_ID = @parm_characterID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCharacterInventory]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetCharacterInventory] 
	-- Add the parameters for the stored procedure here
	@parm_characterID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT armorMod, damageMod,itemName, item_FK,healthModifier, staminaModifier, magicaModifier,itemType,goldPrice,inventory_ID,isEquipted FROM Inventories
JOIN Items ON Inventories.item_FK = Items.item_ID
WHERE Inventories.character_FK  = @parm_characterID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCharacterList]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_GetCharacterList]
	-- Add the parameters for the stored procedure here
	@parm_userID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT characterName, characterLvl,Classes.className,Classes.class_ID, character_ID, characterHealth,MaxHp,characterXP, characterGold
	FROM Characters
	JOIN Classes ON Characters.characterClass_FK = Classes.class_ID
	WHERE characterUser_FK = @parm_userID;
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetClassInfo]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetClassInfo] 
	-- Add the parameters for the stored procedure here
	@parm_classID INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT classArmor, classDamage, classStamina, classMagica,className, baseHP FROM Classes
	WHERE class_ID = @parm_classID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetClassList]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetClassList]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT class_ID, className FROM Classes;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetInventoryID]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetInventoryID]
	-- Add the parameters for the stored procedure here
	@parm_characterID INT,
	@parm_itemID INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT inventory_ID FROM Inventories
	WHERE character_FK = @parm_characterID AND item_FK = @parm_itemID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetItemsList]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetItemsList] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT item_ID, itemName,itemType, magicaModifier, healthModifier, staminaModifier, armorMod, armorType, damageMod, weaponType, goldPrice FROM Items;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMonsterList]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetMonsterList] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT monsterName, monsterBehaviour,monsterHealth, monsterArmor, monsterDanger, monsterDamage, monster_ID FROM Monsters;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMonstersByDanger]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetMonstersByDanger] 
	-- Add the parameters for the stored procedure here
	@parm_minDanger INT,
	@parm_maxDanger INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT monster_ID, monsterName, monsterHealth, monsterArmor, monsterDamage, monsterDanger,monsterBehaviour 
	FROM Monsters
	WHERE monsterDanger BETWEEN @parm_minDanger AND @parm_maxDanger;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRegionInfo]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRegionInfo]
	-- Add the parameters for the stored procedure here
	@parm_regionID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT regionDanger, hasShop, region_ID FROM Regions
	WHERE region_ID = @parm_regionID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRegions]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRegions] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  regionDanger, regionName,hasShop, region_ID, regionDesc FROM Regions;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetRoles]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetRoles]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Roles;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetTestCharacterID]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetTestCharacterID] 
	-- Add the parameters for the stored procedure here
	@parm_characterName NVARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT character_ID FROM Characters
	WHERE characterName = @parm_characterName;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetTestMonsterID]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetTestMonsterID] 
	-- Add the parameters for the stored procedure here
	@parm_monsterName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT monster_ID FROM Monsters
	WHERE monsterName = @parm_monsterName
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsers]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUsers]
	-- Add the parameters for the stored procedure here
	@parm_username NVARCHAR(500),
	@parm_password NVARCHAR(200)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT user_ID, userName,role_FK , Email FROM Users
	WHERE userName = @parm_username AND userPassword = @parm_password;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GetUsersList]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_GetUsersList]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT user_ID, userName,dateAdded, Email, role_FK FROM Users;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LogError]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_LogError]
	-- Add the parameters for the stored procedure here
	@parm_errorName NVARCHAR(200),
	@parm_errorMsg NVARCHAR(MAX),
	@parm_errorSrc NVARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO ErrorLogging(errorName, errorMsg, errorSrc)
	VALUES(
	@parm_errorName,
	@parm_errorMsg,
	@parm_errorSrc
	)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ReadError]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_ReadError] 
	-- Add the parameters for the stored procedure here
	@parm_errorName NVARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select errorName FROM ErrorLogging
	WHERE errorName = @parm_errorName;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveCharacter]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RemoveCharacter] 
	-- Add the parameters for the stored procedure here
	@parm_characterID INT,
	@parm_userID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Characters
	WHERE character_ID = @parm_characterID AND characterUser_FK = @parm_userID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveError]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_RemoveError]
	-- Add the parameters for the stored procedure here
	@parm_errorName NVARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM ErrorLogging
	WHERE errorName = @parm_errorName;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveItemFromInventory]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RemoveItemFromInventory] 
	-- Add the parameters for the stored procedure here
	@parm_inventoryID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Inventories
	WHERE inventory_ID = @parm_inventoryID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveMonster]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RemoveMonster] 
	-- Add the parameters for the stored procedure here
	@parm_monsterID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Monsters
	WHERE monster_ID = @parm_monsterID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveTestCharacters]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RemoveTestCharacters] 
	-- Add the parameters for the stored procedure here
	@parm_characterName NVARCHAR(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Characters
	WHERE characterName = @parm_characterName;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveTestMonster]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RemoveTestMonster] 
	-- Add the parameters for the stored procedure here
	@parm_monsterName NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Monsters
	WHERE monsterName = @parm_monsterName
END
GO
/****** Object:  StoredProcedure [dbo].[SP_RemoveUser]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_RemoveUser]
	-- Add the parameters for the stored procedure here
	@parm_userID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DELETE FROM Users 
	WHERE user_ID = @parm_userID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateCharacter]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateCharacter] 
	-- Add the parameters for the stored procedure here
	@parm_characterLocation INT,
	@parm_characterGold INT,
	@parm_characterLvl INT, 
	@parm_characterXp INT,
	@parm_characterHealth INT,
	@parm_characterID INT,
	@parm_maxHealth INT,
	@parm_charcterName NVARCHAR(200),
	@parm_classID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Characters
	SET characterLocation_FK = @parm_characterLocation,
		characterGold = @parm_characterGold,
		characterLvl = @parm_characterLvl,
		characterXP = @parm_characterXp,
		characterHealth = @parm_characterHealth,
		MaxHP = @parm_maxHealth,
		characterClass_FK = @parm_classID,
		characterName = @parm_charcterName
	WHERE character_ID = @parm_characterID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateInventoryItem]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_UpdateInventoryItem]
	-- Add the parameters for the stored procedure here
	@parm_inventoryID INT, 
	@parm_isEquipted INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Inventories
	SET isEquipted = @parm_isEquipted
	WHERE inventory_ID = @parm_inventoryID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateMonster]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateMonster]
	-- Add the parameters for the stored procedure here
	@parm_monsterID INT,
	@parm_monsterName NVARCHAR(100),
	@parm_monsterHealth INT,
	@parm_monsterArmor INT,
	@parm_monsterDamage INT, 
	@parm_monsterDanger INT,
	@parm_monsterBehaviour INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Monsters
	SET monsterName = @parm_monsterName,
		monsterHealth = @parm_monsterHealth,
		monsterArmor = @parm_monsterArmor,
		monsterDamage = @parm_monsterDamage,
		monsterDanger = @parm_monsterDanger,
		monsterBehaviour = @parm_monsterBehaviour
	WHERE monster_ID = @parm_monsterID
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUser]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE  [dbo].[SP_UpdateUser]
	-- Add the parameters for the stored procedure here
	@parm_userID INT,
	@parm_newUsername NVARCHAR(200),
	@parm_newPassword NVARCHAR(200),
	@parm_newEmail NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Users
	SET userName = @parm_newUsername, userPassword = @parm_newPassword, Email = @parm_newEmail
	WHERE user_ID = @parm_userID;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUserCharacter]    Script Date: 3/1/2021 1:41:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateUserCharacter]
	-- Add the parameters for the stored procedure here
	@parm_characterName NVARCHAR(200),
	@parm_characterID INT,
	@parm_classID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Characters
	SET characterName = @parm_characterName, characterClass_FK = @parm_classID
	WHERE character_ID = @parm_characterID
END
GO











-- ALL ALTERS GO BELOW !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- DO NOT CHANGE ANYTHING ABOVE !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-- COMMENT YOUR CHANGE WITH AUTHOR, DATE, DESCRIPTION
-- =============================================
-- EDITS BEGIN HERE
-- =============================================

/****** Object:  StoredProcedure [dbo].[SP_GetCharacterList]    Script Date: 1/4/2022 2:25:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		aaron
-- Create date: 1/4/22
-- Description:	updated getCharacterList to include gold
-- =============================================
ALTER PROCEDURE  [dbo].[SP_GetCharacterList]
	-- Add the parameters for the stored procedure here
	@parm_userID INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT characterName, characterLvl,Classes.className,Classes.class_ID, character_ID, characterHealth,MaxHp,characterXP, characterGold
	FROM Characters
	JOIN Classes ON Characters.characterClass_FK = Classes.class_ID
	WHERE characterUser_FK = @parm_userID;
	
END
GO

GO
-- =============================================
-- Author:		giancarlo rhodes
-- Create date:  1/5/2021
-- Description:	needs to include password so it's being added
-- =============================================
ALTER PROCEDURE [dbo].[SP_GetUsersList]
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT user_ID, userName,dateAdded, Email, role_FK, userPassword FROM Users;
END



-- =============================================
-- Author:		Aaron
-- Create date: 1/4/22
-- Description:	update to region descriptions
-- =============================================

GO
UPDATE Regions
	SET regionDesc = 'The capital of the land of XGame. You can see busy people rushing about, and nobles talking and laughing as they drink their fancy tea. 
	As you look around you see many shops and businesses. A large gray castle can also be seen in the distance.'
	WHERE region_ID = 0
UPDATE Regions
	SET regionDesc = 'You feel the cold air of the mountain as you arrive. The only sounds are the eerie wind and pebbles beneath your feet. You see noone but feel
	as if you are being watched. Do not let your guard down here.'
	WHERE region_ID = 2
UPDATE Regions
	SET regionDesc = 'Welcome to the swamp. The smell of decay and sweet flowers hits your nose making you scrunch your face at the mixture. The sounds of 
	wildlife can be heard everywhere as you stand a few meters from a large body of water. You feel a mistep could get you killed here...'
	WHERE region_ID = 3
UPDATE Regions
	SET regionDesc = 'The bleeding meadow. You see a beautiful field of gentle grass a few flowers scattered throught the area. The more you stand here 
	the colder you feel. You remember the legends of the elven war that took blace here. Shaking your head you think of what to do.'
	WHERE region_ID = 4
UPDATE Regions
	SET regionDesc = 'Walking into the thick mist you squint your eyes trying to look ahead. The area is suprisingly warm as you walk. Your steps making 
	soft taps on the gray stone. This place has rumors of dangerous creatures roaming about. Do not let your guard down.'
	WHERE region_ID = 5

-- =============================================
-- Author:		Aaron
-- Create date: 1/4/22
-- Description:	update "test item" to "Greater Health Potion", update KingSlime health for balancing and fix name spelling.
-- =============================================

UPDATE Items
	SET itemName = 'Greater Health Potion',
		healthModifier = 40,
		goldPrice = 20
	WHERE item_ID = 0
UPDATE Monsters 
SET monsterName = 'King Slime',
	monsterHealth = 100
	WHERE monster_ID = 50






GO
-- =============================================
-- Author:		giancarlo rhodes
-- Create date: 1/5/2022
-- Description:	working on admin user updates, adding the existing sp
-- =============================================
ALTER PROCEDURE  [dbo].[SP_UpdateUser]
	-- Add the parameters for the stored procedure here
	@parm_userID INT,
	@parm_newRoleID INT,
	@parm_newUsername NVARCHAR(500),
	@parm_newPassword NVARCHAR(200),
	@parm_dateModified DATETIME,
	@parm_newEmail NVARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--UPDATE Users
	--	SET 
	--		userName = @parm_newUsername, 
	--		userPassword = @parm_newPassword, 
	--		Email = @parm_newEmail
	--WHERE user_ID = @parm_userID;

	UPDATE [dbo].[Users]
		   SET 
				[role_FK] = @parm_newRoleID
				,[userName] = @parm_newUsername
				,[userPassword] = @parm_newPassword
				,[dateModified] = @parm_dateModified
				,[Email] = @parm_newEmail
			WHERE  user_ID = @parm_userID;
END




-- =============================================
-- EDITS END HERE
-- =============================================







USE [master]
GO
ALTER DATABASE [XGame] SET  READ_WRITE 
GO

