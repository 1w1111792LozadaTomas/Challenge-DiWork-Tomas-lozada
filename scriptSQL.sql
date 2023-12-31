USE [master]
GO
/****** Object:  Database [TALLER_MECANICO]    Script Date: 09/07/2023 8:12:02 PM ******/
CREATE DATABASE [TALLER_MECANICO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TALLER_MECANICO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TALLER_MECANICO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TALLER_MECANICO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TALLER_MECANICO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TALLER_MECANICO] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TALLER_MECANICO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TALLER_MECANICO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET ARITHABORT OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TALLER_MECANICO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TALLER_MECANICO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TALLER_MECANICO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TALLER_MECANICO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TALLER_MECANICO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TALLER_MECANICO] SET  MULTI_USER 
GO
ALTER DATABASE [TALLER_MECANICO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TALLER_MECANICO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TALLER_MECANICO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TALLER_MECANICO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TALLER_MECANICO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TALLER_MECANICO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TALLER_MECANICO] SET QUERY_STORE = ON
GO
ALTER DATABASE [TALLER_MECANICO] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TALLER_MECANICO]
GO
/****** Object:  Table [dbo].[Automoviles]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Automoviles](
	[IdAutomovil] [int] IDENTITY(1,1) NOT NULL,
	[Puertas] [int] NOT NULL,
	[Tipo] [int] NOT NULL,
	[IdVehiculo] [int] NOT NULL,
 CONSTRAINT [PK_Automoviles] PRIMARY KEY CLUSTERED 
(
	[IdAutomovil] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DesperfectoRepuesto]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DesperfectoRepuesto](
	[idDesperfecto] [int] NOT NULL,
	[idRepuesto] [int] NOT NULL,
	[idDesperfectoRepuesto] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DesperfectoRepuesto] PRIMARY KEY CLUSTERED 
(
	[idDesperfectoRepuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Desperfectos]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Desperfectos](
	[idDesperfecto] [int] IDENTITY(1,1) NOT NULL,
	[idPresupuesto] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[ManoDeObra] [decimal](18, 2) NOT NULL,
	[Tiempo] [int] NOT NULL,
 CONSTRAINT [PK_Desperfecto] PRIMARY KEY CLUSTERED 
(
	[idDesperfecto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Motocicletas]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Motocicletas](
	[IdMotocicleta] [int] IDENTITY(1,1) NOT NULL,
	[Cilindrada] [varchar](100) NOT NULL,
	[IdVehiculo] [int] NOT NULL,
 CONSTRAINT [PK_Motocicletas] PRIMARY KEY CLUSTERED 
(
	[IdMotocicleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Presupuestos]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presupuestos](
	[idPresupuesto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Apellido] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[IdVehiculo] [int] NOT NULL,
	[FechaBaja] [date] NULL,
 CONSTRAINT [PK_Presupuestos] PRIMARY KEY CLUSTERED 
(
	[idPresupuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Repuestos]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Repuestos](
	[idRepuesto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Precio] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Repuesto] PRIMARY KEY CLUSTERED 
(
	[idRepuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculos]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculos](
	[IdVehiculo] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[Patente] [varchar](100) NOT NULL,
	[Anio] [int] NOT NULL,
	[FechaBaja] [varchar](100) NULL,
 CONSTRAINT [PK_Vehiculos] PRIMARY KEY CLUSTERED 
(
	[IdVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Automoviles]  WITH CHECK ADD  CONSTRAINT [FK_Automoviles_Vehiculos] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculos] ([IdVehiculo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Automoviles] CHECK CONSTRAINT [FK_Automoviles_Vehiculos]
GO
ALTER TABLE [dbo].[DesperfectoRepuesto]  WITH CHECK ADD  CONSTRAINT [FK_DesperfectoRepuesto_Desperfecto] FOREIGN KEY([idDesperfecto])
REFERENCES [dbo].[Desperfectos] ([idDesperfecto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesperfectoRepuesto] CHECK CONSTRAINT [FK_DesperfectoRepuesto_Desperfecto]
GO
ALTER TABLE [dbo].[DesperfectoRepuesto]  WITH CHECK ADD  CONSTRAINT [FK_DesperfectoRepuesto_Repuesto] FOREIGN KEY([idRepuesto])
REFERENCES [dbo].[Repuestos] ([idRepuesto])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DesperfectoRepuesto] CHECK CONSTRAINT [FK_DesperfectoRepuesto_Repuesto]
GO
ALTER TABLE [dbo].[Desperfectos]  WITH CHECK ADD  CONSTRAINT [FK_Desperfecto_Presupuestos] FOREIGN KEY([idPresupuesto])
REFERENCES [dbo].[Presupuestos] ([idPresupuesto])
GO
ALTER TABLE [dbo].[Desperfectos] CHECK CONSTRAINT [FK_Desperfecto_Presupuestos]
GO
ALTER TABLE [dbo].[Motocicletas]  WITH CHECK ADD  CONSTRAINT [FK_Motocicletas_Vehiculos] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculos] ([IdVehiculo])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Motocicletas] CHECK CONSTRAINT [FK_Motocicletas_Vehiculos]
GO
ALTER TABLE [dbo].[Presupuestos]  WITH CHECK ADD  CONSTRAINT [FK_Presupuestos_Vehiculos] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Vehiculos] ([IdVehiculo])
GO
ALTER TABLE [dbo].[Presupuestos] CHECK CONSTRAINT [FK_Presupuestos_Vehiculos]
GO
/****** Object:  StoredProcedure [dbo].[MassiveCharge]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MassiveCharge]
AS
BEGIN
    DECLARE @Nombre VARCHAR(100);
    DECLARE @Precio DECIMAL(18, 6);
	DECLARE @Bandera INT;

	 CREATE TABLE #TMP_RESPUESTO (Nombre VARCHAR(100),
                                 Precio DECIMAL(18,6))

	  INSERT INTO #TMP_RESPUESTO VALUES ('B356963821', 17.61)
        INSERT INTO #TMP_RESPUESTO VALUES ('B881468337', 40.88)
        INSERT INTO #TMP_RESPUESTO VALUES ('B867719836', 87.76)
        INSERT INTO #TMP_RESPUESTO VALUES ('B397571688', 13.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B852883143', 47.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B461882670', 22.68)
        INSERT INTO #TMP_RESPUESTO VALUES ('B333520964', 82.28)
        INSERT INTO #TMP_RESPUESTO VALUES ('B388445039', 50.71)
        INSERT INTO #TMP_RESPUESTO VALUES ('B648201513', 21.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B436759416', 35.39)
        INSERT INTO #TMP_RESPUESTO VALUES ('B317533243', 22.84)
        INSERT INTO #TMP_RESPUESTO VALUES ('B666592414', 58.67)
        INSERT INTO #TMP_RESPUESTO VALUES ('B443568817', 53.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B316416378', 17.74)
        INSERT INTO #TMP_RESPUESTO VALUES ('B252543362', 16.98)
        INSERT INTO #TMP_RESPUESTO VALUES ('B453148609', 14.23)
        INSERT INTO #TMP_RESPUESTO VALUES ('B254958806', 41.19)
        INSERT INTO #TMP_RESPUESTO VALUES ('B356963821', 62.58)
        INSERT INTO #TMP_RESPUESTO VALUES ('B846487171', 92.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B397571688', 1.04)
        INSERT INTO #TMP_RESPUESTO VALUES ('B535169105', 90.14)
        INSERT INTO #TMP_RESPUESTO VALUES ('B628263302', 78.64)
        INSERT INTO #TMP_RESPUESTO VALUES ('B608816685', 93.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B660755442', 43.62)
        INSERT INTO #TMP_RESPUESTO VALUES ('B659053715', 90.59)
        INSERT INTO #TMP_RESPUESTO VALUES ('B556344166', 71.62)
        INSERT INTO #TMP_RESPUESTO VALUES ('B216140665', 93.15)
        INSERT INTO #TMP_RESPUESTO VALUES ('B843858581', 66.52)
        INSERT INTO #TMP_RESPUESTO VALUES ('B790077756', 8.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B916071768', 85.46)
        INSERT INTO #TMP_RESPUESTO VALUES ('B317533243', 7.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B343454513', 22.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B986574036', 65.10)
        INSERT INTO #TMP_RESPUESTO VALUES ('B662139869', 3.50)
        INSERT INTO #TMP_RESPUESTO VALUES ('B618792223', 6.87)
        INSERT INTO #TMP_RESPUESTO VALUES ('B578485476', 49.70)
        INSERT INTO #TMP_RESPUESTO VALUES ('B132813434', 32.58)
        INSERT INTO #TMP_RESPUESTO VALUES ('B776163235', 73.64)
        INSERT INTO #TMP_RESPUESTO VALUES ('B215908676', 92.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B871139440', 31.83)
        INSERT INTO #TMP_RESPUESTO VALUES ('B564893705', 18.91)
        INSERT INTO #TMP_RESPUESTO VALUES ('B634131771', 70.35)
        INSERT INTO #TMP_RESPUESTO VALUES ('B321187273', 91.96)
        INSERT INTO #TMP_RESPUESTO VALUES ('B444737823', 78.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B413525993', 9.93)
        INSERT INTO #TMP_RESPUESTO VALUES ('B229547877', 97.08)
        INSERT INTO #TMP_RESPUESTO VALUES ('B545788950', 11.84)
        INSERT INTO #TMP_RESPUESTO VALUES ('B658514562', 8.84)
        INSERT INTO #TMP_RESPUESTO VALUES ('B736313138', 78.47)
        INSERT INTO #TMP_RESPUESTO VALUES ('B840888802', 93.85)
        INSERT INTO #TMP_RESPUESTO VALUES ('B883572821', 21.57)
        INSERT INTO #TMP_RESPUESTO VALUES ('B493478663', 76.98)
        INSERT INTO #TMP_RESPUESTO VALUES ('B718838840', 7.41)
        INSERT INTO #TMP_RESPUESTO VALUES ('B183671709', 45.53)
        INSERT INTO #TMP_RESPUESTO VALUES ('B908384721', 14.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B566417680', 44.04)
        INSERT INTO #TMP_RESPUESTO VALUES ('B633833113', 33.28)
        INSERT INTO #TMP_RESPUESTO VALUES ('B829258206', 41.74)
        INSERT INTO #TMP_RESPUESTO VALUES ('B350041352', 85.13)
        INSERT INTO #TMP_RESPUESTO VALUES ('B548168477', 7.44)
        INSERT INTO #TMP_RESPUESTO VALUES ('B765657146', 89.79)
        INSERT INTO #TMP_RESPUESTO VALUES ('B830231322', 81.42)
        INSERT INTO #TMP_RESPUESTO VALUES ('B816385774', 9.30)
        INSERT INTO #TMP_RESPUESTO VALUES ('B857448796', 77.36)
        INSERT INTO #TMP_RESPUESTO VALUES ('B302875266', 54.89)
        INSERT INTO #TMP_RESPUESTO VALUES ('B790507487', 50.41)
        INSERT INTO #TMP_RESPUESTO VALUES ('B723629401', 65.36)
        INSERT INTO #TMP_RESPUESTO VALUES ('B595728629', 19.94)
        INSERT INTO #TMP_RESPUESTO VALUES ('B472436824', 65.69)
        INSERT INTO #TMP_RESPUESTO VALUES ('B235859870', 66.44)
        INSERT INTO #TMP_RESPUESTO VALUES ('B874178252', 42.38)
        INSERT INTO #TMP_RESPUESTO VALUES ('B777713850', 40.26)
        INSERT INTO #TMP_RESPUESTO VALUES ('B550221285', 8.72)
        INSERT INTO #TMP_RESPUESTO VALUES ('B816043247', 73.97)
        INSERT INTO #TMP_RESPUESTO VALUES ('B607313788', 15.95)
        INSERT INTO #TMP_RESPUESTO VALUES ('B396482694', 45.17)
        INSERT INTO #TMP_RESPUESTO VALUES ('B504021331', 24.52)
        INSERT INTO #TMP_RESPUESTO VALUES ('B651475349', 86.77)
        INSERT INTO #TMP_RESPUESTO VALUES ('B470409863', 11.81)
        INSERT INTO #TMP_RESPUESTO VALUES ('B264135435', 62.58)
        INSERT INTO #TMP_RESPUESTO VALUES ('B755636151', 33.88)
        INSERT INTO #TMP_RESPUESTO VALUES ('B382183955', 0.92)
        INSERT INTO #TMP_RESPUESTO VALUES ('B667316286', 0.29)
        INSERT INTO #TMP_RESPUESTO VALUES ('B783117048', 41.57)
        INSERT INTO #TMP_RESPUESTO VALUES ('B812952354', 86.25)
        INSERT INTO #TMP_RESPUESTO VALUES ('B621838237', 80.54)
        INSERT INTO #TMP_RESPUESTO VALUES ('B665465223', 53.69)
        INSERT INTO #TMP_RESPUESTO VALUES ('B881682635', 64.78)
        INSERT INTO #TMP_RESPUESTO VALUES ('B646289861', 72.01)
        INSERT INTO #TMP_RESPUESTO VALUES ('B852115667', 48.73)
        INSERT INTO #TMP_RESPUESTO VALUES ('B144635415', 34.23)
        INSERT INTO #TMP_RESPUESTO VALUES ('B874863828', 24.70)
        INSERT INTO #TMP_RESPUESTO VALUES ('B333841476', 41.57)
        INSERT INTO #TMP_RESPUESTO VALUES ('B587386017', 45.27)
        INSERT INTO #TMP_RESPUESTO VALUES ('B874270576', 42.38)
        INSERT INTO #TMP_RESPUESTO VALUES ('B300733136', 25.55)
        INSERT INTO #TMP_RESPUESTO VALUES ('B611446656', 60.12)
        INSERT INTO #TMP_RESPUESTO VALUES ('B801300387', 61.04)
        INSERT INTO #TMP_RESPUESTO VALUES ('B845153562', 60.09)
        INSERT INTO #TMP_RESPUESTO VALUES ('B943846621', 37.05)

    DECLARE cursorRepuestos CURSOR FOR
    SELECT Nombre, Precio
    FROM #TMP_RESPUESTO;

    OPEN cursorRepuestos;

    FETCH NEXT FROM cursorRepuestos INTO @Nombre, @Precio;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @Bandera = 0;
        IF @Precio < 20
        BEGIN
            SELECT @Bandera = COUNT(idRepuesto) FROM Repuestos WHERE Nombre = @Nombre;
            IF @Bandera = 0
            BEGIN
                INSERT INTO Repuestos (Nombre, Precio)
                VALUES (@Nombre, @Precio);
            END;
            ELSE
            BEGIN
                UPDATE Repuestos
                SET Precio += @Precio
                WHERE Nombre = @Nombre;
            END;
        END;

        FETCH NEXT FROM cursorRepuestos INTO @Nombre, @Precio;
    END;

    CLOSE cursorRepuestos;
    DEALLOCATE cursorRepuestos;

    SELECT Nombre, Precio
    FROM #TMP_RESPUESTO
    WHERE Nombre NOT IN (SELECT Nombre FROM Repuestos);
END;
GO
/****** Object:  StoredProcedure [dbo].[PRC_AGREGAR_AUTOMOVIL]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_AGREGAR_AUTOMOVIL]
    @Marca varchar(100),
    @Modelo varchar(100),
    @Anio int,
	@Patente varchar(100),
    @Puertas int,
	@Tipo varchar(100),
    @p_msg NVARCHAR(100) OUTPUT
AS
DECLARE @v_IdVehiculo int;
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
		        INSERT INTO Vehiculos(Marca, Modelo, Anio,Patente)
        VALUES (@Marca, @Modelo,@Anio, @Patente);
		SELECT @v_IdVehiculo = MAX(IdVehiculo) FROM Vehiculos;
        INSERT INTO Automoviles (Puertas,Tipo,IdVehiculo)
        VALUES ( @Puertas, @Tipo, @v_IdVehiculo);

        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_AGREGAR_DESPERFECTO]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_AGREGAR_DESPERFECTO]
    @IdPresupuesto int,
    @Descripcion varchar(100),
    @ManoDeObra decimal(18, 2),
    @Tiempo float,
	@Repuestos VARCHAR(MAX) = '',
    @p_msg NVARCHAR(100) OUTPUT
AS
DECLARE @v_IdDesperfecto int;
DECLARE @v_MontoSuma float; --MONTO TOTAL PRESUPUESTO
DECLARE @v_SumaPrecioRepuestos float; --SUMA DE TODOS LOS PRECIOS DE LOS REPUESTOS
DECLARE @v_SumaDias int; --CANTIDAD DE DIAS PARA TRABAJAR
DECLARE @v_MontoSumaDias float; --MONTO A COBRAR POR TODOS LOS DIAS
DECLARE @v_MontoManoObra float; --MONTO MANO DE OBRA A COBRAR
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
		--SE INSERTA EL DESPERFECTO
        INSERT INTO Desperfectos (IdPresupuesto, Descripcion, ManoDeObra, Tiempo)
        VALUES (@IdPresupuesto, @Descripcion, @ManoDeObra, @Tiempo);

		IF @Repuestos != '' --SOLO SE EJECUTA SI HAY REPUESTOS QUE AGREGAR
		BEGIN
		SELECT @v_IdDesperfecto = MAX(IdDesperfecto) from Desperfectos;
		--ACA SE INSERTAN LOS REPUESTOS EN LA TABLA DESPERFECTO REPUESTO, UNO POR CADA REGISTRO DE LA TABLA REPUESTOSTABLE
		 DECLARE @RepuestosTable TABLE (
            Repuesto VARCHAR(100)
        );

        INSERT INTO @RepuestosTable (Repuesto)
        SELECT value FROM STRING_SPLIT(@Repuestos, ',');

        DECLARE @Repuesto VARCHAR(100);

        DECLARE repuestos_cursor CURSOR FOR
        SELECT Repuesto FROM @RepuestosTable;

        OPEN repuestos_cursor;

        FETCH NEXT FROM repuestos_cursor INTO @Repuesto;

        WHILE @@FETCH_STATUS = 0
        BEGIN
		INSERT INTO DesperfectoRepuesto(idDesperfecto,idRepuesto) values(@v_IdDesperfecto,@Repuesto);
            FETCH NEXT FROM repuestos_cursor INTO @Repuesto;
        END;

        CLOSE repuestos_cursor;
        DEALLOCATE repuestos_cursor;

		--ACA SE ACTUALIZA EL TOTAL DEL PRESUPUESTO AL QUE SE AGREGA EL DESPERFECTO

		--PRIMERO CALCULAMOS LA SUMA DE LOS PRECIOS DE LOS REPUESTOS 
		SELECT @v_SumaPrecioRepuestos = ISNULL(SUM(Precio),0) from Repuestos R JOIN DesperfectoRepuesto dr on dr.idRepuesto = r.idRepuesto 
		 JOIN Desperfectos d on d.idDesperfecto = dr.idDesperfecto WHERE d.idPresupuesto = @IdPresupuesto;
	END;

		 --CALCULAMOS LA SUMA TODOS LOS DIAS DE LOS DESPERFECTOS
		 SELECT @v_SumaDias= ISNULL(SUM(Tiempo),0) FROM Desperfectos WHERE idPresupuesto = @IdPresupuesto;
		--CALCULAMOS EL MONTO POR LOS DIAS TRABAJADOS
		SELECT @v_MontoSumaDias = (@v_SumaDias * 130) FROM Desperfectos where idPresupuesto = @IdPresupuesto;
		--CALCULAMOS EL MONTO DE MANO DE OBRA
		SELECT  @v_MontoManoObra = ISNULL(SUM(ManoDeObra),0) FROM Desperfectos where idPresupuesto = @IdPresupuesto;
		--SUMAMOS EL MONTO DE LA SUMA DE LOS DIAS, LOS REPUESTOS Y LA MANO DE OBRA DE TODOS LOS DESPERFECTOS y RECARGO DEL 10%
		IF @Repuestos != ''
		BEGIN
		SELECT @v_MontoSuma = (@v_MontoSumaDias + @v_SumaPrecioRepuestos + @v_MontoManoObra) * 1.10;
		END;
		ELSE
		BEGIN
		SELECT @v_MontoSuma = (@v_MontoSumaDias + @v_MontoManoObra) * 1.10;
		END;
		UPDATE Presupuestos set Total = (@v_MontoSuma)
		where idPresupuesto = @IdPresupuesto;
        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_AGREGAR_MOTOCICLETA]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_AGREGAR_MOTOCICLETA]
    @Marca varchar(100),
    @Modelo varchar(100),
    @Anio int,
	@Patente varchar(100),
    @Cilindrada varchar(100),
    @p_msg NVARCHAR(100) OUTPUT
AS
DECLARE @v_IdVehiculo int;
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        INSERT INTO Vehiculos (Marca, Modelo, Anio, Patente)
        VALUES (@Marca, @Modelo, @Anio, @Patente);
        SELECT @v_IdVehiculo = MAX(IdVehiculo) FROM Vehiculos;
        INSERT INTO Motocicletas (Cilindrada, IdVehiculo)
        VALUES (@Cilindrada, @v_IdVehiculo);

        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_AGREGAR_PRESUPUESTOS]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_AGREGAR_PRESUPUESTOS]
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @Total DECIMAL(10, 2),
    @IdVehiculo INT,
    @p_msg NVARCHAR(100) OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Presupuestos (Nombre, Apellido, Email, Total, IdVehiculo)
        VALUES (@Nombre, @Apellido, @Email, @Total, @IdVehiculo);

        SET @p_msg = '';
        
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[PRC_BAJA_AUTOMOVIL]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_BAJA_AUTOMOVIL]
    @IdAutomovil INT,
    @p_msg NVARCHAR(100) OUTPUT
AS
DECLARE @v_IdVehiculo int;
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
				SELECT @v_IdVehiculo = IdVehiculo FROM Automoviles WHERE IdAutomovil = @IdAutomovil;
        UPDATE Vehiculos
        SET
		FechaBaja = GETDATE()
        WHERE
            IdVehiculo = @v_IdVehiculo;

        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_BAJA_MOTOCICLETA]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_BAJA_MOTOCICLETA]
    @IdMotocicleta INT,
    @p_msg NVARCHAR(100) OUTPUT
AS
DECLARE @v_IdVehiculo INT;
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        SELECT @v_IdVehiculo = IdVehiculo FROM Motocicletas WHERE IdMotocicleta = @IdMotocicleta;
        
        UPDATE Vehiculos
        SET
            FechaBaja = GETDATE()
        WHERE
            IdVehiculo = @v_IdVehiculo;

        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_BAJA_PRESUPUESTOS]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_BAJA_PRESUPUESTOS]
    @IdPresupuesto INT,
    @p_msg NVARCHAR(100) OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        
        UPDATE [dbo].[Presupuestos]
        SET [FechaBaja] = GETDATE()
        WHERE [IdPresupuesto] = @IdPresupuesto;

        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_DESPERFECTO_DETALLE]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_DESPERFECTO_DETALLE]
    @idDesperfecto INT
AS
BEGIN
    SELECT p.idPresupuesto,R.Nombre,R.Precio,(R.Precio * Count(r.idRepuesto)) as Subtotal ,Count(r.idRepuesto) as Cantidad
    FROM DesperfectoRepuesto d JOIN Repuestos r on r.idRepuesto = d.idRepuesto
	JOIN Desperfectos de on de.idDesperfecto = d.idDesperfecto
	JOIN Presupuestos p on p.idPresupuesto = de.idPresupuesto
    WHERE de.idDesperfecto = @idDesperfecto
	GROUP BY p.idPresupuesto, r.Nombre,Precio;
END;
GO
/****** Object:  StoredProcedure [dbo].[PRC_EDITAR_AUTOMOVIL]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_EDITAR_AUTOMOVIL]
    @IdAutomovil INT,
    @Marca VARCHAR(100),
    @Modelo VARCHAR(100),
    @Anio INT,
	@Patente varchar(100),
	@Tipo varchar(100),
    @Puertas INT,
    @p_msg NVARCHAR(100) OUTPUT
AS
DECLARE @v_IdVehiculo int;
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

		SELECT @v_IdVehiculo = IdVehiculo FROM Automoviles WHERE IdAutomovil = @IdAutomovil;
		UPDATE Vehiculos
		        SET
            Marca = @Marca,
            Modelo = @Modelo,
			Anio =	@Anio,
			Patente = @Patente
        WHERE
            IdVehiculo = @v_IdVehiculo;

        UPDATE Automoviles
        SET
			Tipo = @Tipo,
            Puertas = @Puertas
        WHERE
            IdAutomovil = @IdAutomovil;

        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_EDITAR_MOTOCICLETA]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_EDITAR_MOTOCICLETA]
    @IdMotocicleta INT,
	@Marca VARCHAR(100),
    @Modelo VARCHAR(100),
    @Anio INT,
	@Patente varchar(100),
    @Cilindrada VARCHAR(100),
    @p_msg NVARCHAR(100) OUTPUT
AS
DECLARE @v_IdVehiculo int;
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

		SELECT @v_IdVehiculo = IdVehiculo FROM Motocicletas WHERE IdMotocicleta = @IdMotocicleta;
		UPDATE Vehiculos
		        SET
            Marca = @Marca,
            Modelo = @Modelo,
			Anio =	@Anio,
			Patente = @Patente
        WHERE
            IdVehiculo = @v_IdVehiculo;

        UPDATE Motocicletas
        SET
            Cilindrada = @Cilindrada
        WHERE
            IdMotocicleta = @IdMotocicleta;

        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_EDITAR_PRESUPUESTOS]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_EDITAR_PRESUPUESTOS]
    @IdPresupuesto INT,
    @Nombre VARCHAR(100),
    @Apellido VARCHAR(100),
    @Email VARCHAR(100),
    @Total DECIMAL(10, 2),
    @IdVehiculo INT,
    @p_msg NVARCHAR(100) OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        UPDATE Presupuestos
        SET Nombre = @Nombre,
            Apellido = @Apellido,
            Email = @Email,
            Total = @Total,
            IdVehiculo = @IdVehiculo
        WHERE IdPresupuesto = @IdPresupuesto;

        SET @p_msg = '';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[PRC_ELIMINAR_DESPERFECTO]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_ELIMINAR_DESPERFECTO]
    @IdDesperfecto int,
    @p_msg NVARCHAR(100) OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;
        DELETE FROM Desperfectos
        WHERE IdDesperfecto = @IdDesperfecto;
        COMMIT TRANSACTION;
        SET @p_msg = '';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        SET @p_msg = ERROR_MESSAGE();
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_LISTAR_DESPERFECTO]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_LISTAR_DESPERFECTO]
@idPresupuesto int
AS
BEGIN
        SELECT
            IdDesperfecto,
            IdPresupuesto,
            Descripcion,
            ManoDeObra,
            Tiempo
        FROM
            Desperfectos
			WHERE idPresupuesto = @idPresupuesto;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_LISTAR_PRESUPUESTOS]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_LISTAR_PRESUPUESTOS]
AS
BEGIN
    SELECT IdPresupuesto, Nombre, Apellido, Email, Total, IdVehiculo,CONVERT(varchar, FechaBaja, 103) as FechaBaja
    FROM Presupuestos;
END;
GO
/****** Object:  StoredProcedure [dbo].[PRC_LISTAR_REPUESTOS]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_LISTAR_REPUESTOS]
AS
BEGIN
    SELECT * FROM Repuestos;
END

GO
/****** Object:  StoredProcedure [dbo].[PRC_OBTENER_AUTOMOVIL]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_OBTENER_AUTOMOVIL]
    @IdAutomovil INT
AS
BEGIN
   SELECT  IdAutomovil, v.Marca, Modelo, v.Anio,v.Patente,Tipo, Puertas,CONVERT(varchar, V.FechaBaja, 103) as FechaBaja FROM Automoviles a JOIN Vehiculos v on v.IdVehiculo = a.IdVehiculo
    WHERE IdAutomovil = @IdAutomovil;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_OBTENER_DESPERFECTO]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_OBTENER_DESPERFECTO]
    @IdDesperfecto int
AS
BEGIN
        SELECT
            IdDesperfecto,
            IdPresupuesto,
            Descripcion,
            ManoDeObra,
            Tiempo
        FROM
            Desperfectos
        WHERE
            IdDesperfecto = @IdDesperfecto;

END
GO
/****** Object:  StoredProcedure [dbo].[PRC_OBTENER_MOTOCICLETA]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_OBTENER_MOTOCICLETA]
    @IdMotocicleta INT
AS
BEGIN
    SELECT  IdMotocicleta, m.Cilindrada, v.Marca, Modelo, v.Anio, v.Patente, CONVERT(varchar, v.FechaBaja, 103) AS FechaBaja
    FROM Motocicletas m
    JOIN Vehiculos v ON v.IdVehiculo = m.IdVehiculo
    WHERE IdMotocicleta = @IdMotocicleta;
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_OBTENER_PRESUPUESTOS]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRC_OBTENER_PRESUPUESTOS]
    @IdPresupuesto INT
AS
BEGIN
    SELECT IdPresupuesto, Nombre, Apellido, Email, Total, IdVehiculo,CONVERT(varchar, FechaBaja, 103) as FechaBaja
    FROM Presupuestos
    WHERE IdPresupuesto = @IdPresupuesto;
END;
GO
/****** Object:  StoredProcedure [dbo].[PRC_TRAE_COMBO_VEHICULO_PRESUPUESTO]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_TRAE_COMBO_VEHICULO_PRESUPUESTO]
AS
BEGIN

	    SELECT V.IdVehiculo,V.Modelo,V.Marca,V.Anio,Patente
    FROM Vehiculos V
	WHERE IdVehiculo NOT IN (
	SELECT IdVehiculo from Presupuestos PR WHERE PR.FechaBaja IS NULL
	)
	AND V.FechaBaja IS NULL
END
GO
/****** Object:  StoredProcedure [dbo].[PRC_TRAE_COMBO_VEHICULO_PRESUPUESTO_EDITAR]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PRC_TRAE_COMBO_VEHICULO_PRESUPUESTO_EDITAR]
AS
BEGIN
    SELECT V.IdVehiculo,V.Modelo,V.Marca,V.Anio,Patente
    FROM Vehiculos V;
END
GO
/****** Object:  StoredProcedure [dbo].[PROC_LISTAR_AUTOMOVIL]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PROC_LISTAR_AUTOMOVIL]
AS
BEGIN
    SELECT  IdAutomovil, v.Marca, Modelo, v.Anio,v.Patente,Tipo, Puertas,CONVERT(varchar, V.FechaBaja, 103) as FechaBaja FROM Automoviles a JOIN Vehiculos v on v.IdVehiculo = a.IdVehiculo;
END;
GO
/****** Object:  StoredProcedure [dbo].[PROC_LISTAR_MOTOCICLETA]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PROC_LISTAR_MOTOCICLETA]
AS
BEGIN
    SELECT m.IdMotocicleta, v.Marca, v.Modelo, v.Anio, v.Patente, m.Cilindrada, CONVERT(varchar, v.FechaBaja, 103) AS FechaBaja
    FROM Motocicletas m
    JOIN Vehiculos v ON v.IdVehiculo = m.IdVehiculo;
END;
GO
/****** Object:  StoredProcedure [dbo].[RPT_1]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RPT_1]
AS
BEGIN
    SELECT Marca, Nombre, Precio, Cantidad
    FROM (
        SELECT V.Marca, R.Nombre, R.Precio, COUNT(R.idRepuesto) AS Cantidad,
               ROW_NUMBER() OVER (PARTITION BY V.Marca ORDER BY COUNT(R.idRepuesto) DESC) AS RN
        FROM Repuestos R
        JOIN DesperfectoRepuesto DR ON DR.idRepuesto = R.idRepuesto
        JOIN Desperfectos D ON DR.idDesperfecto = D.idDesperfecto
        JOIN Presupuestos P ON P.idPresupuesto = D.idPresupuesto
        JOIN Vehiculos V ON V.IdVehiculo = P.IdVehiculo
        WHERE P.FechaBaja IS NULL
        GROUP BY V.Marca, R.Nombre, R.Precio
    ) AS V
    WHERE RN = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[RPT_2]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RPT_2]
AS
BEGIN
    SELECT V.Marca, AVG(P.Total) AS Promedio
    FROM Presupuestos P
    JOIN Vehiculos V ON V.IdVehiculo = P.IdVehiculo
    WHERE P.FechaBaja IS NULL
    GROUP BY V.Marca;
END;
GO
/****** Object:  StoredProcedure [dbo].[RPT_3]    Script Date: 09/07/2023 8:12:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RPT_3]
AS
BEGIN
    SELECT 'Automoviles' AS Tipo, ISNULL(SUM(Total),0) AS SumatoriaPresupuesto
    FROM Presupuestos P
    JOIN Vehiculos V ON V.IdVehiculo = P.IdVehiculo
    JOIN Automoviles A ON A.IdVehiculo = V.IdVehiculo
    WHERE P.FechaBaja IS NULL AND V.FechaBaja IS NULL
    UNION
    SELECT 'Motocicletas' AS Tipo, ISNULL(SUM(Total),0)
    FROM Presupuestos P
    JOIN Vehiculos V ON V.IdVehiculo = P.IdVehiculo
    JOIN Motocicletas M ON M.IdVehiculo = V.IdVehiculo
    WHERE P.FechaBaja IS NULL AND V.FechaBaja IS NULL;
END;
GO
USE [master]
GO
ALTER DATABASE [TALLER_MECANICO] SET  READ_WRITE 
GO
