-- USUARIOS
INSERT INTO Usuario (Nombre, Contrasenia)
VALUES 
('JuanPerez', 'ghYt57823V'),
('AnaGarcia', '178efgye34'),
('CarlosGomez', '4reuy45e8e'),
('LauraMendez', 'yt82jxnbv4'),  
('PedroMartinez', 'xuy5kjw39r');

-- MANGAS
INSERT INTO Mangas (Nombre, Lanzamiento, Genero, Precio, Autor, Editorial)
VALUES 
('Naruto', '1999-09-21', 'Shonen', 15990, 'Masashi Kishimoto', 'Shueisha'),
('One Piece', '1997-07-22', 'Shonen', 18500, 'Eiichiro Oda', 'Shueisha'),
('Dragon Ball Z', '1989-04-15', 'Shonen', 17990, 'Akira Toriyama', 'Shueisha'),
('Kimetsu no Yaiba', '2016-02-15', 'Shonen', 20000, 'Koyoharu Gotouge','Shueisha');

-- EMPLEADOS
INSERT INTO Empleados (Cuil, Nombre, Apellido, dni, SueldoUSD)
VALUES 
(20497834571,'Carlos', 'Martinez', 49783457, 1500),
(20469834562,'Maria', 'Lopez', 46983456, 1600),
(20475893745,'Luis', 'Ramirez', 46284732, 1450);

-- COMPRAS
INSERT INTO Compra (NroCompra, idUsuario, idManga, PrecioTotal)
VALUES 
(101, 1, 1, 15990),
(102, 2, 2, 18500),
(103, 3, 3, 17990),
(104, 4, 4, 21000);

-- SUCURSALES
INSERT INTO Sucursales (Ciudad, Direccion)
VALUES 
('Buenos Aires', 'Av. del Libertador 1174'),
('Buenos Aires', 'Montevideo 1761'),
('Buenos Aires', 'Juncal 1770');

-- DEVOLUCIONES 
INSERT INTO Devoluciones (NroCompra, idUsuario, Motivo)
VALUES  
(101, 1, 'Manga equivocado, pedí otro título'),      
(102, 2, 'El manga llegó incompleto'),
(103, 3, 'No era el volumen que necesitaba');

-- CALIFICACIÓN
INSERT INTO Calificacion (idUsuario, idManga, Puntaje, Comentarios, FechaHora)
VALUES  
(1, 1, 5, 'Excelente manga, atrapante desde el inicio', '2025-08-01 14:30:00'),
(2, 2, 4, 'Muy bueno, aunque a veces se hace largo', '2025-08-02 16:15:00'),
(3, 3, 5, 'Obra maestra, lo recomiendo totalmente', '2025-08-03 12:45:00'),
(4, 4, 3, 'Está bien, pero esperaba más acción', '2025-08-04 18:20:00'),
(5, 1, 4, 'Me gusta mucho, aunque no es mi favorito', '2025-08-05 10:05:00');

-- STOCK
INSERT INTO Stock (idManga, idSucursal, Cantidad)
VALUES 
(1, 1, 101),
(2, 2, 150),
(3, 3, 200),
(4, 1, 250);

-- ENVÍOS 
INSERT INTO Envios (NroCompra, Ciudad, Calle, Direccion, CodigoPostal, Referencia)
VALUES 
(101, 'La Plata', 'Hipolito Yrigoyen', 1132, 1407, 'En medio de un kiosco'),
(102, 'Corrientes', 'Callao', 243, 5000, 'Frente a la plaza'),
(103, 'Rosario', 'San Martin', 1451, 2000, 'Cerca del centro comercial');
