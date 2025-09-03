-- USUARIO
INSERT INTO Usuario (Nombre, Contrasenia)
VALUES 
('JuanPerez', 'ghYt57823V'),
('AnaGarcia', '178efgye34'),
('CarlosGomez', '4reuy45e8e'),
('LauraMendez', 'yt82jxnbv4'),  
('PedroMartinez', 'xuy5kjw39r'),
('RocioDiaz', 'PaSsW098'),
('SofiaLopez', 'n9y43mndk'),
('MiguelSosa', 'qwe8743jH'),
('ValentinaRamos', 'poi98uynm'),
('DiegoFernandez', 'klj76sdfg');

-- MANGAS
INSERT INTO Mangas (Nombre, Lanzamiento, Genero, Precio, Autor, Editorial)

VALUES ('Naruto', '1999-09-21', 'Shonen', 15990, 'Masashi Kishimoto', 'Shueisha'),
('One Piece', '1997-07-22', 'Shonen', 18500, 'Eiichiro Oda', 'Shueisha'),
('Dragon Ball Z', '1989-04-15', 'Shonen', 17990, 'Akira Toriyama', 'Shueisha'),
('Kimetsu no Yaiba', '2016-02-15', 'Shonen', 20000, 'Koyoharu Gotouge','Shueisha');

-- EMPLEADOS
INSERT INTO Empleados (Nombre, Apellido, dni, Cuil, SueldoUSD)
VALUES 
('Carlos', 'Martinez', 49783457, 20497834571, 1500),
('Maria', 'Lopez', 46983456, 20469834562, 1600),
('Luis', 'Ramirez', 46284732, 20465893745, 1450);

-- COMPRAS
INSERT INTO Compra (idUsuario, idManga, PrecioTotal, NroCompra)
VALUES (1, 1, 15990, 101),
(2, 2, 18500, 102),
(3, 3, 17990, 103),
(4, 4, 21000, 104);

-- SUCURSALES
INSERT INTO Sucursales (Ciudad, Direccion)
VALUES 
('Buenos Aires', 'Av. del Libertador 1174'),
('Buenos Aires', 'Montevideo 1761'),
('Buenos Aires', 'Juncal 1770');

-- DEVOLUCIONES 
INSERT INTO Devoluciones (idUsuario, Nrocompra, Motivo)
VALUES  
(1, 101, 'Manga equivocado, pedí otro título'),      
(2, 102, 'El manga llegó incompleto'),
(3, 103, 'No era el volumen que necesitaba');

-- CALIFICACIÓN
INSERT INTO Calificacion (idUsuario, idManga, Puntaje, Comentarios)
VALUES  (1, 1, 5, 'Excelente manga, atrapante desde el inicio'),
(2, 2, 4, 'Muy bueno, aunque a veces se hace largo'),
(3, 3, 5, 'Obra maestra, lo recomiendo totalmente'),
(4, 4, 3, 'Está bien, pero esperaba más acción'),
(5, 1, 4, 'Me gusta mucho, aunque no es mi favorito');

-- DEVOLUCIONES 
INSERT INTO Devoluciones (idUsuario, Nrocompra, Motivo)
VALUES  
(1, 101, 'Manga equivocado, pedí otro título'),      
(2, 102, 'El manga llegó incompleto'),
(3, 103, 'No era el volumen que necesitaba');

-- STOCK
INSERT INTO Stock (idManga, idSucursal, Cantidad)
VALUES 
(1, 1, 101),
(2, 2, 150),
(3, 3, 200),
(4, 1, 250);

-- ENVÍOS 
INSERT INTO Envios (Ciudad, Calle, Direccion, CodigoPostal, Referencia)
VALUES 
('La Plata', 'Hipolito Yrigoyen', '1132', 1407, 'En medio de un kiosco'),
('Corrientes','Callao' , '243', 5000, 'Frente a la plaza'),
('Rosario', 'San Martin', '1451', 2000, 'Cerca del centro comercial');


