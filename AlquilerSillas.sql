CREATE DATABASE AlquilerSillas;
GO

USE AlquilerSillas;
GO

CREATE TABLE Sucursal (
    id_sucursal INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(200) NOT NULL
);

CREATE TABLE Puesto (
    id_puesto INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL
);

CREATE TABLE Jornada (
    id_jornada INT IDENTITY(1,1) PRIMARY KEY,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

CREATE TABLE Empleado (
    id_empleado INT IDENTITY(1,1) PRIMARY KEY,
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
    id_planilla INT IDENTITY(1,1) PRIMARY KEY,
    id_empleado INT NOT NULL,
    fecha_pago DATE NOT NULL,
    salario_base DECIMAL(10,2) NOT NULL,
    horas_extra INT,
    deducciones DECIMAL(10,2),
    bonificaciones DECIMAL(10,2),
    salario_neto DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Categoria (
    id_categoria INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    descripcion NVARCHAR(200)
);

CREATE TABLE Proveedor (
    id_proveedor INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    contacto NVARCHAR(100),
    direccion NVARCHAR(200)
);

CREATE TABLE EstadoProducto (
    id_estado_producto INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(200)
);

CREATE TABLE Producto (
    id_producto INT IDENTITY(1,1) PRIMARY KEY,
    descripcion NVARCHAR(100) NOT NULL,
    precio_alquiler DECIMAL(10,2) NOT NULL,
    fecha_vencimiento DATE,
    existencia INT NOT NULL,
    id_categoria INT,
    id_proveedor INT,
    id_estado_producto INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria),
    FOREIGN KEY (id_proveedor) REFERENCES Proveedor(id_proveedor),
    FOREIGN KEY (id_estado_producto) REFERENCES EstadoProducto(id_estado_producto)
);

CREATE TABLE Inventario (
    id_inventario INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    cantidad INT NOT NULL,
    costo_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Cliente (
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    direccion NVARCHAR(200),
    correo NVARCHAR(100),
    telefono NVARCHAR(20)
);

CREATE TABLE Venta (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
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
    id_detalle INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE DefectoProductoCliente (
    id_defecto_cliente INT IDENTITY(1,1) PRIMARY KEY,
    id_venta INT NOT NULL,
    id_producto INT NOT NULL,
    monto_cobrado DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE DefectoProductoInventario (
    id_defecto INT IDENTITY(1,1) PRIMARY KEY,
    id_producto INT NOT NULL,
    fecha DATE NOT NULL,
    descripcion NVARCHAR(200),
    monto_perdida DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

CREATE TABLE Rol (
    id_rol INT IDENTITY(1,1) PRIMARY KEY,
    nombre_rol NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(100)
);

CREATE TABLE Usuario (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    usuario NVARCHAR(50) NOT NULL,
    clave NVARCHAR(100) NOT NULL,
    id_rol INT NOT NULL,
    id_empleado INT,
    FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Modulo (
    id_modulo INT IDENTITY(1,1) PRIMARY KEY,
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