-- USUARIO
INSERT INTO Usuario (Nombre, Contrasenia, Email, FechaRegistro, Telefono)
VALUES 
('JuanPerez', 'ghYt57823V', 'juan.perez@mail.com', '2024-01-15 10:30:00', '1134567890'),
('AnaGarcia', '178efgye34', 'ana.garcia@mail.com', '2024-02-10 15:00:00', '1145678901'),
('CarlosGomez', '4reuy45e8e', 'carlos.gomez@mail.com', '2024-03-05 18:45:00', '1156789012'),
('LauraMendez', 'yt82jxnbv4', 'laura.mendez@mail.com', '2024-04-01 09:10:00', '1167890123'),
('PedroMartinez', 'xuy5kjw39r', 'pedro.martinez@mail.com', '2024-05-20 20:15:00', '1178901234');

-- MANGAS
INSERT INTO Mangas (Nombre, Lanzamiento, Genero, Precio, Autor, Editorial, Volumen, Idioma, Estado)
VALUES 
('Naruto', '1999-09-21', 'Shonen', 15990, 'Masashi Kishimoto', 'Shueisha', 1, 'Japonés', 'Disponible'),
('One Piece', '1997-07-22', 'Shonen', 18500, 'Eiichiro Oda', 'Shueisha', 2, 'Japonés', 'Disponible'),
('Dragon Ball Z', '1989-04-15', 'Shonen', 17990, 'Akira Toriyama', 'Shueisha', 5, 'Japonés', 'Agotado'),
('Kimetsu no Yaiba', '2016-02-15', 'Shonen', 20000, 'Koyoharu Gotouge','Shueisha', 8, 'Español', 'Disponible');

-- EMPLEADOS
INSERT INTO Empleados (Cuil, Nombre, Apellido, DNI, SueldoUSD, FechaIngreso, Cargo, Telefono)
VALUES 
(20497834571, 'Carlos', 'Martinez', 49783457, 1500, '2022-01-10', 'Vendedor', '1144455566'),
(20469834562, 'Maria', 'Lopez', 46983456, 1600, '2021-11-20', 'Cajera', '1133344455'),
(20465893745, 'Luis', 'Ramirez', 46284732, 1450, '2023-05-15', 'Repositor', '1122233344');

-- COMPRA
INSERT INTO Compra (NroCompra, idUsuario, idManga, PrecioTotal, FechaCompra, MetodoPago, Estado)
VALUES 
(101, 1, 1, 15990, '2024-06-10 14:20:00', 'Tarjeta', 'Pagada'),
(102, 2, 2, 18500, '2024-06-12 16:45:00', 'Efectivo', 'Pagada'),
(103, 3, 3, 17990, '2024-06-15 11:00:00', 'MercadoPago', 'Pagada'),
(104, 4, 4, 21000, '2024-06-18 19:30:00', 'Transferencia', 'Pendiente');

-- SUCURSALES
INSERT INTO Sucursales (Ciudad, Direccion, Telefono, Horario)
VALUES 
('Buenos Aires', 'Av. del Libertador 1174', '1132109876', 'Lun-Vie 9 a 18hs'),
('Buenos Aires', 'Montevideo 1761', '1143210987', 'Lun-Sáb 10 a 20hs'),
('Buenos Aires', 'Juncal 1770', '1154321098', 'Lun-Vie 8 a 17hs');

-- DEVOLUCIONES 
INSERT INTO Devoluciones (NroCompra, idUsuario, Motivo, FechaDevolucion, Estado)
VALUES  
(101, 1, 'Manga equivocado, pedí otro título', '2024-06-20 12:00:00', 'Aceptada'),      
(102, 2, 'El manga llegó incompleto', '2024-06-21 15:30:00', 'Aceptada'),
(103, 3, 'No era el volumen que necesitaba', '2024-06-22 09:45:00', 'Pendiente');

-- CALIFICACIÓN
INSERT INTO Calificacion (idUsuario, idManga, Puntaje, Comentarios, Spoiler, Likes)
VALUES  
(1, 1, 5, 'Excelente manga, atrapante desde el inicio', FALSE, 12),
(2, 2, 4, 'Muy bueno, aunque a veces se hace largo', FALSE, 8),
(3, 3, 5, 'Obra maestra, lo recomiendo totalmente', FALSE, 20),
(4, 4, 3, 'Está bien, pero esperaba más acción', TRUE, 4),
(5, 1, 4, 'Me gusta mucho, aunque no es mi favorito', FALSE, 6);

-- STOCK
INSERT INTO Stock (idManga, idSucursal, Cantidad, UltimaActualizacion)
VALUES 
(1, 1, 101, '2024-06-15 10:00:00'),
(2, 2, 150, '2024-06-16 11:15:00'),
(3, 3, 200, '2024-06-17 14:30:00'),
(4, 1, 250, '2024-06-18 09:20:00');

-- SUCURSALES - EMPLEADOS
INSERT INTO Sucursales_Empleados (idSucursal, Cuil, FechaAsignacion)
VALUES 
(1, 20497834571, '2022-02-01'),
(2, 20469834562, '2021-12-01'),
(3, 20465893745, '2023-06-01');

-- ENVÍOS 
INSERT INTO Envios (NroCompra, Ciudad, Calle, Direccion, CodigoPostal, Referencia, EstadoEntrega, FechaEnvio, FechaEntrega)
VALUES 
(101, 'La Plata', 'Hipolito Yrigoyen', 1132, 1407, 'En medio de un kiosco', 'Entregado', '2024-06-11 09:00:00', '2024-06-13 17:00:00'),
(102, 'Corrientes','Callao' , 243, 5000, 'Frente a la plaza', 'En camino', '2024-06-13 14:20:00', NULL),
(103, 'Rosario', 'San Martin', 1451, 2000, 'Cerca del centro comercial', 'Pendiente', '2024-06-15 10:00:00', NULL);


