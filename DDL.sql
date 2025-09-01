DROP DATABASE IF EXISTS BD_Mangas;
CREATE DATABASE BD_Mangas;
USE BD_Mangas;

CREATE TABLE Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NULL,
  Contrasenia VARCHAR(20) NULL,
  CONSTRAINT PK_Usuario PRIMARY KEY (idUsuario)
);

CREATE TABLE Mangas (
  idManga INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(45) NULL,
  Lanzamiento DATE NULL,
  Genero VARCHAR(45) NULL,
  Precio DECIMAL(10, 2) NULL,
  Autor VARCHAR(45) NULL,
  Editorial VARCHAR(45) NULL,
  CONSTRAINT PK_Mangas PRIMARY KEY (idManga)
);

CREATE TABLE Empleados (
  Cuil BIGINT NOT NULL,
  Nombre VARCHAR(45) NULL,
  Apellido VARCHAR(45) NULL,
  DNI INT UNSIGNED NULL,
  SueldoUSD SMALLINT UNSIGNED NULL,
  CONSTRAINT PK_Empleados PRIMARY KEY (Cuil)
);

CREATE TABLE Compra (
  NroCompra INT UNSIGNED NOT NULL,
  idUsuario INT NOT NULL,
  idManga INT NOT NULL,
  PrecioTotal DECIMAL(10, 2) NULL,
  FechaCompra DATETIME NULL,
  CONSTRAINT PK_Compra PRIMARY KEY (NroCompra),
  CONSTRAINT FK_Compra_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
  CONSTRAINT FK_Compra_Mangas FOREIGN KEY (idManga) REFERENCES Mangas(idManga)
);

CREATE TABLE Sucursales (
  idSucursal INT NOT NULL AUTO_INCREMENT,
  Ciudad VARCHAR(45) NOT NULL,
  Direccion VARCHAR(100) NULL,
  CONSTRAINT PK_Sucursales PRIMARY KEY (idSucursal)
);

CREATE TABLE Devoluciones (
  NroCompra INT UNSIGNED NOT NULL,
  idUsuario INT NOT NULL,
  Motivo VARCHAR(45) NULL,
  CONSTRAINT PK_Devoluciones PRIMARY KEY (NroCompra),
  CONSTRAINT FK_Devoluciones_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
  CONSTRAINT FK_Devoluciones_Compra FOREIGN KEY (NroCompra) REFERENCES Compra(NroCompra)
);

CREATE TABLE Calificacion (
  idCalificacion INT NOT NULL AUTO_INCREMENT,
  idUsuario INT NOT NULL,
  idManga INT NOT NULL,
  Puntaje TINYINT NOT NULL CHECK (Puntaje BETWEEN 1 AND 5),
  Comentarios VARCHAR(255) NULL,
  FechaHora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT PK_Calificacion PRIMARY KEY (idCalificacion),
  CONSTRAINT FK_Calificacion_Usuario FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
  CONSTRAINT FK_Calificacion_Manga FOREIGN KEY (idManga) REFERENCES Mangas(idManga),
  CONSTRAINT UQ_Calificacion UNIQUE (idUsuario, idManga)
);

CREATE TABLE Stock (
  idManga INT NOT NULL,
  idSucursal INT NOT NULL,
  Cantidad INT NOT NULL,
  CONSTRAINT PK_Stock PRIMARY KEY (idManga, idSucursal),
  CONSTRAINT FK_Stock_Mangas FOREIGN KEY (idManga) REFERENCES Mangas(idManga),
  CONSTRAINT FK_Stock_Sucursales FOREIGN KEY (idSucursal) REFERENCES Sucursales(idSucursal)
);

CREATE TABLE Sucursales_Empleados (
  idSucursal INT NOT NULL,
  Cuil BIGINT NOT NULL,
  CONSTRAINT FK_SucursalesEmpleados_Sucursal FOREIGN KEY (idSucursal) REFERENCES Sucursales(idSucursal),
  CONSTRAINT FK_SucursalesEmpleados_Empleado FOREIGN KEY (Cuil) REFERENCES Empleados(Cuil)
);

CREATE TABLE Envios (
  NroCompra INT UNSIGNED NOT NULL,
  Ciudad VARCHAR(45) NOT NULL,
  Calle VARCHAR(100) NOT NULL,
  Direccion INT NOT NULL,
  CodigoPostal INT NOT NULL,
  Referencia VARCHAR(100) NULL,
  CONSTRAINT PK_Envios PRIMARY KEY (NroCompra),
  CONSTRAINT FK_Envios_Compra FOREIGN KEY (NroCompra) REFERENCES Compra(NroCompra)
);
