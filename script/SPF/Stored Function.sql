-- STORED FUNCTION
-- 1) Crear una función llamada PromediottlCompra que reciba como parámetro un identificador de compra (idCompra de tipo entero) y devuelva el promedio del precio total (Preciottl) de todos los registros asociados a dicho identificador en la tabla Compra. La función debe retornar un valor numérico con decimales que represente dicho promedio.

DELIMITER $$
DROP FUNCTION IF EXISTS PromediottlCompra;
CREATE FUNCTION PromediottlCompra (unidCompra INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE Resultado INT;
SELECT AVG(PrecioTotal) INTO Resultado
FROM Compra
WHERE idCompra = unidCompra ;
RETURN Resultado ;
END $$

-- 2)Crear una función que reciba como parámetro un idUsuario
-- y devuelva el total de dinero que ese usuario gastó en compras.

DELIMITER $$
DROP FUNCTION IF EXISTS TotalGastadoPorUsuario;
CREATE FUNCTION TotalGastadoPorUsuario (unidUsuario INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE CompraTotal INT;
SELECT SUM(PrecioTotal) INTO CompraTotal
FROM Compra
WHERE idUsuario = unidUsuario;
RETURN CompraTotal;
END $$


-- 3)Crear una función que reciba un idManga y devuelva el total de unidades en stock
-- en todas las sucursales. Solo debe contar el stock disponible en sucursales
-- donde la cantidad sea mayor a 100 unidades. La función debe devolver el resultado como un número entero.

DELIMITER $$
DROP FUNCTION IF EXISTS TotalStockMayor100;
CREATE FUNCTION TotalStockMayor100 (unidManga INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE UnidadTotal INT;
SELECT SUM(cantidad) INTO UnidadTotal
FROM Stock
WHERE idManga = unidManga AND cantidad > 100;
RETURN UnidadTotal;
END $$


-- 4) Crear una función llamada CantidadComprasPorUsuario que reciba como parámetro un idUsuario
-- y devuelva cuántas compras ha realizado ese usuario.

DELIMITER $$
DROP FUNCTION IF EXISTS CantidadComprasPorUsuario;
CREATE FUNCTION CantidadComprasPorUsuario (unidUsuario INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE totalCompras INT;
SELECT COUNT(*) INTO totalCompras
FROM Compra
WHERE idUsuario = unidUsuario;
RETURN totalCompras;
END $$