-- STORED PROCEDURE
-- 1) Crear los SP para dar de alta todas las tablas con sus respectivos parámetros
DELIMITER $$
DROP PROCEDURE IF EXISTS altaUsuario;
CREATE PROCEDURE altaUsuario (Nombre VARCHAR(45), unaContrasenia INT)
BEGIN
   INSERT INTO Usuario (Nombre, Contrasenia)
   VALUES (unNombre, unaContrasenia);
END $$


DELIMITER $$
DROP PROCEDURE IF EXISTS altaCompra;
CREATE PROCEDURE altaCompra (unNroCompra INT, unidUsuario VARCHAR(45), unidManga INT, unPrecioTotal DECIMAL(10,2), unaFechadeCompra DATETIME)
BEGIN
   INSERT INTO Compra (NroCompra, idUsuario, idManga, PrecioTotal, FechadeCompra)
   VALUES (unNroCompra, unidUsuario, unidManga, unPrecioTotal, unaFechadeCompra);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaDevoluciones;
CREATE PROCEDURE altaDevoluciones (unNroCompra INT, unidUsuario INT, unMotivo VARCHAR(45))
BEGIN
   INSERT INTO Devoluciones (unNroCompra, idUsuario, Motivo)
   VALUES (unNroCompra, unidUsuario, unMotivo);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaEmpleados;
CREATE PROCEDURE altaEmpleados (unCuil BIGINT, unNombre VARCHAR(45), unApellido VARCHAR(45), unDNI INT,  unSueldoUSD SMALLINT)
BEGIN
   INSERT INTO Empleados (Cuil, Nombre, Apellido, DNI, SueldoUSD)
   VALUES (unCuil, unNombre, unApellido, unDNI, unSueldoUSD);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaEnvios;
CREATE PROCEDURE altaEnvios (unNrodecompra INT, unaCiudad VARCHAR(45), unaCalle VARCHAR(100), unaDireccion INT, unCodigoPostal INT, unaReferencia VARCHAR(100))
BEGIN
   INSERT INTO Envios (Nrodecompra, Ciudad, Calle, Direccion, CodigoPostal, Referencia)
   VALUES (unNrodecompra, unaCiudad, unaCalle, unaDireccion, unCodigoPostal, unaReferencia);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaMangas;
CREATE PROCEDURE altaMangas (unNombre VARCHAR(45), unLanzamiento DATE, unGenero VARCHAR(45), unPrecio DECIMAL(10,2), unAutor VARCHAR(45), unaEditorial VARCHAR(45))
BEGIN
   INSERT INTO Mangas (Nombre, Lanzamiento, Genero, Precio, Autor, Editorial)
   VALUES (unNombre, unLanzamiento, unGenero, unPrecio, unAutor, unaEditorial);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaCalificacion;
CREATE PROCEDURE altaCalificion (unidUsuario INT, unidManga INT, unPtjeEstrellas FLOAT, unComentario VARCHAR(255), unaFechaHora DATETIME)
BEGIN
   INSERT INTO Calificacion (idUsuario, idManga, PtjeEstrellas, Comentario, FechaHora)
   VALUES (unidUsuario, unidManga, unPtjeEstrellas, unComentario, unaFechaHora);  
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaStock;
CREATE PROCEDURE altaStock (unidManga INT, unidSucursal INT, unaCantidad INT)
BEGIN
   INSERT INTO Stock (idManga, idSucursal, Cantidad)
   VALUES (unidManga, unidSucursal, unaCantidad);
END $$

DELIMITER $$
DROP PROCEDURE IF EXISTS altaSucursales;
CREATE PROCEDURE altaSucursales (unaDireccion VARCHAR(45), unaCiudad VARCHAR(45))
BEGIN
   INSERT INTO Sucursales (Direccion, Ciudad)
   VALUES (unaDireccion, unaCiudad);
END $$

-- 2) Obtener opiniones por manga teniendo como parámetro un idManga

DELIMITER $$
DROP PROCEDURE IF EXISTS ObtenerOpinionesPorManga;
CREATE PROCEDURE ObtenerOpinionesPorManga (unidManga INT)
BEGIN
   SELECT Resenia, Nombre AS Usuario, FechaHora
   FROM Opiniones
   JOIN Usuario USING (idUsuario)
   WHERE idManga = unidManga
   ORDER BY FechaHora DESC;
END $$


-- 3) Crear un procedure que intente dar de baja un manga, pero solo si nadie lo compró.
-- Si ese manga fue comprado al menos una vez, lanzar un error.
-- Si no, eliminarlo de las tablas relacionadas (Stock, Opiniones) y marcarlo como no disponible (actualizando Precio a NULL como baja lógica).

DELIMITER $$
DROP PROCEDURE IF EXISTS BajaMangaSiNoComprado;
CREATE PROCEDURE BajaMangaSiNoComprado (unIdManga INT)
BEGIN
   IF (EXISTS (
       SELECT *
       FROM Compra
       WHERE idManga = unIdManga
   )) THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'No se puede eliminar el manga; ya fue comprado al menos una vez.';
   ELSE
       DELETE FROM Opiniones
       WHERE idManga = unIdManga;

       DELETE FROM Stock
       WHERE idManga = unIdManga;

       UPDATE Mangas
       SET Precio = NULL
       WHERE idManga = unIdManga;
   END IF;
END $$
