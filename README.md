# SistemaLavadoCoches-DB

## Descripción General
SistemaLavadoCoches-DB es un sistema de gestión de base de datos completo diseñado específicamente para negocios de lavado de automóviles. Este repositorio contiene el esquema SQL completo y una colección de consultas predefinidas para ayudar a gestionar operaciones, realizar seguimiento del rendimiento y optimizar los procesos del negocio.

## Características
- Diseño completo de base de datos relacional adaptado para operaciones de lavado de coches
- Seguimiento de clientes, vehículos, servicios, empleados e inventario
- Colección completa de consultas para análisis de negocio y reportes
- Soporte para programación y seguimiento del rendimiento de empleados
- Gestión de inventario y seguimiento de consumo
- Flujo de trabajo de órdenes de servicio desde recepción hasta finalización

## Estructura de la Base de Datos
El sistema consta de las siguientes tablas principales:
- **Clientes**: Información de clientes y seguimiento de visitas
- **Vehículos**: Datos de vehículos vinculados a clientes
- **Servicios**: Servicios disponibles y precios
- **OrdenesServicio**: Registro de servicios realizados y su estado
- **Empleados**: Información del personal
- **Turnos**: Programación de horarios de empleados
- **Insumos**: Inventario de productos utilizados
- **ConsumoInsumos**: Seguimiento del uso de productos
- **Proveedores**: Gestión de proveedores de insumos
- **ComprasInsumos**: Registro de compras realizadas
- **ComentariosEmpleados**: Feedback sobre el desempeño de empleados
- **HistorialPrecios**: Seguimiento de cambios en los precios de servicios
- **MantenimientoEquipos**: Control de mantenimiento de equipos

## Diagrama Entidad-Relación

```
                          +------------+
                          |  Clientes  |
                          +------------+
                                |
                                |
                                v
+------------+            +------------+            +------------+
| Proveedores|<---------->|  Vehículos |<---------->| Servicios  |
+------------+            +------------+            +------------+
      |                         |                         |
      |                         |                         |
      v                         v                         v
+------------+            +------------------+     +----------------+
|  Insumos   |<---------->| OrdenesServicio  |<--->| HistorialPrecios|
+------------+            +------------------+     +----------------+
      |                         |
      |                         |
      v                         v
+------------------+     +------------+            +----------------+
| ConsumoInsumos   |     | Empleados  |<---------->| ComentariosEmp |
+------------------+     +------------+            +----------------+
                              |
                              |
                              v
                        +------------+            +----------------+
                        |   Turnos   |            | MantenimientoEq |
                        +------------+            +----------------+
```

Para ver un diagrama ER más detallado, puedes utilizar una herramienta como MySQL Workbench y cargar el archivo SQL incluido en este repositorio.

## Consultas Disponibles
Este repositorio incluye más de 40 consultas SQL predefinidas para:
- Gestión diaria de operaciones
- Análisis de rendimiento de empleados
- Seguimiento de inventario y costos
- Análisis de rentabilidad por servicio
- Patrones de demanda y comportamiento de clientes
- Reportes financieros
- Proyecciones y planificación

## Requisitos
- MySQL 5.7+ / MariaDB 10.1+
- phpMyAdmin 4.7+ (opcional para gestión visual)
- PHP 7.0+ (si se implementa una interfaz web)

## Instalación
1. Clonar este repositorio
2. Importar el archivo `carwashdb.sql` en su servidor MySQL/MariaDB
3. Las consultas están disponibles en el archivo `consultas.txt`

## Uso
```sql
-- Ejemplo: Listar todos los vehículos atendidos en una fecha específica
SELECT v.placa, v.tipo, s.tipo AS tipo_lavado, e1.nombre AS recibido_por, e2.nombre AS lavado_por, os.fecha_recepcion
FROM OrdenesServicio os
JOIN Vehiculos v ON os.placa = v.placa
JOIN Servicios s ON os.id_servicio = s.id_servicio
JOIN Empleados e1 ON os.id_receptor = e1.id_empleado
JOIN Empleados e2 ON os.id_lavador = e2.id_empleado
WHERE DATE(os.fecha_recepcion) = '2025-03-10';
```

## Contribución
Las contribuciones son bienvenidas. Por favor, considere seguir estos pasos:
1. Fork del repositorio
2. Cree una rama para su función (`git checkout -b feature/nueva-caracteristica`)
3. Confirme sus cambios (`git commit -m 'Añadir nueva característica'`)
4. Push a la rama (`git push origin feature/nueva-caracteristica`)
5. Abra un Pull Request

## Licencia
Este proyecto está licenciado bajo la Licencia MIT - ver el archivo LICENSE para más detalles.

## Contacto
Si tiene preguntas o sugerencias, no dude en abrir un issue en este repositorio.
