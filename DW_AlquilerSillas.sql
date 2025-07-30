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
    NombreEstado NVARCHAR(50) NOT NULL,
    DescripcionEstado NVARCHAR(200) NULL
);

CREATE TABLE DW_Fecha (
    id_fecha INT PRIMARY KEY NOT NULL,
    Fecha DATE,
    Dia INT NOT NULL,
    Mes INT NOT NULL,
    Anio INT NOT NULL,
    NombreDia NVARCHAR(20) NOT NULL,
    NombreMes NVARCHAR(20) NOT NULL,
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
    id_pago INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
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
    id_sucursal INT NOT NULL,
    CONSTRAINT FK_HechosAlquilerSillas_Categoria FOREIGN KEY (id_categoria) REFERENCES DW_Categoria(id_categoria),
    CONSTRAINT FK_HechosAlquilerSillas_Cliente FOREIGN KEY (id_cliente) REFERENCES DW_Clientes(id_cliente),
    CONSTRAINT FK_HechosAlquilerSillas_Empleado FOREIGN KEY (id_empleado) REFERENCES DW_Empleados(id_empleado),
    CONSTRAINT FK_HechosAlquilerSillas_EstadoProducto FOREIGN KEY (id_estadoProducto) REFERENCES DW_EstadoProducto(id_estadoProducto),
    CONSTRAINT FK_HechosAlquilerSillas_Fecha FOREIGN KEY (id_fecha) REFERENCES DW_Fecha(id_fecha),
    CONSTRAINT FK_HechosAlquilerSillas_Jornada FOREIGN KEY (id_jornada) REFERENCES DW_Jornadas(id_jornada),
    CONSTRAINT FK_HechosAlquilerSillas_Modulo FOREIGN KEY (id_modulo) REFERENCES DW_Modulos(id_modulo),
    CONSTRAINT FK_HechosAlquilerSillas_Pago FOREIGN KEY (id_pago) REFERENCES DW_Pagos(id_pago),
    CONSTRAINT FK_HechosAlquilerSillas_Producto FOREIGN KEY (id_producto) REFERENCES DW_Productos(id_producto),
    CONSTRAINT FK_HechosAlquilerSillas_Proveedor FOREIGN KEY (id_proveedor) REFERENCES DW_Proveedores(id_proveedor),
    CONSTRAINT FK_HechosAlquilerSillas_Rol FOREIGN KEY (id_rol) REFERENCES DW_Roles(id_rol),
    CONSTRAINT FK_HechosAlquilerSillas_Sucursal FOREIGN KEY (id_sucursal) REFERENCES DW_Sucursales(id_sucursal)
);