USE [master]
GO
/****** Object:  Database [Agenda]    Script Date: 11/10/2023 12:30:37 PM ******/
CREATE DATABASE [Agenda]
GO
/****** Object:  Table [dbo].[Agenda]    Script Date: 11/10/2023 12:30:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agenda](
	[intId] [int] IDENTITY(1,1) NOT NULL,
	[varDescripcion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Agenda] PRIMARY KEY CLUSTERED 
(
	[intId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacto]    Script Date: 11/10/2023 12:30:37 PM ******/
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
/****** Object:  Table [dbo].[Direccion]    Script Date: 11/10/2023 12:30:37 PM ******/
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
/****** Object:  Table [dbo].[Localidad]    Script Date: 11/10/2023 12:30:37 PM ******/
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
/****** Object:  Table [dbo].[Pais]    Script Date: 11/10/2023 12:30:37 PM ******/
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
/****** Object:  Table [dbo].[Provincia]    Script Date: 11/10/2023 12:30:37 PM ******/
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
/****** Object:  Table [dbo].[Telefono]    Script Date: 11/10/2023 12:30:37 PM ******/
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
/****** Object:  Table [dbo].[TelefonoTipo]    Script Date: 11/10/2023 12:30:37 PM ******/
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
GO
INSERT [dbo].[Agenda] ([intId], [varDescripcion]) VALUES (2, N'Agenda de Otero')
GO
INSERT [dbo].[Agenda] ([intId], [varDescripcion]) VALUES (3, N'Agenda Loca')
GO
SET IDENTITY_INSERT [dbo].[Agenda] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacto] ON 
GO
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (1, N'Diego', N'Alejandro', N'Otero', 2)
GO
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (2, N'Pipa', N'Martin', N'Cincinati', 2)
GO
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (3, N'Martin', N'Gerardo', N'Loustou', 3)
GO
INSERT [dbo].[Contacto] ([intId], [varNombre], [varSegundoNombre], [varApellido], [intIdAgenda]) VALUES (4, N'Juan', N'Diego', N'Garcia', 3)
GO
SET IDENTITY_INSERT [dbo].[Contacto] OFF
GO
SET IDENTITY_INSERT [dbo].[Localidad] ON 
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (142, 1, 30, N'Adolfo Gonzales Chaves')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (143, 1, 30, N'Balcarce')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (144, 1, 30, N'Baradero')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (145, 1, 30, N'Benito Juarez')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (146, 1, 30, N'Alberti')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (147, 1, 30, N'Arrecifes')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (148, 1, 30, N'Almirante Brown')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (149, 1, 30, N'Avellaneda')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (150, 1, 30, N'Ayacucho')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (151, 1, 30, N'Azul')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (152, 1, 30, N'Bahiaa Blanca')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (153, 1, 30, N'Berazategui')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (154, 1, 30, N'Berisso')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (155, 1, 30, N'Boli­var')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (156, 1, 30, N'Bragado')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (157, 1, 30, N'Adolfo Alsina')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (158, 1, 30, N'Brandsen')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (159, 1, 30, N'Campana')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (160, 1, 30, N'Cañuelas')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (161, 1, 30, N'Capitan Sarmiento')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (162, 1, 30, N'Carlos Casares')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (163, 1, 30, N'Carlos Tejedor')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (164, 1, 30, N'Carmen de Areco')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (165, 1, 30, N'Castelli')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (166, 1, 30, N'Colon')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (167, 1, 30, N'Coronel de Marina Leonardo Rosales')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (168, 1, 30, N'Coronel Dorrego')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (169, 1, 30, N'Coronel Pringles')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (170, 1, 30, N'Coronel Suarez')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (171, 1, 30, N'Chacabuco')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (172, 1, 30, N'Chascomus')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (173, 1, 30, N'Lezama')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (174, 1, 30, N'Chivilcoy')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (175, 1, 30, N'Daireaux')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (176, 1, 30, N'Dolores')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (177, 1, 30, N'Ensenada')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (178, 1, 30, N'Escobar')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (179, 1, 30, N'Esteban Echeverri­a')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (180, 1, 30, N'Exaltacion de la Cruz')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (181, 1, 30, N'Ezeiza')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (182, 1, 30, N'Florencio Varela')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (183, 1, 30, N'Florentino Ameghino')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (184, 1, 30, N'General Alvarado')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (185, 1, 30, N'General Alvear')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (186, 1, 30, N'General Arenales')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (187, 1, 30, N'General Belgrano')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (188, 1, 30, N'General Guido')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (189, 1, 30, N'General Juan Madariaga')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (190, 1, 30, N'General la Madrid')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (191, 1, 30, N'General las Heras')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (192, 1, 30, N'General Lavalle')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (193, 1, 30, N'General Paz')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (194, 1, 30, N'General Pinto')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (195, 1, 30, N'General Pueyrredon')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (196, 1, 30, N'General Rodriguez')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (197, 1, 30, N'General San Martin')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (198, 1, 30, N'General Viamonte')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (199, 1, 30, N'General Villegas')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (200, 1, 30, N'Guamini')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (201, 1, 30, N'Hipolito Yrigoyen')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (202, 1, 30, N'Hurlingham')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (203, 1, 30, N'Ituzaingo')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (204, 1, 30, N'Jose C. Paz')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (205, 1, 30, N'Junin')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (206, 1, 30, N'La Costa')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (207, 1, 30, N'La Matanza')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (208, 1, 30, N'LanÃºs')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (209, 1, 30, N'La Plata')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (210, 1, 30, N'Laprida')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (211, 1, 30, N'Las Flores')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (212, 1, 30, N'Leandro N. Alem')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (213, 1, 30, N'Lincoln')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (214, 1, 30, N'Lober­a')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (215, 1, 30, N'Lobos')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (216, 1, 30, N'Lomas de Zamora')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (217, 1, 30, N'Lujan')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (218, 1, 30, N'Magdalena')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (219, 1, 30, N'Maipu')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (220, 1, 30, N'Malvinas Argentinas')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (221, 1, 30, N'Mar Chiquita')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (222, 1, 30, N'Marcos Paz')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (223, 1, 30, N'Mercedes')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (224, 1, 30, N'Merlo')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (225, 1, 30, N'Monte')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (226, 1, 30, N'Monte Hermoso')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (227, 1, 30, N'Moreno')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (228, 1, 30, N'Mor0n')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (229, 1, 30, N'Navarro')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (230, 1, 30, N'Necochea')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (231, 1, 30, N'9 de Julio')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (232, 1, 30, N'Olavarria')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (233, 1, 30, N'Patagones')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (234, 1, 30, N'Pehuajo')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (235, 1, 30, N'Pellegrini')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (236, 1, 30, N'Pergamino')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (237, 1, 30, N'Pila')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (238, 1, 30, N'Pilar')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (239, 1, 30, N'Pinamar')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (240, 1, 30, N'Presidente Peron')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (241, 1, 30, N'Puan')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (242, 1, 30, N'Punta Indio')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (243, 1, 30, N'Quilmes')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (244, 1, 30, N'Ramallo')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (245, 1, 30, N'Rauch')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (246, 1, 30, N'Rivadavia')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (247, 1, 30, N'Rojas')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (248, 1, 30, N'Roque Perez')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (249, 1, 30, N'Saavedra')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (250, 1, 30, N'Saladillo')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (251, 1, 30, N'Salto')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (252, 1, 30, N'Salliquela')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (253, 1, 30, N'San Andres de Giles')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (254, 1, 30, N'San Antonio de Areco')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (255, 1, 30, N'San Cayetano')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (256, 1, 30, N'San Fernando')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (257, 1, 30, N'San Isidro')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (258, 1, 30, N'San Miguel')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (259, 1, 30, N'San NicolÃ¡s')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (260, 1, 30, N'San Pedro')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (261, 1, 30, N'San Vicente')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (262, 1, 30, N'Suipacha')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (263, 1, 30, N'Tandil')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (264, 1, 30, N'Tapalque')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (265, 1, 30, N'Tigre')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (266, 1, 30, N'Tordillo')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (267, 1, 30, N'Tornquist')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (268, 1, 30, N'Trenque Lauquen')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (269, 1, 30, N'Tres Arroyos')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (270, 1, 30, N'Tres de Febrero')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (271, 1, 30, N'Tres Lomas')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (272, 1, 30, N'25 de Mayo')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (273, 1, 30, N'Vicente Lopez')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (274, 1, 30, N'Villa Gesell')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (275, 1, 30, N'Villarino')
GO
INSERT [dbo].[Localidad] ([intId], [intIdPais], [intIdProvincia], [varDescripcion]) VALUES (276, 1, 30, N'Zarate')
GO
SET IDENTITY_INSERT [dbo].[Localidad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (1, N'Argentina')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (2, N'Paraguay')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (3, N'Venezuela')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (4, N'Bolivia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (5, N'Uruguay')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (6, N'Afganistán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (7, N'Islas Gland')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (8, N'Albania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (9, N'Alemania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (10, N'Andorra')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (11, N'Angola')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (12, N'Anguilla')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (13, N'Antártida')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (14, N'Antigua y Barbuda')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (15, N'Antillas Holandesas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (16, N'Arabia Saudí')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (17, N'Argelia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (18, N'Argentina')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (19, N'Armenia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (20, N'Aruba')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (21, N'Australia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (22, N'Austria')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (23, N'Azerbaiyán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (24, N'Bahamas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (25, N'Bahréin')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (26, N'Bangladesh')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (27, N'Barbados')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (28, N'Bielorrusia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (29, N'Bélgica')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (30, N'Belice')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (31, N'Benin')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (32, N'Bermudas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (33, N'Bhután')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (34, N'Bolivia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (35, N'Bosnia y Herzegovina')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (36, N'Botsuana')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (37, N'Isla Bouvet')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (38, N'Brasil')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (39, N'Brunéi')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (40, N'Bulgaria')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (41, N'Burkina Faso')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (42, N'Burundi')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (43, N'Cabo Verde')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (44, N'Islas Caimán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (45, N'Camboya')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (46, N'Camerún')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (47, N'Canadá')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (48, N'República Centroafricana')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (49, N'Chad')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (50, N'República Checa')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (51, N'Chile')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (52, N'China')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (53, N'Chipre')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (54, N'Isla de Navidad')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (55, N'Ciudad del Vaticano')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (56, N'Islas Cocos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (57, N'Colombia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (58, N'Comoras')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (59, N'República Democrática del Congo')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (60, N'Congo')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (61, N'Islas Cook')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (62, N'Corea del Norte')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (63, N'Corea del Sur')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (64, N'Costa de Marfil')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (65, N'Costa Rica')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (66, N'Croacia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (67, N'Cuba')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (68, N'Dinamarca')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (69, N'Dominica')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (70, N'República Dominicana')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (71, N'Ecuador')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (72, N'Egipto')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (73, N'El Salvador')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (74, N'Emiratos Árabes Unidos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (75, N'Eritrea')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (76, N'Eslovaquia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (77, N'Eslovenia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (78, N'España')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (79, N'Islas ultramarinas de Estados Unidos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (80, N'Estados Unidos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (81, N'Estonia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (82, N'Etiopía')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (83, N'Islas Feroe')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (84, N'Filipinas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (85, N'Finlandia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (86, N'Fiyi')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (87, N'Francia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (88, N'Gabón')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (89, N'Gambia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (90, N'Georgia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (91, N'Islas Georgias del Sur y Sandwich del Sur')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (92, N'Ghana')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (93, N'Gibraltar')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (94, N'Granada')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (95, N'Grecia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (96, N'Groenlandia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (97, N'Guadalupe')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (98, N'Guam')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (99, N'Guatemala')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (100, N'Guayana Francesa')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (101, N'Guinea')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (102, N'Guinea Ecuatorial')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (103, N'Guinea-Bissau')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (104, N'Guyana')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (105, N'Haití')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (106, N'Islas Heard y McDonald')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (107, N'Honduras')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (108, N'Hong Kong')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (109, N'Hungría')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (110, N'India')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (111, N'Indonesia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (112, N'Irán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (113, N'Iraq')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (114, N'Irlanda')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (115, N'Islandia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (116, N'Israel')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (117, N'Italia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (118, N'Jamaica')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (119, N'Japón')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (120, N'Jordania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (121, N'Kazajstán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (122, N'Kenia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (123, N'Kirguistán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (124, N'Kiribati')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (125, N'Kuwait')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (126, N'Laos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (127, N'Lesotho')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (128, N'Letonia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (129, N'Líbano')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (130, N'Liberia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (131, N'Libia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (132, N'Liechtenstein')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (133, N'Lituania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (134, N'Luxemburgo')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (135, N'Macao')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (136, N'ARY Macedonia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (137, N'Madagascar')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (138, N'Malasia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (139, N'Malawi')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (140, N'Maldivas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (141, N'Malí')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (142, N'Malta')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (143, N'Islas Malvinas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (144, N'Islas Marianas del Norte')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (145, N'Marruecos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (146, N'Islas Marshall')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (147, N'Martinica')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (148, N'Mauricio')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (149, N'Mauritania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (150, N'Mayotte')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (151, N'México')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (152, N'Micronesia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (153, N'Moldavia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (154, N'Mónaco')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (155, N'Mongolia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (156, N'Montserrat')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (157, N'Mozambique')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (158, N'Myanmar')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (159, N'Namibia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (160, N'Nauru')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (161, N'Nepal')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (162, N'Nicaragua')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (163, N'Níger')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (164, N'Nigeria')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (165, N'Niue')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (166, N'Isla Norfolk')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (167, N'Noruega')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (168, N'Nueva Caledonia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (169, N'Nueva Zelanda')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (170, N'Omán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (171, N'Países Bajos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (172, N'Pakistán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (173, N'Palau')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (174, N'Palestina')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (175, N'Panamá')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (176, N'Papúa Nueva Guinea')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (177, N'Paraguay')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (178, N'Perú')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (179, N'Islas Pitcairn')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (180, N'Polinesia Francesa')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (181, N'Polonia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (182, N'Portugal')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (183, N'Puerto Rico')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (184, N'Qatar')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (185, N'Reino Unido')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (186, N'Reunión')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (187, N'Ruanda')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (188, N'Rumania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (189, N'Rusia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (190, N'Sahara Occidental')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (191, N'Islas Salomón')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (192, N'Samoa')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (193, N'Samoa Americana')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (194, N'San Cristóbal y Nevis')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (195, N'San Marino')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (196, N'San Pedro y Miquelón')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (197, N'San Vicente y las Granadinas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (198, N'Santa Helena')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (199, N'Santa Lucía')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (200, N'Santo Tomé y Príncipe')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (201, N'Senegal')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (202, N'Serbia y Montenegro')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (203, N'Seychelles')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (204, N'Sierra Leona')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (205, N'Singapur')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (206, N'Siria')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (207, N'Somalia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (208, N'Sri Lanka')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (209, N'Suazilandia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (210, N'Sudáfrica')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (211, N'Sudán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (212, N'Suecia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (213, N'Suiza')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (214, N'Surinam')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (215, N'Svalbard y Jan Mayen')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (216, N'Tailandia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (217, N'Taiwán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (218, N'Tanzania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (219, N'Tayikistán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (220, N'Territorio Británico del Océano Índico')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (221, N'Territorios Australes Franceses')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (222, N'Timor Oriental')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (223, N'Togo')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (224, N'Tokelau')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (225, N'Tonga')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (226, N'Trinidad y Tobago')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (227, N'Túnez')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (228, N'Islas Turcas y Caicos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (229, N'Turkmenistán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (230, N'Turquía')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (231, N'Tuvalu')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (232, N'Ucrania')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (233, N'Uganda')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (234, N'Uruguay')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (235, N'Uzbekistán')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (236, N'Vanuatu')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (237, N'Venezuela')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (238, N'Vietnam')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (239, N'Islas Vírgenes Británicas')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (240, N'Islas Vírgenes de los Estados Unidos')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (241, N'Wallis y Futuna')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (242, N'Yemen')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (243, N'Yibuti')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (244, N'Zambia')
GO
INSERT [dbo].[Pais] ([intId], [varDescripcion]) VALUES (245, N'Zimbabue')
GO
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (30, 1, N'BUENOS AIRES')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (31, 1, N'CATAMARCA')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (32, 1, N'CHACO')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (33, 1, N'CHUBUT')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (34, 1, N'CORDOBA')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (35, 1, N'CORRIENTES')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (36, 1, N'ENTRE RIOS')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (37, 1, N'FORMOSA')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (38, 1, N'JUJUY')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (39, 1, N'LA PAMPA')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (40, 1, N'LA RIOJA')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (41, 1, N'MENDOZA')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (42, 1, N'MISIONES')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (43, 1, N'NEUQUEN')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (44, 1, N'RIO NEGRO')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (45, 1, N'SALTA')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (46, 1, N'SAN JUAN')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (47, 1, N'SAN LUIS')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (48, 1, N'SANTA CRUZ')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (49, 1, N'SANTA FE')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (50, 1, N'SANTIAGO DEL ESTERO')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (51, 1, N'TIERRA DEL FUEGO')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (52, 1, N'TUCUMAN')
GO
INSERT [dbo].[Provincia] ([intId], [intIdPais], [varDescripcion]) VALUES (53, 1, N'CABA')
GO
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[Telefono] ON 
GO
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (2, 1, N'+5491156898545', 1)
GO
INSERT [dbo].[Telefono] ([intId], [intIdTipo], [varNumero], [intIdContacto]) VALUES (3, 3, N'+541156585458', 1)
GO
SET IDENTITY_INSERT [dbo].[Telefono] OFF
GO
SET IDENTITY_INSERT [dbo].[TelefonoTipo] ON 
GO
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (1, N'Ninguno')
GO
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (2, N'Particular')
GO
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (3, N'Laboral')
GO
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (4, N'Celular')
GO
INSERT [dbo].[TelefonoTipo] ([intId], [varDescripcion]) VALUES (5, N'Familiar')
GO
SET IDENTITY_INSERT [dbo].[TelefonoTipo] OFF
GO
ALTER TABLE [dbo].[Contacto]  WITH CHECK ADD  CONSTRAINT [FK_Contacto_Agenda] FOREIGN KEY([intIdAgenda])
REFERENCES [dbo].[Agenda] ([intId])
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
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_Contacto]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [FK_Telefono_TelefonoTipo] FOREIGN KEY([intIdTipo])
REFERENCES [dbo].[TelefonoTipo] ([intId])
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [FK_Telefono_TelefonoTipo]
GO
/****** Object:  StoredProcedure [dbo].[AgendaDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgendaInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgendaSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgendaSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AgendaUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ContactoDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ContactoDeleteAllByIntIdAgenda]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ContactoInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ContactoSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ContactoSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ContactoSelectAllByIntIdAgenda]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ContactoUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdContacto]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdLocalidad]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdPais]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionDeleteAllByIntIdProvincia]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdContacto]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdLocalidad]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdPais]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionSelectAllByIntIdProvincia]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DireccionUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadDeleteAllByIntIdProvincia]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadSelectAllByIntIdProvincia]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[LocalidadUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PaisDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PaisInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PaisSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PaisSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[PaisUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaDeleteAllByIntIdPais]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaSelectAllByIntIdPais]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[ProvinciaUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIntIdContacto]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoDeleteAllByIntIdTipo]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIntIdContacto]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoSelectAllByIntIdTipo]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoTipoDelete]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoTipoInsert]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoTipoSelect]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoTipoSelectAll]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoTipoUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
/****** Object:  StoredProcedure [dbo].[TelefonoUpdate]    Script Date: 11/10/2023 12:30:38 PM ******/
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
