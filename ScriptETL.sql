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
CREATE TABLE HechosAlquilerSillas (
    Codigo INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    id_categoria INT NOT NULL,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    id_estadoProducto INT NOT NULL,
    id_fecha INT NOT NULL,
    id_jornada INT NOT NULL,
    id_modulo INT NOT NULL,
    id_pago INT NOT NULL,
    id_producto INT NOT NULL,
    id_proveedor INT NOT NULL,
    id_rol INT NOT NULL,
    id_sucursal INT NOT NULL
);