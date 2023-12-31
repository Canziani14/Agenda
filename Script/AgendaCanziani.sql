USE [master]
GO
/****** Object:  Database [Agenda]    Script Date: 29/11/2023 22:01:24 ******/
CREATE DATABASE [Agenda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Agenda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Agenda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Agenda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Agenda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Agenda] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Agenda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Agenda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Agenda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Agenda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Agenda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Agenda] SET ARITHABORT OFF 
GO
ALTER DATABASE [Agenda] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Agenda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Agenda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Agenda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Agenda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Agenda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Agenda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Agenda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Agenda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Agenda] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Agenda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Agenda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Agenda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Agenda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Agenda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Agenda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Agenda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Agenda] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Agenda] SET  MULTI_USER 
GO
ALTER DATABASE [Agenda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Agenda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Agenda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Agenda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Agenda] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Agenda] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Agenda] SET QUERY_STORE = ON
GO
ALTER DATABASE [Agenda] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Agenda]
GO
/****** Object:  Table [dbo].[Agenda]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agenda](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[varDescripcion] [nvarchar](50) NULL,
	[intCantidadContactos] [int] NULL,
 CONSTRAINT [PK_Agenda] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacto](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[varNombre] [nvarchar](50) NOT NULL,
	[varSegundoNombre] [nvarchar](50) NULL,
	[varApellido] [nvarchar](50) NOT NULL,
	[intIdAgenda] [int] NULL,
 CONSTRAINT [PK_Contacto] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Direccion]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Direccion](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[intIdPais] [int] NULL,
	[intIdProvincia] [int] NULL,
	[varCalle] [nvarchar](50) NULL,
	[varAltura] [int] NOT NULL,
	[varPiso] [nvarchar](50) NULL,
	[varDepartmento] [nvarchar](50) NULL,
	[intIdLocalidad] [int] NOT NULL,
	[intIdContacto] [int] NOT NULL,
 CONSTRAINT [PK_Direccion] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Localidad]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Localidad](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[intIdPais] [int] NOT NULL,
	[intIdProvincia] [int] NOT NULL,
	[varDescripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Localidad] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[varDescripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Pais] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[intIdPais] [int] NOT NULL,
	[varDescripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Provincia] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[intIdTipo] [int] NOT NULL,
	[varNumero] [nvarchar](50) NOT NULL,
	[intIdContacto] [int] NOT NULL,
 CONSTRAINT [PK_Telefono] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TelefonoTipo]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TelefonoTipo](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[varDescripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TelefonoTipo] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agenda] ON 

INSERT [dbo].[Agenda] ([intId], [varDescripcion], [intCantidadContactos]) VALUES (2, N'Agenda de Otero', 2)
INSERT [dbo].[Agenda] ([intId], [varDescripcion], [intCantidadContactos]) VALUES (3, N'Agenda Loca', 3)
SET IDENTITY_INSERT [dbo].[Agenda] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacto] ON 

INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (1, N'Diego', N'Alejandro', N'Otero', 2)
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (2, N'Pipa', N'Martin', N'Cincinati', 2)
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (3, N'Martin', N'Gerardo', N'Loustou', 3)
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (4, N'Juan', N'Diego', N'Garcia', 3)
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (5, N'natalia', N'veronica', N'caironi', 3)
SET IDENTITY_INSERT [dbo].[Contacto] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidad] ON 

INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (142, 1, 30, N'Adolfo Gonzales Chaves')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (143, 1, 30, N'Balcarce')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (144, 1, 30, N'Baradero')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (145, 1, 30, N'Benito Juarez')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (146, 1, 30, N'Alberti')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (147, 1, 30, N'Arrecifes')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (148, 1, 30, N'Almirante Brown')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (149, 1, 30, N'Avellaneda')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (150, 1, 30, N'Ayacucho')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (151, 1, 30, N'Azul')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (152, 1, 30, N'Bahiaa Blanca')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (153, 1, 30, N'Berazategui')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (154, 1, 30, N'Berisso')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (155, 1, 30, N'Boli­var')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (156, 1, 30, N'Bragado')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (157, 1, 30, N'Adolfo Alsina')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (158, 1, 30, N'Brandsen')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (159, 1, 30, N'Campana')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (160, 1, 30, N'Cañuelas')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (161, 1, 30, N'Capitan Sarmiento')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (162, 1, 30, N'Carlos Casares')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (163, 1, 30, N'Carlos Tejedor')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (164, 1, 30, N'Carmen de Areco')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (165, 1, 30, N'Castelli')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (166, 1, 30, N'Colon')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (167, 1, 30, N'Coronel de Marina Leonardo Rosales')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (168, 1, 30, N'Coronel Dorrego')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (169, 1, 30, N'Coronel Pringles')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (170, 1, 30, N'Coronel Suarez')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (171, 1, 30, N'Chacabuco')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (172, 1, 30, N'Chascomus')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (173, 1, 30, N'Lezama')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (174, 1, 30, N'Chivilcoy')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (175, 1, 30, N'Daireaux')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (176, 1, 30, N'Dolores')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (177, 1, 30, N'Ensenada')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (178, 1, 30, N'Escobar')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (179, 1, 30, N'Esteban Echeverri­a')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (180, 1, 30, N'Exaltacion de la Cruz')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (181, 1, 30, N'Ezeiza')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (182, 1, 30, N'Florencio Varela')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (183, 1, 30, N'Florentino Ameghino')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (184, 1, 30, N'General Alvarado')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (185, 1, 30, N'General Alvear')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (186, 1, 30, N'General Arenales')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (187, 1, 30, N'General Belgrano')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (188, 1, 30, N'General Guido')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (189, 1, 30, N'General Juan Madariaga')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (190, 1, 30, N'General la Madrid')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (191, 1, 30, N'General las Heras')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (192, 1, 30, N'General Lavalle')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (193, 1, 30, N'General Paz')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (194, 1, 30, N'General Pinto')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (195, 1, 30, N'General Pueyrredon')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (196, 1, 30, N'General Rodriguez')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (197, 1, 30, N'General San Martin')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (198, 1, 30, N'General Viamonte')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (199, 1, 30, N'General Villegas')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (200, 1, 30, N'Guamini')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (201, 1, 30, N'Hipolito Yrigoyen')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (202, 1, 30, N'Hurlingham')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (203, 1, 30, N'Ituzaingo')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (204, 1, 30, N'Jose C. Paz')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (205, 1, 30, N'Junin')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (206, 1, 30, N'La Costa')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (207, 1, 30, N'La Matanza')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (208, 1, 30, N'LanÃºs')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (209, 1, 30, N'La Plata')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (210, 1, 30, N'Laprida')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (211, 1, 30, N'Las Flores')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (212, 1, 30, N'Leandro N. Alem')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (213, 1, 30, N'Lincoln')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (214, 1, 30, N'Lober­a')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (215, 1, 30, N'Lobos')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (216, 1, 30, N'Lomas de Zamora')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (217, 1, 30, N'Lujan')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (218, 1, 30, N'Magdalena')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (219, 1, 30, N'Maipu')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (220, 1, 30, N'Malvinas Argentinas')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (221, 1, 30, N'Mar Chiquita')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (222, 1, 30, N'Marcos Paz')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (223, 1, 30, N'Mercedes')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (224, 1, 30, N'Merlo')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (225, 1, 30, N'Monte')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (226, 1, 30, N'Monte Hermoso')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (227, 1, 30, N'Moreno')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (228, 1, 30, N'Mor0n')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (229, 1, 30, N'Navarro')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (230, 1, 30, N'Necochea')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (231, 1, 30, N'9 de Julio')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (232, 1, 30, N'Olavarria')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (233, 1, 30, N'Patagones')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (234, 1, 30, N'Pehuajo')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (235, 1, 30, N'Pellegrini')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (236, 1, 30, N'Pergamino')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (237, 1, 30, N'Pila')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (238, 1, 30, N'Pilar')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (239, 1, 30, N'Pinamar')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (240, 1, 30, N'Presidente Peron')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (241, 1, 30, N'Puan')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (242, 1, 30, N'Punta Indio')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (243, 1, 30, N'Quilmes')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (244, 1, 30, N'Ramallo')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (245, 1, 30, N'Rauch')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (246, 1, 30, N'Rivadavia')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (247, 1, 30, N'Rojas')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (248, 1, 30, N'Roque Perez')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (249, 1, 30, N'Saavedra')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (250, 1, 30, N'Saladillo')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (251, 1, 30, N'Salto')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (252, 1, 30, N'Salliquela')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (253, 1, 30, N'San Andres de Giles')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (254, 1, 30, N'San Antonio de Areco')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (255, 1, 30, N'San Cayetano')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (256, 1, 30, N'San Fernando')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (257, 1, 30, N'San Isidro')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (258, 1, 30, N'San Miguel')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (259, 1, 30, N'San NicolÃ¡s')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (260, 1, 30, N'San Pedro')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (261, 1, 30, N'San Vicente')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (262, 1, 30, N'Suipacha')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (263, 1, 30, N'Tandil')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (264, 1, 30, N'Tapalque')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (265, 1, 30, N'Tigre')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (266, 1, 30, N'Tordillo')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (267, 1, 30, N'Tornquist')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (268, 1, 30, N'Trenque Lauquen')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (269, 1, 30, N'Tres Arroyos')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (270, 1, 30, N'Tres de Febrero')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (271, 1, 30, N'Tres Lomas')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (272, 1, 30, N'25 de Mayo')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (273, 1, 30, N'Vicente Lopez')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (274, 1, 30, N'Villa Gesell')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (275, 1, 30, N'Villarino')
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (276, 1, 30, N'Zarate')
SET IDENTITY_INSERT [dbo].[Localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (1, N'Argentina')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (2, N'Paraguay')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (3, N'Venezuela')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (4, N'Bolivia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (5, N'Uruguay')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (6, N'Afganistán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (7, N'Islas Gland')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (8, N'Albania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (9, N'Alemania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (10, N'Andorra')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (11, N'Angola')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (12, N'Anguilla')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (13, N'Antártida')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (14, N'Antigua y Barbuda')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (15, N'Antillas Holandesas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (16, N'Arabia Saudí')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (17, N'Argelia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (18, N'Argentina')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (19, N'Armenia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (20, N'Aruba')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (21, N'Australia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (22, N'Austria')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (23, N'Azerbaiyán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (24, N'Bahamas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (25, N'Bahréin')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (26, N'Bangladesh')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (27, N'Barbados')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (28, N'Bielorrusia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (29, N'Bélgica')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (30, N'Belice')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (31, N'Benin')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (32, N'Bermudas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (33, N'Bhután')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (34, N'Bolivia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (35, N'Bosnia y Herzegovina')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (36, N'Botsuana')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (37, N'Isla Bouvet')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (38, N'Brasil')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (39, N'Brunéi')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (40, N'Bulgaria')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (41, N'Burkina Faso')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (42, N'Burundi')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (43, N'Cabo Verde')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (44, N'Islas Caimán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (45, N'Camboya')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (46, N'Camerún')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (47, N'Canadá')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (48, N'República Centroafricana')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (49, N'Chad')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (50, N'República Checa')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (51, N'Chile')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (52, N'China')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (53, N'Chipre')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (54, N'Isla de Navidad')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (55, N'Ciudad del Vaticano')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (56, N'Islas Cocos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (57, N'Colombia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (58, N'Comoras')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (59, N'República Democrática del Congo')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (60, N'Congo')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (61, N'Islas Cook')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (62, N'Corea del Norte')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (63, N'Corea del Sur')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (64, N'Costa de Marfil')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (65, N'Costa Rica')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (66, N'Croacia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (67, N'Cuba')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (68, N'Dinamarca')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (69, N'Dominica')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (70, N'República Dominicana')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (71, N'Ecuador')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (72, N'Egipto')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (73, N'El Salvador')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (74, N'Emiratos Árabes Unidos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (75, N'Eritrea')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (76, N'Eslovaquia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (77, N'Eslovenia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (78, N'España')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (79, N'Islas ultramarinas de Estados Unidos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (80, N'Estados Unidos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (81, N'Estonia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (82, N'Etiopía')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (83, N'Islas Feroe')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (84, N'Filipinas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (85, N'Finlandia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (86, N'Fiyi')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (87, N'Francia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (88, N'Gabón')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (89, N'Gambia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (90, N'Georgia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (91, N'Islas Georgias del Sur y Sandwich del Sur')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (92, N'Ghana')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (93, N'Gibraltar')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (94, N'Granada')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (95, N'Grecia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (96, N'Groenlandia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (97, N'Guadalupe')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (98, N'Guam')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (99, N'Guatemala')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (100, N'Guayana Francesa')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (101, N'Guinea')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (102, N'Guinea Ecuatorial')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (103, N'Guinea-Bissau')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (104, N'Guyana')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (105, N'Haití')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (106, N'Islas Heard y McDonald')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (107, N'Honduras')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (108, N'Hong Kong')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (109, N'Hungría')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (110, N'India')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (111, N'Indonesia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (112, N'Irán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (113, N'Iraq')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (114, N'Irlanda')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (115, N'Islandia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (116, N'Israel')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (117, N'Italia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (118, N'Jamaica')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (119, N'Japón')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (120, N'Jordania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (121, N'Kazajstán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (122, N'Kenia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (123, N'Kirguistán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (124, N'Kiribati')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (125, N'Kuwait')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (126, N'Laos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (127, N'Lesotho')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (128, N'Letonia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (129, N'Líbano')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (130, N'Liberia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (131, N'Libia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (132, N'Liechtenstein')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (133, N'Lituania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (134, N'Luxemburgo')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (135, N'Macao')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (136, N'ARY Macedonia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (137, N'Madagascar')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (138, N'Malasia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (139, N'Malawi')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (140, N'Maldivas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (141, N'Malí')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (142, N'Malta')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (143, N'Islas Malvinas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (144, N'Islas Marianas del Norte')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (145, N'Marruecos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (146, N'Islas Marshall')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (147, N'Martinica')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (148, N'Mauricio')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (149, N'Mauritania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (150, N'Mayotte')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (151, N'México')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (152, N'Micronesia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (153, N'Moldavia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (154, N'Mónaco')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (155, N'Mongolia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (156, N'Montserrat')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (157, N'Mozambique')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (158, N'Myanmar')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (159, N'Namibia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (160, N'Nauru')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (161, N'Nepal')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (162, N'Nicaragua')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (163, N'Níger')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (164, N'Nigeria')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (165, N'Niue')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (166, N'Isla Norfolk')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (167, N'Noruega')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (168, N'Nueva Caledonia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (169, N'Nueva Zelanda')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (170, N'Omán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (171, N'Países Bajos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (172, N'Pakistán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (173, N'Palau')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (174, N'Palestina')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (175, N'Panamá')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (176, N'Papúa Nueva Guinea')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (177, N'Paraguay')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (178, N'Perú')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (179, N'Islas Pitcairn')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (180, N'Polinesia Francesa')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (181, N'Polonia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (182, N'Portugal')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (183, N'Puerto Rico')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (184, N'Qatar')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (185, N'Reino Unido')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (186, N'Reunión')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (187, N'Ruanda')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (188, N'Rumania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (189, N'Rusia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (190, N'Sahara Occidental')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (191, N'Islas Salomón')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (192, N'Samoa')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (193, N'Samoa Americana')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (194, N'San Cristóbal y Nevis')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (195, N'San Marino')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (196, N'San Pedro y Miquelón')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (197, N'San Vicente y las Granadinas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (198, N'Santa Helena')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (199, N'Santa Lucía')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (200, N'Santo Tomé y Príncipe')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (201, N'Senegal')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (202, N'Serbia y Montenegro')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (203, N'Seychelles')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (204, N'Sierra Leona')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (205, N'Singapur')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (206, N'Siria')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (207, N'Somalia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (208, N'Sri Lanka')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (209, N'Suazilandia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (210, N'Sudáfrica')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (211, N'Sudán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (212, N'Suecia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (213, N'Suiza')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (214, N'Surinam')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (215, N'Svalbard y Jan Mayen')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (216, N'Tailandia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (217, N'Taiwán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (218, N'Tanzania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (219, N'Tayikistán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (220, N'Territorio Británico del Océano Índico')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (221, N'Territorios Australes Franceses')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (222, N'Timor Oriental')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (223, N'Togo')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (224, N'Tokelau')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (225, N'Tonga')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (226, N'Trinidad y Tobago')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (227, N'Túnez')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (228, N'Islas Turcas y Caicos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (229, N'Turkmenistán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (230, N'Turquía')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (231, N'Tuvalu')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (232, N'Ucrania')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (233, N'Uganda')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (234, N'Uruguay')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (235, N'Uzbekistán')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (236, N'Vanuatu')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (237, N'Venezuela')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (238, N'Vietnam')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (239, N'Islas Vírgenes Británicas')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (240, N'Islas Vírgenes de los Estados Unidos')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (241, N'Wallis y Futuna')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (242, N'Yemen')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (243, N'Yibuti')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (244, N'Zambia')
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (245, N'Zimbabue')
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (30, 1, N'BUENOS AIRES')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (31, 1, N'CATAMARCA')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (32, 1, N'CHACO')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (33, 1, N'CHUBUT')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (34, 1, N'CORDOBA')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (35, 1, N'CORRIENTES')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (36, 1, N'ENTRE RIOS')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (37, 1, N'FORMOSA')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (38, 1, N'JUJUY')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (39, 1, N'LA PAMPA')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (40, 1, N'LA RIOJA')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (41, 1, N'MENDOZA')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (42, 1, N'MISIONES')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (43, 1, N'NEUQUEN')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (44, 1, N'RIO NEGRO')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (45, 1, N'SALTA')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (46, 1, N'SAN JUAN')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (47, 1, N'SAN LUIS')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (48, 1, N'SANTA CRUZ')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (49, 1, N'SANTA FE')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (50, 1, N'SANTIAGO DEL ESTERO')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (51, 1, N'TIERRA DEL FUEGO')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (52, 1, N'TUCUMAN')
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (53, 1, N'CABA')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Telefono] ON 

INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (2, 1, N'+5491156898545', 1)
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (3, 3, N'+541156585458', 1)
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (7, 2, N'64343', 2)
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (8, 4, N'86736', 2)
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (9, 5, N'865', 1)
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (10, 3, N'876876', 2)
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (11, 2, N'112534891', 4)
SET IDENTITY_INSERT [dbo].[Telefono] OFF
GO
SET IDENTITY_INSERT [dbo].[TelefonoTipo] ON 

INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (1, N'Ninguno')
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (2, N'Particular')
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (3, N'Laboral')
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (4, N'Celular')
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (5, N'Familiar')
SET IDENTITY_INSERT [dbo].[TelefonoTipo] OFF
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Agenda] FOREIGN KEY([intIdAgenda])
REFERENCES [dbo].[Agenda] ([intId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contacto] CHECK CONSTRAINT [FK_Contacto_Agenda]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Contacto] FOREIGN KEY([intIdContacto])
REFERENCES [dbo].[Contacto] ([intId])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Contacto]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Localidad] FOREIGN KEY([intIdLocalidad])
REFERENCES [dbo].[Localidad] ([intId])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Localidad]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Pais] FOREIGN KEY([intIdPais])
REFERENCES [dbo].[Pais] ([intId])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Pais]
GO
ALTER TABLE [dbo].[Direccion]  WITH CHECK ADD  CONSTRAINT [FK_Direccion_Provincia] FOREIGN KEY([intIdProvincia])
REFERENCES [dbo].[Provincia] ([intId])
GO
ALTER TABLE [dbo].[Direccion] CHECK CONSTRAINT [FK_Direccion_Provincia]
GO
ALTER TABLE [dbo].[Localidad]  WITH CHECK ADD  CONSTRAINT [FK_Localidad_Provincia] FOREIGN KEY([intIdProvincia])
REFERENCES [dbo].[Provincia] ([intId])
GO
ALTER TABLE [dbo].[Localidad] CHECK CONSTRAINT [FK_Localidad_Provincia]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [FK_Provincia_Pais] FOREIGN KEY([intIdPais])
REFERENCES [dbo].[Pais] ([intId])
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [FK_Provincia_Pais]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_Contacto] FOREIGN KEY([intIdContacto])
REFERENCES [dbo].[Contacto] ([intId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Contacto]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_TelefonoTipo] FOREIGN KEY([intIdTipo])
REFERENCES [dbo].[TelefonoTipo] ([intId])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_TelefonoTipo]
GO
/****** Object:  StoredProcedure [dbo].[AgendaDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AgendaDelete]
(
	@intId int
)

as

 

delete from [Agenda]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[AgendaInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AgendaInsert]
(
	@varDescripcion nvarchar(50),
	@intCantidadContactos int
)

as

 

insert into [Agenda]
(
	[varDescripcion],
	[intCantidadContactos]
)
values
(
	@varDescripcion,
	@intCantidadContactos
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[AgendaSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AgendaSelect]
(
	@intId int
)

as

 

select [intId],
	[varDescripcion],
	[intCantidadContactos]
from [Agenda]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[AgendaSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AgendaSelectAll]

as

 

select [intId],
	[varDescripcion],
	[intCantidadContactos]
from [Agenda]
GO
/****** Object:  StoredProcedure [dbo].[AgendaUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[AgendaUpdate]
(
	@intId int,
	@varDescripcion nvarchar(50),
	@intCantidadContactos int
)

as

 

update [Agenda]
set [varDescripcion] = @varDescripcion,
	[intCantidadContactos] = @intCantidadContactos
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[ContactoDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ContactoDelete]
(
	@intId int
)

as

 

delete from [Contacto]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[ContactoDeleteAllByIntIdAgenda]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ContactoDeleteAllByIntIdAgenda]
(
	@intIdAgenda int
)

as

 

delete from [Contacto]
where [intIdAgenda] = @intIdAgenda
GO
/****** Object:  StoredProcedure [dbo].[ContactoInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ContactoInsert]
(
	@varNombre nvarchar(50),
	@varSegundoNombre nvarchar(50),
	@varApellido nvarchar(50),
	@intIdAgenda int
)

as

 

insert into [Contacto]
(
	[varNombre],
	[varSegundoNombre],
	[varApellido],
	[intIdAgenda]
)
values
(
	@varNombre,
	@varSegundoNombre,
	@varApellido,
	@intIdAgenda
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[ContactoSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ContactoSelect]
(
	@intId int
)

as

 

select [intId],
	[varNombre],
	[varSegundoNombre],
	[varApellido],
	[intIdAgenda]
from [Contacto]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[ContactoSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ContactoSelectAll]

as

 

select [intId],
	[varNombre],
	[varSegundoNombre],
	[varApellido],
	[intIdAgenda]
from [Contacto]
GO
/****** Object:  StoredProcedure [dbo].[ContactoSelectAllByIntIdAgenda]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ContactoSelectAllByIntIdAgenda]
(
	@intIdAgenda int
)

as

 

select [intId],
	[varNombre],
	[varSegundoNombre],
	[varApellido],
	[intIdAgenda]
from [Contacto]
where [intIdAgenda] = @intIdAgenda
GO
/****** Object:  StoredProcedure [dbo].[ContactoUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ContactoUpdate]
(
	@intId int,
	@varNombre nvarchar(50),
	@varSegundoNombre nvarchar(50),
	@varApellido nvarchar(50),
	@intIdAgenda int
)

as

 

update [Contacto]
set [varNombre] = @varNombre,
	[varSegundoNombre] = @varSegundoNombre,
	[varApellido] = @varApellido,
	[intIdAgenda] = @intIdAgenda
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[DireccionDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDelete]
(
	@intId int
)

as

 

delete from [Direccion]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdContacto]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDeleteAllByIntIdContacto]
(
	@intIdContacto int
)

as

 

delete from [Direccion]
where [intIdContacto] = @intIdContacto
GO
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdLocalidad]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDeleteAllByIntIdLocalidad]
(
	@intIdLocalidad int
)

as

 

delete from [Direccion]
where [intIdLocalidad] = @intIdLocalidad
GO
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdPais]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDeleteAllByIntIdPais]
(
	@intIdPais int
)

as

 

delete from [Direccion]
where [intIdPais] = @intIdPais
GO
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdProvincia]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionDeleteAllByIntIdProvincia]
(
	@intIdProvincia int
)

as

 

delete from [Direccion]
where [intIdProvincia] = @intIdProvincia
GO
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionInsert]
(
	@intIdPais int,
	@intIdProvincia int,
	@varCalle nvarchar(50),
	@varAltura int,
	@varPiso nvarchar(50),
	@varDepartmento nvarchar(50),
	@intIdLocalidad int,
	@intIdContacto int
)

as

 

insert into [Direccion]
(
	[intIdPais],
	[intIdProvincia],
	[varCalle],
	[varAltura],
	[varPiso],
	[varDepartmento],
	[intIdLocalidad],
	[intIdContacto]
)
values
(
	@intIdPais,
	@intIdProvincia,
	@varCalle,
	@varAltura,
	@varPiso,
	@varDepartmento,
	@intIdLocalidad,
	@intIdContacto
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[DireccionSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelect]
(
	@intId int
)

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varCalle],
	[varAltura],
	[varPiso],
	[varDepartmento],
	[intIdLocalidad],
	[intIdContacto]
from [Direccion]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAll]

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varCalle],
	[varAltura],
	[varPiso],
	[varDepartmento],
	[intIdLocalidad],
	[intIdContacto]
from [Direccion]
GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdContacto]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAllByIntIdContacto]
(
	@intIdContacto int
)

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varCalle],
	[varAltura],
	[varPiso],
	[varDepartmento],
	[intIdLocalidad],
	[intIdContacto]
from [Direccion]
where [intIdContacto] = @intIdContacto
GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdLocalidad]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAllByIntIdLocalidad]
(
	@intIdLocalidad int
)

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varCalle],
	[varAltura],
	[varPiso],
	[varDepartmento],
	[intIdLocalidad],
	[intIdContacto]
from [Direccion]
where [intIdLocalidad] = @intIdLocalidad
GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdPais]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAllByIntIdPais]
(
	@intIdPais int
)

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varCalle],
	[varAltura],
	[varPiso],
	[varDepartmento],
	[intIdLocalidad],
	[intIdContacto]
from [Direccion]
where [intIdPais] = @intIdPais
GO
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdProvincia]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionSelectAllByIntIdProvincia]
(
	@intIdProvincia int
)

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varCalle],
	[varAltura],
	[varPiso],
	[varDepartmento],
	[intIdLocalidad],
	[intIdContacto]
from [Direccion]
where [intIdProvincia] = @intIdProvincia
GO
/****** Object:  StoredProcedure [dbo].[DireccionUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[DireccionUpdate]
(
	@intId int,
	@intIdPais int,
	@intIdProvincia int,
	@varCalle nvarchar(50),
	@varAltura int,
	@varPiso nvarchar(50),
	@varDepartmento nvarchar(50),
	@intIdLocalidad int,
	@intIdContacto int
)

as

 

update [Direccion]
set [intIdPais] = @intIdPais,
	[intIdProvincia] = @intIdProvincia,
	[varCalle] = @varCalle,
	[varAltura] = @varAltura,
	[varPiso] = @varPiso,
	[varDepartmento] = @varDepartmento,
	[intIdLocalidad] = @intIdLocalidad,
	[intIdContacto] = @intIdContacto
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[LocalidadDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LocalidadDelete]
(
	@intId int
)

as

 

delete from [Localidad]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[LocalidadDeleteAllByIntIdProvincia]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LocalidadDeleteAllByIntIdProvincia]
(
	@intIdProvincia int
)

as

 

delete from [Localidad]
where [intIdProvincia] = @intIdProvincia
GO
/****** Object:  StoredProcedure [dbo].[LocalidadInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LocalidadInsert]
(
	@intIdPais int,
	@intIdProvincia int,
	@varDescripcion nvarchar(50)
)

as

 

insert into [Localidad]
(
	[intIdPais],
	[intIdProvincia],
	[varDescripcion]
)
values
(
	@intIdPais,
	@intIdProvincia,
	@varDescripcion
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[LocalidadSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LocalidadSelect]
(
	@intId int
)

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varDescripcion]
from [Localidad]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[LocalidadSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LocalidadSelectAll]

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varDescripcion]
from [Localidad]
GO
/****** Object:  StoredProcedure [dbo].[LocalidadSelectAllByIntIdProvincia]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LocalidadSelectAllByIntIdProvincia]
(
	@intIdProvincia int
)

as

 

select [intId],
	[intIdPais],
	[intIdProvincia],
	[varDescripcion]
from [Localidad]
where [intIdProvincia] = @intIdProvincia
GO
/****** Object:  StoredProcedure [dbo].[LocalidadUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[LocalidadUpdate]
(
	@intId int,
	@intIdPais int,
	@intIdProvincia int,
	@varDescripcion nvarchar(50)
)

as

 

update [Localidad]
set [intIdPais] = @intIdPais,
	[intIdProvincia] = @intIdProvincia,
	[varDescripcion] = @varDescripcion
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[PaisDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PaisDelete]
(
	@intId int
)

as

 

delete from [Pais]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[PaisInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PaisInsert]
(
	@varDescripcion nvarchar(50)
)

as

 

insert into [Pais]
(
	[varDescripcion]
)
values
(
	@varDescripcion
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[PaisSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PaisSelect]
(
	@intId int
)

as

 

select [intId],
	[varDescripcion]
from [Pais]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[PaisSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PaisSelectAll]

as

 

select [intId],
	[varDescripcion]
from [Pais]
GO
/****** Object:  StoredProcedure [dbo].[PaisUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[PaisUpdate]
(
	@intId int,
	@varDescripcion nvarchar(50)
)

as

 

update [Pais]
set [varDescripcion] = @varDescripcion
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[ProvinciaDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaDelete]
(
	@intId int
)

as

 

delete from [Provincia]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[ProvinciaDeleteAllByIntIdPais]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaDeleteAllByIntIdPais]
(
	@intIdPais int
)

as

 

delete from [Provincia]
where [intIdPais] = @intIdPais
GO
/****** Object:  StoredProcedure [dbo].[ProvinciaInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaInsert]
(
	@intIdPais int,
	@varDescripcion nvarchar(50)
)

as

 

insert into [Provincia]
(
	[intIdPais],
	[varDescripcion]
)
values
(
	@intIdPais,
	@varDescripcion
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[ProvinciaSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaSelect]
(
	@intId int
)

as

 

select [intId],
	[intIdPais],
	[varDescripcion]
from [Provincia]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[ProvinciaSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaSelectAll]

as

 

select [intId],
	[intIdPais],
	[varDescripcion]
from [Provincia]
GO
/****** Object:  StoredProcedure [dbo].[ProvinciaSelectAllByIntIdPais]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaSelectAllByIntIdPais]
(
	@intIdPais int
)

as

 

select [intId],
	[intIdPais],
	[varDescripcion]
from [Provincia]
where [intIdPais] = @intIdPais
GO
/****** Object:  StoredProcedure [dbo].[ProvinciaUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[ProvinciaUpdate]
(
	@intId int,
	@intIdPais int,
	@varDescripcion nvarchar(50)
)

as

 

update [Provincia]
set [intIdPais] = @intIdPais,
	[varDescripcion] = @varDescripcion
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoDelete]
(
	@intId int
)

as

 

delete from [Telefono]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIntIdContacto]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoDeleteAllByIntIdContacto]
(
	@intIdContacto int
)

as

 

delete from [Telefono]
where [intIdContacto] = @intIdContacto
GO
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIntIdTipo]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoDeleteAllByIntIdTipo]
(
	@intIdTipo int
)

as

 

delete from [Telefono]
where [intIdTipo] = @intIdTipo
GO
/****** Object:  StoredProcedure [dbo].[TelefonoInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoInsert]
(
	@intIdTipo int,
	@varNumero nvarchar(50),
	@intIdContacto int
)

as

 

insert into [Telefono]
(
	[intIdTipo],
	[varNumero],
	[intIdContacto]
)
values
(
	@intIdTipo,
	@varNumero,
	@intIdContacto
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelect]
(
	@intId int
)

as

 

select [intId],
	[intIdTipo],
	[varNumero],
	[intIdContacto]
from [Telefono]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelectAll]

as

 

select [intId],
	[intIdTipo],
	[varNumero],
	[intIdContacto]
from [Telefono]
GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIntIdContacto]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelectAllByIntIdContacto]
(
	@intIdContacto int
)

as

 

select [intId],
	[intIdTipo],
	[varNumero],
	[intIdContacto]
from [Telefono]
where [intIdContacto] = @intIdContacto
GO
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIntIdTipo]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoSelectAllByIntIdTipo]
(
	@intIdTipo int
)

as

 

select [intId],
	[intIdTipo],
	[varNumero],
	[intIdContacto]
from [Telefono]
where [intIdTipo] = @intIdTipo
GO
/****** Object:  StoredProcedure [dbo].[TelefonoTipoDelete]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoTipoDelete]
(
	@intId int
)

as

 

delete from [TelefonoTipo]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[TelefonoTipoInsert]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoTipoInsert]
(
	@varDescripcion nvarchar(50)
)

as

 

insert into [TelefonoTipo]
(
	[varDescripcion]
)
values
(
	@varDescripcion
)

select scope_identity()
GO
/****** Object:  StoredProcedure [dbo].[TelefonoTipoSelect]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoTipoSelect]
(
	@intId int
)

as

 

select [intId],
	[varDescripcion]
from [TelefonoTipo]
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[TelefonoTipoSelectAll]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoTipoSelectAll]

as

 

select [intId],
	[varDescripcion]
from [TelefonoTipo]
GO
/****** Object:  StoredProcedure [dbo].[TelefonoTipoUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoTipoUpdate]
(
	@intId int,
	@varDescripcion nvarchar(50)
)

as

 

update [TelefonoTipo]
set [varDescripcion] = @varDescripcion
where [intId] = @intId
GO
/****** Object:  StoredProcedure [dbo].[TelefonoUpdate]    Script Date: 29/11/2023 22:01:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[TelefonoUpdate]
(
	@intId int,
	@intIdTipo int,
	@varNumero nvarchar(50),
	@intIdContacto int
)

as

 

update [Telefono]
set [intIdTipo] = @intIdTipo,
	[varNumero] = @varNumero,
	[intIdContacto] = @intIdContacto
where [intId] = @intId
GO
USE [master]
GO
ALTER DATABASE [Agenda] SET  READ_WRITE 
GO
