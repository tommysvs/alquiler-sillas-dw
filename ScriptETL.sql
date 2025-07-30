--Limpiar
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'HechosAlquilerSillas')
DROP TABLE [dbo].[HechosAlquilerSillas]
GO
TRUNCATE TABLE [dbo].[DW_Categoria]
GO
TRUNCATE TABLE [dbo].[DW_Clientes]
GO
TRUNCATE TABLE [dbo].[DW_Empleados]
GO
TRUNCATE TABLE [dbo].[DW_EstadoProducto]
GO
TRUNCATE TABLE [dbo].[DW_Fecha]
GO
TRUNCATE TABLE [dbo].[DW_Jornadas]
GO
TRUNCATE TABLE [dbo].[DW_Modulos]
GO
TRUNCATE TABLE [dbo].[DW_Pagos]
GO
TRUNCATE TABLE [dbo].[DW_Productos]
GO
TRUNCATE TABLE [dbo].[DW_Proveedores]
GO
TRUNCATE TABLE [dbo].[DW_Roles]
GO
TRUNCATE TABLE [dbo].[DW_Sucursales]

--Crear
CREATE TABLE [dbo].[HechosAlquilerSillas] (
	[Codigo] [int] PRIMARY KEY NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_empleado] [int] NOT NULL,
	[id_estadoProducto] [int] NOT NULL,
	[id_fecha] [int] NOT NULL,
	[id_jornada] [int] NOT NULL,
	[id_modulo] [int] NOT NULL,
	[id_pago] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[id_rol] [int] NOT NULL,
	[id_surcursal] [int] NOT NULL
)
