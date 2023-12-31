USE [master]
GO
/****** Object:  Database [SistemaCadenasAlimenticias]    Script Date: 16/11/2023 11:18:22 ******/
CREATE DATABASE [SistemaCadenasAlimenticias]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SistemaCadenasAlimenticias', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaCadenasAlimenticias.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SistemaCadenasAlimenticias_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SistemaCadenasAlimenticias_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SistemaCadenasAlimenticias].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SistemaCadenasAlimenticias]
GO
/****** Object:  Table [dbo].[Cadena]    Script Date: 16/11/2023 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cadena](
	[IdCadena] [int] IDENTITY(1,1) NOT NULL,
	[Razon_Social] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCadena] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 16/11/2023 11:18:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Direccion] [nvarchar](50) NULL,
	[Ciudad] [nvarchar](50) NULL,
	[IdCadena] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cadena] ON 

INSERT [dbo].[Cadena] ([IdCadena], [Razon_Social]) VALUES (1, N'Mc Donalds')
INSERT [dbo].[Cadena] ([IdCadena], [Razon_Social]) VALUES (2, N'Starbucks')
INSERT [dbo].[Cadena] ([IdCadena], [Razon_Social]) VALUES (3, N'Burger King')
INSERT [dbo].[Cadena] ([IdCadena], [Razon_Social]) VALUES (4, N'Subway')
SET IDENTITY_INSERT [dbo].[Cadena] OFF
GO
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (1, N'Rivadavia 1823', N'Moron', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (2, N'Las Bases', N'Haedo', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (3, N'Av. de Mayo', N'Ramos Mejia', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (4, N'Directorio', N'Caballito', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (5, N'Spora', N'San Justo', 3)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (6, N'San Martin', N'Hurlingham', 3)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (7, N'Brown', N'Moron', 4)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (8, N'Cuba', N'Villa Luzuriaga', 4)
INSERT [dbo].[Sucursal] ([IdSucursal], [Direccion], [Ciudad], [IdCadena]) VALUES (9, N'4556 Spora', N'San Justo', 3)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
GO
ALTER TABLE [dbo].[Sucursal]  WITH CHECK ADD FOREIGN KEY([IdCadena])
REFERENCES [dbo].[Cadena] ([IdCadena])
GO
USE [master]
GO
ALTER DATABASE [SistemaCadenasAlimenticias] SET  READ_WRITE 
GO
