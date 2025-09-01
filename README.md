# 📚 BD_Mangas

Este proyecto implementa una base de datos para la gestión de una tienda de mangas, contemplando usuarios, compras, calificaciones, empleados, sucursales, stock y envíos.

🗂️ Estructura de la Base de Datos

La base de datos se llama BD_Mangas y contiene las siguientes tablas principales:

Usuario: Registro de clientes con sus credenciales (contraseña encriptada con SHA2).

Mangas: Catálogo de mangas disponibles con datos como nombre, lanzamiento, género, precio, autor y editorial.

Compra: Historial de compras realizadas por los usuarios.

Devoluciones: Registro de devoluciones con su motivo.

Calificacion: Opiniones y puntajes de los usuarios sobre los mangas (del 1 al 5).

Sucursales: Locales de la tienda con su ciudad y dirección.

Empleados: Información de los empleados (nombre, puesto, sueldo, etc.).

Sucursales_Empleados: Relación entre empleados y sucursales.

Stock: Cantidad de mangas disponibles en cada sucursal.

Envios: Información sobre envíos de compras a domicilio (estado, fecha de envío y entrega).

# Relación Entidad
```mermaid
erDiagram

    Usuario {
        INT idUsuario PK
        VARCHAR(45) Nombre
        VARCHAR(20) Contrasenia
    }

    Mangas {
        INT idManga PK
        VARCHAR(45) Nombre
        DATE Lanzamiento
        VARCHAR(45) Genero
        DECIMAL(10_2) Precio
        VARCHAR(45) Autor
        VARCHAR(45) Editorial
    }

    Empleados {
        BIGINT Cuil PK
        VARCHAR(45) Nombre
        VARCHAR(45) Apellido
        INT DNI
        SMALLINT SueldoUSD
    }

    Compra {
        INT NroCompra PK
        INT idUsuario FK
        INT idManga FK
        DECIMAL(10_2) PrecioTotal
        DATETIME FechaCompra
    }

    Devoluciones {
        INT NroCompra PK, FK
        INT idUsuario FK
        VARCHAR(45) Motivo
    }

    Calificacion {
        INT idCalificacion PK
        INT idUsuario FK
        INT idManga FK
        FLOAT PtjeEstrellas
        VARCHAR(255) Comentarios
        DATETIME FechaHora
    }

    Sucursales {
        INT idSucursal PK
        VARCHAR(45) Ciudad
        VARCHAR(100) Direccion
    }

    Stock {
        INT idManga PK, FK
        INT idSucursal PK, FK
        INT Cantidad
    }

    Sucursales_Empleados {
        INT idSucursal FK
        BIGINT Cuil FK
    }

    Envios {
        INT NroCompra PK, FK
        VARCHAR(45) Ciudad
        VARCHAR(100) Calle
        INT Direccion
        INT CodigoPostal
        VARCHAR(100) Referencia
    }

    %% Relaciones
    Usuario ||--o{ Compra : realiza
    Usuario ||--o{ Devoluciones : solicita
    Usuario ||--o{ Calificacion : escribe

    Mangas ||--o{ Compra : "es comprado"
    Mangas ||--o{ Calificacion : "recibe"
    Mangas ||--o{ Stock : "se almacena en"

    Compra ||--o{ Devoluciones : "puede generar"
    Compra ||--|| Envios : "genera"

    Sucursales ||--o{ Stock : contiene
    Sucursales ||--o{ Sucursales_Empleados : tiene

    Empleados ||--o{ Sucursales_Empleados : trabaja

```
