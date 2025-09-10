--CONSULTAS SQL

-- 1) Mostrar todos los mangas disponibles con su stock en cada sucursal

SELECT m.Nombre AS Manga, s.Ciudad AS Sucursal, st.Cantidad AS Stock
FROM Stock st
JOIN Mangas m ON st.idManga = m.idManga
JOIN Sucursales s ON st.idSucursal = s.idSucursal
ORDER BY m.Nombre, s.Ciudad;

-- 2) Mostrar el nombre de los usuarios y la cantidad total (en el encabezado escribir “total gastado”) que han gastado en compras, mostrando sólo aquellos usuarios cuya cantidad total gastada sea mayor a 15,000, ordenado de mayor a menor según la cantidad total gastada.

SELECT U.Nombre, SUM(C.PrecioTotal) AS `Total Gastado`
FROM Usuario U
INNER JOIN Compra C ON U.idUsuario = C.idUsuario
GROUP BY U.Nombre
HAVING SUM(C.PrecioTotal) > 15000
ORDER BY `Total Gastado` DESC;



-- 3) Mostrar el manga más vendido y en qué mangas se necesita más stock.

SELECT m.Nombre AS Manga, COUNT(DISTINCT c.NroCompra) VecesComprado, SUM(st.Cantidad) AS StockTotal
FROM Mangas m
LEFT JOIN Compra c ON m.idManga = c.idManga
LEFT JOIN Stock st ON m.idManga = st.idManga
GROUP BY m.idManga, m.Nombre
ORDER BY VecesComprado DESC, StockTotal ASC;


-- 4) Mostrar las compras con devolución y el motivo de su devolución.
	
SELECT c.NroCompra, u.Nombre AS Usuario, m.Nombre AS Manga, c.PrecioTotal, d.Motivo
FROM Compra c
JOIN Devoluciones d ON c.NroCompra = d.NroCompra
JOIN Usuario u ON c.idUsuario = u.idUsuario
JOIN Mangas m ON c.idManga = m.idManga
ORDER BY c.NroCompra;


-- 5) Mostrar el nombre de la ciudad y el sueldo promedio en dólares de sus empleados (JOIN con Sucursales) si el sueldo promedio es superior a 1500 USD. Ordenar por el sueldo promedio en orden descendente. 

SELECT Sucursales.Ciudad AS Ciudad, 
AVG(Empleados.Sueldousd) AS PromedioSueldo
FROM Empleados
INNER JOIN Sucursales_Empleados ON Empleados.Cuil = Sucursales_Empleados.Cuil
INNER JOIN Sucursales ON Sucursales_Empleados.idSucursal = Sucursales.idSucursal
GROUP BY Sucursales.Ciudad
HAVING AVG(Empleados.Sueldousd) > 1500
ORDER BY PromedioSueldo DESC;