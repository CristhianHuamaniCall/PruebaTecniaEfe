USE [master]
GO
/****** Object:  Database [Pt_GrupoEfe]    Script Date: 17/09/2023 6:22:12 ******/
CREATE DATABASE [Pt_GrupoEfe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Pt_GrupoEfe_dat', FILENAME = N'C:\PRUEBA_TECNICA\Pt_GrupoEfedat.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5%)
 LOG ON 
( NAME = N'Pt_GrupoEfe_log', FILENAME = N'C:\PRUEBA_TECNICA\Pt_GrupoEfelog.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 5120KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Pt_GrupoEfe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Pt_GrupoEfe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Pt_GrupoEfe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET ARITHABORT OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Pt_GrupoEfe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Pt_GrupoEfe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Pt_GrupoEfe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Pt_GrupoEfe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET RECOVERY FULL 
GO
ALTER DATABASE [Pt_GrupoEfe] SET  MULTI_USER 
GO
ALTER DATABASE [Pt_GrupoEfe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Pt_GrupoEfe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Pt_GrupoEfe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Pt_GrupoEfe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Pt_GrupoEfe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Pt_GrupoEfe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Pt_GrupoEfe', N'ON'
GO
ALTER DATABASE [Pt_GrupoEfe] SET QUERY_STORE = OFF
GO
USE [Pt_GrupoEfe]
GO
/****** Object:  User [ApiTest]    Script Date: 17/09/2023 6:22:13 ******/
CREATE USER [ApiTest] FOR LOGIN [ApiTest] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ApiTest]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[clienteID] [int] IDENTITY(1,1) NOT NULL,
	[dni] [nvarchar](8) NULL,
	[Nombres] [nvarchar](50) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[clienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detallePedido]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detallePedido](
	[detallePedidoID] [int] IDENTITY(1,1) NOT NULL,
	[pedidoID] [int] NULL,
	[productoID] [int] NULL,
	[cantidad] [int] NULL,
	[precioUnitario] [numeric](18, 2) NULL,
	[subTotal] [numeric](18, 2) NULL,
 CONSTRAINT [PK_detallePedido] PRIMARY KEY CLUSTERED 
(
	[detallePedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[pedidoID] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[usuarioID] [int] NULL,
	[clienteID] [int] NULL,
	[total] [numeric](18, 2) NULL,
 CONSTRAINT [PK_pedido] PRIMARY KEY CLUSTERED 
(
	[pedidoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[productoID] [int] IDENTITY(1,1) NOT NULL,
	[producto] [nvarchar](50) NULL,
	[stock] [int] NULL,
	[precioUnitarioCompra] [nchar](10) NULL,
	[precioUnitarioVenta] [nchar](10) NULL,
 CONSTRAINT [PK_producto] PRIMARY KEY CLUSTERED 
(
	[productoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[rolID] [int] IDENTITY(1,1) NOT NULL,
	[rol] [nvarchar](50) NULL,
	[abreviatura] [nvarchar](10) NULL,
 CONSTRAINT [PK_rol] PRIMARY KEY CLUSTERED 
(
	[rolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rolUsuario]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rolUsuario](
	[rolUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[rolID] [int] NOT NULL,
	[usuarioID] [int] NOT NULL,
 CONSTRAINT [PK_rolUsuario] PRIMARY KEY CLUSTERED 
(
	[rolUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[usuarioID] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([clienteID], [dni], [Nombres]) VALUES (1, N'15865848', N'Betsy')
INSERT [dbo].[cliente] ([clienteID], [dni], [Nombres]) VALUES (2, N'54875265', N'Carlos')
INSERT [dbo].[cliente] ([clienteID], [dni], [Nombres]) VALUES (3, N'25632158', N'Pepe')
INSERT [dbo].[cliente] ([clienteID], [dni], [Nombres]) VALUES (4, N'74851568', N'Jenny')
INSERT [dbo].[cliente] ([clienteID], [dni], [Nombres]) VALUES (5, N'65824563', N'Lourdes')
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[detallePedido] ON 

INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (1, 1, 1, 5, CAST(5.50 AS Numeric(18, 2)), CAST(27.50 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (2, 1, 2, 2, CAST(2.20 AS Numeric(18, 2)), CAST(4.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (3, 1, 3, 3, CAST(3.30 AS Numeric(18, 2)), CAST(9.90 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (4, 2, 4, 4, CAST(4.40 AS Numeric(18, 2)), CAST(17.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (5, 2, 5, 6, CAST(6.60 AS Numeric(18, 2)), CAST(39.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (6, 2, 6, 1, CAST(1.10 AS Numeric(18, 2)), CAST(1.10 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (7, 2, 7, 5, CAST(5.50 AS Numeric(18, 2)), CAST(27.50 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (8, 3, 8, 8, CAST(8.80 AS Numeric(18, 2)), CAST(70.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (9, 3, 9, 9, CAST(9.90 AS Numeric(18, 2)), CAST(89.10 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (10, 4, 10, 1, CAST(1.10 AS Numeric(18, 2)), CAST(1.10 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (11, 4, 11, 2, CAST(2.20 AS Numeric(18, 2)), CAST(4.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (12, 4, 12, 5, CAST(5.50 AS Numeric(18, 2)), CAST(27.50 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (13, 4, 13, 4, CAST(4.40 AS Numeric(18, 2)), CAST(17.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (14, 4, 14, 8, CAST(8.80 AS Numeric(18, 2)), CAST(70.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (15, 5, 15, 6, CAST(6.60 AS Numeric(18, 2)), CAST(39.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (16, 5, 16, 8, CAST(8.80 AS Numeric(18, 2)), CAST(70.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (17, 6, 17, 2, CAST(2.20 AS Numeric(18, 2)), CAST(4.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (18, 6, 18, 3, CAST(3.30 AS Numeric(18, 2)), CAST(9.90 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (19, 7, 20, 5, CAST(5.50 AS Numeric(18, 2)), CAST(27.50 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (20, 8, 21, 2, CAST(2.20 AS Numeric(18, 2)), CAST(4.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (21, 9, 22, 3, CAST(3.30 AS Numeric(18, 2)), CAST(9.90 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (22, 10, 23, 4, CAST(4.40 AS Numeric(18, 2)), CAST(17.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (23, 10, 24, 6, CAST(6.60 AS Numeric(18, 2)), CAST(39.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (24, 10, 25, 1, CAST(1.10 AS Numeric(18, 2)), CAST(1.10 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (25, 10, 26, 5, CAST(5.50 AS Numeric(18, 2)), CAST(27.50 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (26, 10, 27, 8, CAST(8.80 AS Numeric(18, 2)), CAST(70.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (27, 11, 28, 9, CAST(9.90 AS Numeric(18, 2)), CAST(89.10 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (28, 11, 29, 1, CAST(1.10 AS Numeric(18, 2)), CAST(1.10 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (29, 11, 30, 2, CAST(2.20 AS Numeric(18, 2)), CAST(4.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (30, 11, 31, 5, CAST(5.50 AS Numeric(18, 2)), CAST(27.50 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (31, 11, 32, 4, CAST(4.40 AS Numeric(18, 2)), CAST(17.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (32, 11, 33, 8, CAST(8.80 AS Numeric(18, 2)), CAST(70.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (33, 11, 34, 6, CAST(6.60 AS Numeric(18, 2)), CAST(39.60 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (34, 11, 35, 8, CAST(8.80 AS Numeric(18, 2)), CAST(70.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (35, 11, 36, 2, CAST(2.20 AS Numeric(18, 2)), CAST(4.40 AS Numeric(18, 2)))
INSERT [dbo].[detallePedido] ([detallePedidoID], [pedidoID], [productoID], [cantidad], [precioUnitario], [subTotal]) VALUES (36, 11, 37, 3, CAST(3.30 AS Numeric(18, 2)), CAST(9.90 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[detallePedido] OFF
GO
SET IDENTITY_INSERT [dbo].[pedido] ON 

INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (1, CAST(N'2023-09-16' AS Date), 2, 1, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (2, CAST(N'2023-09-15' AS Date), 2, 1, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (3, CAST(N'2023-09-15' AS Date), 2, 2, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (4, CAST(N'2023-09-15' AS Date), 2, 3, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (5, CAST(N'2023-09-15' AS Date), 2, 4, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (6, CAST(N'2023-09-15' AS Date), 2, 5, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (7, CAST(N'2023-09-16' AS Date), 2, 1, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (8, CAST(N'2023-09-16' AS Date), 2, 2, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (9, CAST(N'2023-09-16' AS Date), 2, 3, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (10, CAST(N'2023-09-16' AS Date), 2, 4, NULL)
INSERT [dbo].[pedido] ([pedidoID], [fecha], [usuarioID], [clienteID], [total]) VALUES (11, CAST(N'2023-09-16' AS Date), 2, 5, NULL)
SET IDENTITY_INSERT [dbo].[pedido] OFF
GO
SET IDENTITY_INSERT [dbo].[producto] ON 

INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (1, N'Netscape Navigator (1994)', 50, N'5,20      ', N'5,72      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (2, N' Apple II (1977)', 50, N'5,50      ', N'6,05      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (3, N' TiVo HDR110 (1999)', 50, N'5,90      ', N'6,49      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (4, N' Napster (1999)', 50, N'6,23      ', N'6,86      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (5, N' Lotus 1-2-3 for DOS (1983)', 50, N'6,58      ', N'7,24      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (6, N' Apple iPod (2001)', 50, N'6,93      ', N'7,63      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (7, N' Hayes Smartmodem (1981)', 50, N'7,28      ', N'8,01      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (8, N' Motorola StarTAC (1996)', 50, N'7,63      ', N'8,40      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (9, N' WordPerfect 5.1 (1989)', 50, N'7,98      ', N'8,78      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (10, N' Tetris (1985)', 50, N'8,33      ', N'9,17      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (11, N' Adobe Photoshop 3.0 (1994)', 50, N'8,68      ', N'9,55      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (12, N' IBM ThinkPad 700C (1992)', 50, N'9,03      ', N'9,94      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (13, N' Atari VCS/2600 (1977)', 50, N'9,38      ', N'10,32     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (14, N' Apple Macintosh Plus (1986)', 50, N'9,73      ', N'10,71     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (15, N' RIM BlackBerry 857 (2000)', 50, N'10,08     ', N'11,09     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (16, N' 3dfx Voodoo3 (1999)', 50, N'10,43     ', N'11,48     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (17, N' Canon Digital Elph S100 (2000)', 50, N'10,78     ', N'11,86     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (18, N' Palm Pilot 1000 (1996)', 50, N'5,20      ', N'5,72      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (19, N' id Software Doom (1993)', 50, N'5,50      ', N'6,05      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (20, N' Microsoft Windows 95 (1995)', 50, N'5,90      ', N'6,49      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (21, N' Apple iTunes 4 (2003)', 50, N'6,23      ', N'6,86      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (22, N' Nintendo Game Boy (1989)', 50, N'6,58      ', N'7,24      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (23, N' Iomega Zip Drive (1994)', 50, N'6,93      ', N'7,63      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (24, N' Spybot Search & Destroy (2000)', 50, N'7,28      ', N'8,01      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (25, N' Compaq Deskpro 386 (1986)', 50, N'7,63      ', N'8,40      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (26, N' CompuServe (1982)', 50, N'7,98      ', N'8,78      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (27, N' Blizzard World of Warcraft (2004)', 50, N'8,33      ', N'9,17      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (28, N' Aldus PageMaker (1985)', 50, N'8,68      ', N'9,55      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (29, N' HP LaserJet 4L (1993)', 50, N'9,03      ', N'9,94      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (30, N' Apple Mac OS X (2001)', 50, N'9,38      ', N'10,32     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (31, N' Nintendo Entertainment System (1985)', 50, N'9,73      ', N'10,71     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (32, N' Eudora (1988)', 50, N'10,08     ', N'11,09     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (33, N' Sony Handycam DCR-VX1000 (1995)', 50, N'10,43     ', N'11,48     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (34, N' Apple Airport Base Station (1999)', 50, N'10,78     ', N'11,86     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (35, N' Brøderbund The Print Shop (1984)', 50, N'5,20      ', N'5,72      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (36, N' McAfee VirusScan (1990)', 50, N'5,50      ', N'6,05      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (37, N' Commodore Amiga 1000 (1985)', 50, N'5,90      ', N'6,49      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (38, N' ChipSoft TurboTax (1985)', 50, N'6,23      ', N'6,86      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (39, N' Mirabilis ICQ (1996)', 50, N'6,58      ', N'7,24      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (40, N' Creative Labs Sound Blaster 16 (1992)', 50, N'6,93      ', N'7,63      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (41, N' Apple HyperCard (1987)', 50, N'7,28      ', N'8,01      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (42, N' Epson MX-80 (1980)', 50, N'7,63      ', N'8,40      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (43, N' Central Point Software PC Tools (1985)', 50, N'7,98      ', N'8,78      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (44, N' Canon EOS Digital Rebel (2003)', 50, N'8,33      ', N'9,17      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (45, N' Red Hat Linux (1994)', 50, N'8,68      ', N'9,55      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (46, N' Adaptec Easy CD Creator (1996)', 50, N'9,03      ', N'9,94      ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (47, N' PC-Talk (1982)', 50, N'9,38      ', N'10,32     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (48, N' Sony Mavica MVC-FD5 (1997)', 50, N'9,73      ', N'10,71     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (49, N' Microsoft Excel (1985)', 50, N'10,08     ', N'11,09     ')
INSERT [dbo].[producto] ([productoID], [producto], [stock], [precioUnitarioCompra], [precioUnitarioVenta]) VALUES (50, N' Northgate OmniKey Ultra (1987)', 50, N'10,43     ', N'11,48     ')
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[rol] ON 

INSERT [dbo].[rol] ([rolID], [rol], [abreviatura]) VALUES (1, N'Administrador', N'ADM')
INSERT [dbo].[rol] ([rolID], [rol], [abreviatura]) VALUES (2, N'Vendedor', N'VEN')
SET IDENTITY_INSERT [dbo].[rol] OFF
GO
SET IDENTITY_INSERT [dbo].[rolUsuario] ON 

INSERT [dbo].[rolUsuario] ([rolUsuarioID], [rolID], [usuarioID]) VALUES (1, 1, 1)
INSERT [dbo].[rolUsuario] ([rolUsuarioID], [rolID], [usuarioID]) VALUES (2, 2, 2)
INSERT [dbo].[rolUsuario] ([rolUsuarioID], [rolID], [usuarioID]) VALUES (3, 2, 3)
SET IDENTITY_INSERT [dbo].[rolUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([usuarioID], [usuario], [password]) VALUES (1, N'cristhian', N'1234')
INSERT [dbo].[usuario] ([usuarioID], [usuario], [password]) VALUES (2, N'jhonatan', N'1234')
INSERT [dbo].[usuario] ([usuarioID], [usuario], [password]) VALUES (3, N'areliz', N'1234')
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
ALTER TABLE [dbo].[detallePedido]  WITH CHECK ADD  CONSTRAINT [FK_detallePedido_pedido] FOREIGN KEY([pedidoID])
REFERENCES [dbo].[pedido] ([pedidoID])
GO
ALTER TABLE [dbo].[detallePedido] CHECK CONSTRAINT [FK_detallePedido_pedido]
GO
ALTER TABLE [dbo].[detallePedido]  WITH CHECK ADD  CONSTRAINT [FK_detallePedido_producto] FOREIGN KEY([productoID])
REFERENCES [dbo].[producto] ([productoID])
GO
ALTER TABLE [dbo].[detallePedido] CHECK CONSTRAINT [FK_detallePedido_producto]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [FK_pedido_cliente] FOREIGN KEY([clienteID])
REFERENCES [dbo].[cliente] ([clienteID])
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [FK_pedido_cliente]
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [FK_pedido_usuario] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[pedido] CHECK CONSTRAINT [FK_pedido_usuario]
GO
ALTER TABLE [dbo].[rolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_rolUsuario_rol] FOREIGN KEY([rolID])
REFERENCES [dbo].[rol] ([rolID])
GO
ALTER TABLE [dbo].[rolUsuario] CHECK CONSTRAINT [FK_rolUsuario_rol]
GO
ALTER TABLE [dbo].[rolUsuario]  WITH CHECK ADD  CONSTRAINT [FK_rolUsuario_usuario] FOREIGN KEY([usuarioID])
REFERENCES [dbo].[usuario] ([usuarioID])
GO
ALTER TABLE [dbo].[rolUsuario] CHECK CONSTRAINT [FK_rolUsuario_usuario]
GO
/****** Object:  StoredProcedure [dbo].[Qry_pedidoDetalle]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================
-- Procedimiento	 : Qry_pedidoDetalle
-- Autor			 : Cristhian Huamani
-- Fecha de creación : 16/09/2023
-- Descripción		 : Obtener Detalle de pedido
-- Parámetros		 :				
--	
-- =====================================================================================================================================================
-- Resumen de modificaciones:
--
--
-- =====================================================================================================================================================
-- EXEC Qry_pedidoDetalle 3
-- =====================================================================================================================================================
CREATE   PROCEDURE [dbo].[Qry_pedidoDetalle] 
   @pedidoID int
AS  
BEGIN  
	SELECT p.pedidoID,pr.productoID,pr.producto,dp.cantidad,dp.precioUnitario,dp.cantidad*dp.precioUnitario as SubTotal
	FROM pedido p
	INNER JOIN usuario u on u.usuarioID=p.usuarioID
	INNER JOIN cliente c on c.clienteID=p.clienteID
	INNER JOIN detallePedido dp on dp.pedidoID=p.pedidoID
	INNER JOIN producto pr on pr.productoID = dp.productoID
	WHERE p.pedidoID = @pedidoID 
END
GO
/****** Object:  StoredProcedure [dbo].[Qry_pedidoFiltro]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================
-- Procedimiento	 : Qry_pedidoFiltro
-- Autor			 : Cristhian Huamani
-- Fecha de creación : 16/09/2023
-- Descripción		 : Obtener Lista de pedidos
-- Parámetros		 :				
--	
-- =====================================================================================================================================================
-- Resumen de modificaciones:
--
--
-- =====================================================================================================================================================
-- EXEC Qry_pedidoFiltro '',''
-- =====================================================================================================================================================
CREATE   PROCEDURE [dbo].[Qry_pedidoFiltro]
	@pedidoID int,
	@dni nvarchar(8)
AS  
BEGIN  
	SELECT p.pedidoID,p.fecha,u.usuario as vendedor,c.dni,c.Nombres AS cliente
	FROM pedido p
	INNER JOIN usuario u on u.usuarioID=p.usuarioID
	INNER JOIN cliente c on c.clienteID=p.clienteID
	WHERE (p.pedidoId=@pedidoID or @pedidoID='') and (c.dni=@dni or @dni='')
END
GO
/****** Object:  StoredProcedure [dbo].[Qry_pedidoList]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================
-- Procedimiento	 : Qry_pedidoList
-- Autor			 : Cristhian Huamani
-- Fecha de creación : 16/09/2023
-- Descripción		 : Obtener Lista de pedidos
-- Parámetros		 :				
--	
-- =====================================================================================================================================================
-- Resumen de modificaciones:
--
--
-- =====================================================================================================================================================
-- EXEC Qry_pedidoList 
-- =====================================================================================================================================================
CREATE   PROCEDURE [dbo].[Qry_pedidoList]  
AS  
BEGIN  
	SELECT p.pedidoID,p.fecha,u.usuario as Vendedor,c.DNI,c.Nombres
	FROM pedido p
	INNER JOIN usuario u on u.usuarioID=p.usuarioID
	INNER JOIN cliente c on c.clienteID=p.clienteID
END
GO
/****** Object:  StoredProcedure [dbo].[Qry_validateLogin]    Script Date: 17/09/2023 6:22:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =====================================================================================================================================================
-- Procedimiento	 : Qry_validateLogin
-- Autor			 : Cristhian Huamani
-- Fecha de creación : 16/09/2023
-- Descripción		 : Obtener datos de login
-- Parámetros		 : @usuario: necesario, para filtrar por usuario
--					   @password: necesario, para validar password					
--	
-- =====================================================================================================================================================
-- Resumen de modificaciones:
--
--
-- =====================================================================================================================================================
-- EXEC Qry_validateLogin 'cristhian','1234'
-- =====================================================================================================================================================
CREATE   PROCEDURE [dbo].[Qry_validateLogin]  
   @usuario nvarchar(50),  
   @password nvarchar(50)  
AS  
BEGIN  
	SELECT u.usuarioID,u.usuario,r.rolID,r.rol,r.abreviatura
	FROM rol r
	INNER JOIN rolUsuario ru ON ru.rolID=r.rolID
	INNER JOIN usuario u ON u.usuarioID=ru.usuarioID
	WHERE u.usuario = @usuario and u.password = @password
END
GO
USE [master]
GO
ALTER DATABASE [Pt_GrupoEfe] SET  READ_WRITE 
GO
