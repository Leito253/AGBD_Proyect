-- TRIGGERS
--1) Crear un Trigger para evitar que se inserten mangas con precio negativo o nulo.

DELIMITER $$
CREATE TRIGGER BefInsMangas BEFORE INSERT ON Mangas
FOR EACH ROW
BEGIN
    IF NEW.Precio <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El precio debe ser mayor a 0';
    END IF;
END $$

--2) Crear un Trigger para restar automáticamente una unidad del stock cuando se realiza una compra.

DELIMITER $$
CREATE TRIGGER ActualizarStockAlComprar AFTER INSERT ON Compra
FOR EACH ROW
BEGIN
    UPDATE Stock
    SET cantidad = cantidad - 1
    WHERE idManga = NEW.idManga
    LIMIT 1;
END $$

--3) Crear un Trigger para evitar que se realice una compra si no hay stock disponible.
DELIMITER $$
CREATE TRIGGER ValidarStockAntesDeCompra BEFORE INSERT ON Compra
FOR EACH ROW
BEGIN
    IF (SELECT cantidad FROM Stock WHERE idManga = NEW.idManga LIMIT 1) < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Stock insuficiente para el manga seleccionado';
    END IF;
END $$


--4) Trigger que sirve para encriptar la contraseña al realizar un insert en usuario.

DELIMITER $$
CREATE TRIGGER befinsUsuario
BEFORE INSERT ON Usuario
FOR EACH ROW
BEGIN
 SET NEW.Contrasenia = SHA2(NEW.Contrasenia, 256);
END$$

--5) Trigger que sirve para encriptar la contraseña, después de realizar un cambio de contraseña, y se vuelve a encriptar.

DELIMITER $$
CREATE TRIGGER befupdUsuario
BEFORE UPDATE ON Usuario
FOR EACH ROW
BEGIN
  SET NEW.Contrasenia = SHA2(NEW.Contrasenia, 256);
END$$