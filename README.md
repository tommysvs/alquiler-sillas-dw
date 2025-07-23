# Data Warehouse Alquiler Sillas

Repositorio del proyecto de **Data Warehouse** orientado al análisis y gestión de alquiler de sillas y eventos.  
Incluye modelos de datos, procesos ETL y documentación para integración con herramientas de Business Intelligence como SQL Server Analysis Services (SSAS).

---

## Objetivo

Centralizar y estructurar los datos operativos para facilitar el análisis de ventas, alquileres, inventario, clientes, empleados, pagos y eventos.  
Permite construir reportes y análisis multidimensionales para la toma de decisiones.

---

## Modelo Estrella: Dimensiones y Tabla de Hechos

El Data Warehouse está diseñado bajo un **modelo estrella**, optimizado para la consulta y el análisis en BI y SSAS.  
Este modelo consta de **12 dimensiones** y una tabla de hechos principal.

### Dimensiones

1. **DIM_CLIENTE** – Información de clientes (nombre, tipo, contacto, ubicación, etc.)
2. **DIM_PRODUCTO** – Detalles de productos (modelo, categoría, estado, etc.)
3. **DIM_EMPLEADO** – Datos de empleados (nombre, puesto, área, estado, etc.)
4. **DIM_EVENTO** – Información de eventos (tipo, fecha, ubicación, descripción, etc.)
5. **DIM_FECHA** – Calendario para análisis temporal (día, mes, trimestre, año, etc.)
6. **DIM_PROVEEDOR** – Datos de proveedores (nombre, tipo, contacto, etc.)
7. **DIM_PAGO** – Formas y detalles de pago utilizados.
8. **DIM_ROL** – Tipos de roles y permisos en el sistema.
9. **DIM_MODULO** – Módulos funcionales del sistema y sus descripciones.
10. **DIM_CATEGORIA_PRODUCTO** – Clasificación de productos por categorías.
11. **DIM_ESTADO_PRODUCTO** – Estado actual de los productos (nuevo, usado, defectuoso, etc.)
12. **DIM_UBICACION** – Ubicación física de productos, clientes o eventos.

### Tabla de Hechos

**FACT_ALQUILER**  
Registra las transacciones y métricas cuantitativas del negocio.

- **Claves foráneas:**  
  - id_cliente  
  - id_producto  
  - id_empleado  
  - id_evento  
  - id_fecha  
  - id_proveedor  
  - id_pago  
  - id_rol  
  - id_modulo  
  - id_categoria_producto  
  - id_estado_producto  
  - id_ubicacion

- **Medidas:**  
  - cantidad_alquilada  
  - monto_total  
  - monto_cobrado_por_daño  
  - monto_perdida_producto  
  - descuento  
  - total_pagar

## ¿Por qué modelo estrella?

El modelo estrella fue seleccionado porque:

- **Simplicidad:** Las dimensiones desnormalizadas facilitan la consulta y el uso por parte de los analistas y herramientas de BI.
- **Rendimiento:** Las consultas son más rápidas al requerir menos joins.
- **Compatibilidad:** SSAS y otras herramientas de BI funcionan óptimamente con este diseño.
- **Flexibilidad:** Es sencillo agregar o modificar atributos en las dimensiones.
