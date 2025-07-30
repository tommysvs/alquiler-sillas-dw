CREATE DATABASE DW_AlquilerSillas;
GO

USE DW_AlquilerSillas;
GO

CREATE TABLE DW_Categoria (
    id_categoria INT PRIMARY KEY NOT NULL,
    NombreCategoria NVARCHAR(255) NOT NULL,
    Descripcion NVARCHAR(255) NULL
);

CREATE TABLE DW_Clientes (
    id_cliente INT PRIMARY KEY NOT NULL,
    Nombre NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(200) NOT NULL,
    Correo NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(20) NOT NULL
);

CREATE TABLE DW_Empleados (
    id_empleado INT PRIMARY KEY NOT NULL,
    NombreCompleto NVARCHAR(150) NOT NULL,
    Correo NVARCHAR(100) NOT NULL,
    Direccion NVARCHAR(200) NOT NULL,
    PuestoNombre NVARCHAR(50) NOT NULL,
    Salario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE DW_EstadoProducto (
    id_estadoProducto INT PRIMARY KEY NOT NULL,
    DescripcionEstado NVARCHAR(200) NULL
);

CREATE TABLE DW_Fecha (
    id_fecha INT PRIMARY KEY NOT NULL,
    Mes INT NOT NULL,
    Anio INT NOT NULL
);

CREATE TABLE DW_Jornadas (
    id_jornada INT PRIMARY KEY NOT NULL,
    HoraInicio TIME(7) NOT NULL,
    HoraFin TIME(7) NOT NULL
);

CREATE TABLE DW_Modulos (
    id_modulo INT PRIMARY KEY NOT NULL,
    NombreModulo NVARCHAR(50) NOT NULL,
    DescripcionModulo NVARCHAR(100) NULL
);

CREATE TABLE DW_Pagos (
    id_pago INT PRIMARY KEY NOT NULL,
    TipoPago NVARCHAR(20) NOT NULL,
    MontoTotal DECIMAL(10, 2) NOT NULL,
    Estado NVARCHAR(20) NULL
);

CREATE TABLE DW_Productos (
    id_producto INT PRIMARY KEY NOT NULL,
    Descripcion NVARCHAR(100) NOT NULL,
    PrecioAlquiler DECIMAL(10, 2) NOT NULL,
    FechaVencimiento DATE NULL,
    Existencia INT NOT NULL
);

CREATE TABLE DW_Proveedores (
    id_proveedor INT PRIMARY KEY NOT NULL,
    NombreProveedor NVARCHAR(100) NOT NULL,
    DireccionProveedor NVARCHAR(200) NULL,
    ContactoProveedor NVARCHAR(100) NULL
);

CREATE TABLE DW_Roles (
    id_rol INT PRIMARY KEY NOT NULL,
    NombreRol NVARCHAR(50) NOT NULL,
    DescripcionRol NVARCHAR(100) NULL
);

CREATE TABLE DW_Sucursales (
    id_sucursal INT PRIMARY KEY NOT NULL,
    NombreSucursal NVARCHAR(100) NOT NULL,
    DireccionSucursal NVARCHAR(200) NOT NULL
);

CREATE TABLE HechosAlquilerSillas (
    Codigo INT PRIMARY KEY NOT NULL,
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