CREATE DATABASE AlquilerSillas;
GO

USE AlquilerSillas;
GO

CREATE TABLE Sucursal (
    id_sucursal INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(200) NOT NULL
);

CREATE TABLE Puesto (
    id_puesto INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(50) NOT NULL
);

CREATE TABLE Jornada (
    id_jornada INT PRIMARY KEY IDENTITY,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

CREATE TABLE Empleado (
    id_empleado INT PRIMARY KEY IDENTITY,
    nombre_completo NVARCHAR(150) NOT NULL,
    correo NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(200) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_puesto INT NOT NULL,
    id_sucursal INT NOT NULL,
    id_jornada INT NOT NULL,
    FOREIGN KEY (id_puesto) REFERENCES Puesto(id_puesto),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal),
    FOREIGN KEY (id_jornada) REFERENCES Jornada(id_jornada)
);

CREATE TABLE Planilla (
    id_planilla INT PRIMARY KEY IDENTITY,
    id_empleado INT NOT NULL,
    fecha_pago DATE NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL,
    horas_extra INT,
    deducciones DECIMAL(10,2),
    bonificaciones DECIMAL(10,2),
    salario_neto DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Proveedor (
    id_proveedor INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(100) NOT NULL,
    contacto NVARCHAR(100),
    direccion NVARCHAR(200)
);

CREATE TABLE Producto (
    id_producto INT PRIMARY KEY IDENTITY,
    descripcion NVARCHAR(100) NOT NULL,
    precio_alquiler DECIMAL(10,2) NOT NULL,
    fecha_vencimiento DATE,
    existencia INT NOT NULL,
    id_proveedor INT,
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor)
);

CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY IDENTITY,
    id_producto INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    cantidad INT NOT NULL,
    costo_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(200),
    correo NVARCHAR(100),
    telefono NVARCHAR(20)
);

CREATE TABLE Venta (
    id_venta INT PRIMARY KEY IDENTITY,
    fecha DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_sucursal INT NOT NULL,
    tipo_pago NVARCHAR(20) NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    estado NVARCHAR(20),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
);

CREATE TABLE VentaDetalle (
    id_detalle INT PRIMARY KEY IDENTITY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE DefectoProductoCliente (
    id_defecto_cliente INT PRIMARY KEY IDENTITY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    monto_cobrado DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE DefectoProductoInventario (
    id_defecto INT PRIMARY KEY IDENTITY,
    id_producto INT NOT NULL,
    fecha DATE NOT NULL,
    descripcion NVARCHAR(200),
    monto_perdida DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Rol (
    id_rol INT PRIMARY KEY IDENTITY,
    nombre_rol NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(100)
);

CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY IDENTITY,
    usuario NVARCHAR(50) NOT NULL,
    clave NVARCHAR(100) NOT NULL,
    id_rol INT NOT NULL,
    id_empleado INT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Modulo (
    id_modulo INT PRIMARY KEY IDENTITY,
    nombre NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(100)
);

CREATE TABLE RolModulo (
    id_rol INT NOT NULL,
    id_modulo INT NOT NULL,
    permiso NVARCHAR(20) NOT NULL,
    PRIMARY KEY (id_rol, id_modulo),
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    FOREIGN KEY (id_modulo) REFERENCES Modulo(id_modulo)
);