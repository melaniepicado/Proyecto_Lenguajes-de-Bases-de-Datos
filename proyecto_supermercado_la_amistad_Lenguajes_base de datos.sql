CONNECT C##Mlaken3025/302528;
SELECT USER FROM DUAL;
ALTER SESSION SET CURRENT_SCHEMA = Mlaken302528;

---------------------------------------------------------------------------------------

-- Creación de tablas
CREATE TABLE tb_provincia (
  id_Provincia NUMBER(11) NOT NULL,
  Provincia VARCHAR2(50)
);

CREATE TABLE tb_canton (
  id_Canton NUMBER(11) NOT NULL,
  Canton VARCHAR2(50),
  id_Provincia NUMBER(11),
  CONSTRAINT pk_canton PRIMARY KEY (id_Canton)
);

CREATE TABLE tb_distrito (
  id_Distrito NUMBER(11) NOT NULL,
  Distrito VARCHAR2(50),
  id_Canton NUMBER(11)
);

CREATE TABLE tb_direccion (
  id_Direccion NUMBER(11) NOT NULL,
  Provincia NUMBER(11),
  Otras_senas VARCHAR2(100),
  Canton NUMBER(11),
  Distrito NUMBER(11)
);

CREATE TABLE tb_categoria (
  id_Categoria NUMBER(11) NOT NULL,
  nombre_Categoria VARCHAR2(50),
  descripcion VARCHAR2(50)
);

CREATE TABLE tb_producto (
  id_Producto NUMBER(11) NOT NULL,
  nombre_Producto VARCHAR2(50),
  cantidad_Disponible NUMBER(11),
  precio_Venta NUMBER,
  descripcion VARCHAR2(50),
  id_Lote NUMBER(11),
  id_Marca NUMBER(11),
  id_Categoria NUMBER(11),
  id_Proveedor NUMBER(11)
);

CREATE TABLE tb_proveedor (
  id_Proveedor NUMBER(11) NOT NULL,
  nombreProveedor VARCHAR2(50),
  identificacion NUMBER(11),
  correo VARCHAR2(80),
  telefono NUMBER(11),
  id_Direccion NUMBER(11),
  estado NUMBER(1)
);

CREATE TABLE tb_empleado (
  id_Empleado NUMBER(11) NOT NULL,
  Nombre VARCHAR2(50),
  PrimerApellido VARCHAR2(50),
  SegundoApellido VARCHAR2(50),
  correo VARCHAR2(50),
  telefono VARCHAR2(50),
  Salario NUMBER,
  contrasena VARCHAR2(50),
  num_identificacion NUMBER(11),
  fecha_Nacimiento DATE,
  horas_labor NUMBER(11),
  id_Direccion NUMBER(11),
  estado NUMBER(1),
  id_usuario_Rol NUMBER(11)
);

CREATE TABLE tb_usuario_rol (
  id_usuario_Rol NUMBER(11) NOT NULL,
  nombre_Rol VARCHAR2(50),
  descripcion_Rol VARCHAR2(50)
);

CREATE TABLE tb_cliente (
  idCliente NUMBER(11) NOT NULL,
  identificacion NUMBER(11),
  Nombre VARCHAR2(50),
  PrimerApellido VARCHAR2(50),
  SegundApellido VARCHAR2(50),
  Correo VARCHAR2(50),
  telefono NUMBER(11),
  id_Direccion NUMBER(11),
  estado NUMBER(1)
);

CREATE TABLE tb_compra (
  id_Compra NUMBER(11) NOT NULL,
  fecha_Factura DATE DEFAULT NULL,
  idCliente NUMBER(11) DEFAULT NULL,
  id_Empleado NUMBER(11) DEFAULT NULL
);

CREATE TABLE tb_detalle_compra (
  id_detalle_compra NUMBER(11) NOT NULL,
  cantidad_venta NUMBER(11),
  id_producto NUMBER(11),
  id_compra NUMBER(11),
  CONSTRAINT pk_detalle_compra PRIMARY KEY (id_detalle_compra)
);

CREATE TABLE tb_factura (
  id_Factura NUMBER(11) NOT NULL,
  fecha_Factura DATE,
  idCliente NUMBER(11),
  id_Empleado NUMBER(11)
);

CREATE TABLE tb_detalle_factura (
  id_detalleFactura NUMBER(11) NOT NULL,
  cantidad_Venta NUMBER(11),
  id_Producto NUMBER(11),
  id_Factura NUMBER(11)
);

CREATE TABLE tb_lote (
  id_Lote NUMBER(11) NOT NULL,
  Fecha_Produccion DATE,
  Fecha_Vencimiento DATE
);

CREATE TABLE tb_marca (
  id_Marca NUMBER(11) NOT NULL,
  nombre_Marca VARCHAR2(50)
);

----------------------------Triggers----------------------------
--------------------------------------------------------
--  DDL for Trigger TRG_CATEGORIA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_CATEGORIA_ID" 
BEFORE INSERT ON tb_categoria
FOR EACH ROW
BEGIN
  :NEW.id_Categoria := seq_categoria_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_CATEGORIA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CLIENTE_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_CLIENTE_ID" 
BEFORE INSERT ON tb_cliente
FOR EACH ROW
BEGIN
  :NEW.idCliente := seq_cliente_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_CLIENTE_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DETALLE_FACTURA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_DETALLE_FACTURA_ID" 
BEFORE INSERT ON tb_detalle_factura
FOR EACH ROW
BEGIN
  :NEW.id_detalleFactura := seq_detalle_factura_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_DETALLE_FACTURA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DIRECCION_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_DIRECCION_ID" 
BEFORE INSERT ON tb_direccion
FOR EACH ROW
BEGIN
  :NEW.id_Direccion := seq_direccion_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_DIRECCION_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DISTRITO_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_DISTRITO_ID" 
BEFORE INSERT ON tb_distrito
FOR EACH ROW
BEGIN
  :NEW.id_Distrito := seq_distrito_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_DISTRITO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_EMPLEADO_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_EMPLEADO_ID" 
BEFORE INSERT ON tb_empleado
FOR EACH ROW
BEGIN
  :NEW.id_Empleado := seq_empleado_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_EMPLEADO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_FACTURA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_FACTURA_ID" 
BEFORE INSERT ON tb_factura
FOR EACH ROW
BEGIN
  :NEW.id_Factura := seq_factura_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_FACTURA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_LOTE_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_LOTE_ID" 
BEFORE INSERT ON tb_lote
FOR EACH ROW
BEGIN
  :NEW.id_Lote := seq_lote_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_LOTE_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_MARCA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_MARCA_ID" 
BEFORE INSERT ON tb_marca
FOR EACH ROW
BEGIN
  :NEW.id_Marca := seq_marca_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_MARCA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PRODUCTO_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PRODUCTO_ID" 
BEFORE INSERT ON tb_producto
FOR EACH ROW
BEGIN
  :NEW.id_Producto := seq_producto_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_PRODUCTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROVEEDOR_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PROVEEDOR_ID" 
BEFORE INSERT ON tb_proveedor
FOR EACH ROW
BEGIN
  :NEW.id_Proveedor := seq_proveedor_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_PROVEEDOR_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROVINCIA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PROVINCIA_ID" 
BEFORE INSERT ON tb_provincia
FOR EACH ROW
BEGIN
  :NEW.id_Provincia := seq_provincia_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_PROVINCIA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_USUARIO_ROL_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_USUARIO_ROL_ID" 
BEFORE INSERT ON tb_usuario_rol
FOR EACH ROW
BEGIN
  :NEW.id_usuario_Rol := seq_usuario_rol_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_USUARIO_ROL_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CATEGORIA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_CATEGORIA_ID" 
BEFORE INSERT ON tb_categoria
FOR EACH ROW
BEGIN
  :NEW.id_Categoria := seq_categoria_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_CATEGORIA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_CLIENTE_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_CLIENTE_ID" 
BEFORE INSERT ON tb_cliente
FOR EACH ROW
BEGIN
  :NEW.idCliente := seq_cliente_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_CLIENTE_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DETALLE_FACTURA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_DETALLE_FACTURA_ID" 
BEFORE INSERT ON tb_detalle_factura
FOR EACH ROW
BEGIN
  :NEW.id_detalleFactura := seq_detalle_factura_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_DETALLE_FACTURA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DIRECCION_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_DIRECCION_ID" 
BEFORE INSERT ON tb_direccion
FOR EACH ROW
BEGIN
  :NEW.id_Direccion := seq_direccion_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_DIRECCION_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_DISTRITO_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_DISTRITO_ID" 
BEFORE INSERT ON tb_distrito
FOR EACH ROW
BEGIN
  :NEW.id_Distrito := seq_distrito_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_DISTRITO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_EMPLEADO_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_EMPLEADO_ID" 
BEFORE INSERT ON tb_empleado
FOR EACH ROW
BEGIN
  :NEW.id_Empleado := seq_empleado_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_EMPLEADO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_FACTURA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_FACTURA_ID" 
BEFORE INSERT ON tb_factura
FOR EACH ROW
BEGIN
  :NEW.id_Factura := seq_factura_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_FACTURA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_LOTE_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_LOTE_ID" 
BEFORE INSERT ON tb_lote
FOR EACH ROW
BEGIN
  :NEW.id_Lote := seq_lote_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_LOTE_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_MARCA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_MARCA_ID" 
BEFORE INSERT ON tb_marca
FOR EACH ROW
BEGIN
  :NEW.id_Marca := seq_marca_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_MARCA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PRODUCTO_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PRODUCTO_ID" 
BEFORE INSERT ON tb_producto
FOR EACH ROW
BEGIN
  :NEW.id_Producto := seq_producto_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_PRODUCTO_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROVEEDOR_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PROVEEDOR_ID" 
BEFORE INSERT ON tb_proveedor
FOR EACH ROW
BEGIN
  :NEW.id_Proveedor := seq_proveedor_id.NEXTVAL;
END;
/
ALTER TRIGGER "TRG_PROVEEDOR_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_PROVINCIA_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_PROVINCIA_ID" 
BEFORE INSERT ON tb_provincia
FOR EACH ROW
BEGIN
  :NEW.id_Provincia := seq_provincia_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_PROVINCIA_ID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_USUARIO_ROL_ID
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRG_USUARIO_ROL_ID" 
BEFORE INSERT ON tb_usuario_rol
FOR EACH ROW
BEGIN
  :NEW.id_usuario_Rol := seq_usuario_rol_id.NEXTVAL;
END;

/
ALTER TRIGGER "TRG_USUARIO_ROL_ID" ENABLE;

----------------------------------------------Inserts-----------------------------------------------------------
----tb_provincia----
INSERT INTO tb_provincia (id_Provincia, Provincia)
VALUES(1, 'San Jose');
INSERT INTO tb_provincia (id_Provincia, Provincia)
VALUES(2, 'Alajuela');
INSERT INTO tb_provincia (id_Provincia, Provincia)
VALUES(3, 'Cartago');
INSERT INTO tb_provincia (id_Provincia, Provincia)
VALUES(4, 'Heredia');
INSERT INTO tb_provincia (id_Provincia, Provincia)
VALUES(5, 'Guanacaste');
INSERT INTO tb_provincia (id_Provincia, Provincia)
VALUES(6, 'Puntarenas');
INSERT INTO tb_provincia (id_Provincia, Provincia)
VALUES(7, 'Lim�n');

----tb_canton---
INSERT INTO tb_canton  VALUES(1, 'San Jose', 1);
INSERT INTO tb_canton  VALUES(2, 'Escaz�', 1);
INSERT INTO tb_canton  VALUES(3, 'Desamparados', 1);
INSERT INTO tb_canton  VALUES(4, 'Alajuela', 2);
INSERT INTO tb_canton  VALUES(5, 'Atenas', 2);
INSERT INTO tb_canton  VALUES(6, 'Cartago', 3);
INSERT INTO tb_canton  VALUES(7, 'La Uni�n', 3);
INSERT INTO tb_canton  VALUES(8, 'Heredia', 4);
INSERT INTO tb_canton  VALUES(9, 'Barva', 4);
INSERT INTO tb_canton  VALUES(10, 'Bel�n', 4);
INSERT INTO tb_canton  VALUES(11, 'Santa Cruz', 5);
INSERT INTO tb_canton  VALUES(12, 'Esparza', 5);
INSERT INTO tb_canton  VALUES(13, 'Puntarenas', 6);
INSERT INTO tb_canton  VALUES(14, 'Quepos', 6);
INSERT INTO tb_canton  VALUES(15, 'Lim�n', 7);
INSERT INTO tb_canton  VALUES(16, 'Pococ�', 7);
INSERT INTO tb_canton  VALUES(17, 'Siquirres', 7);

----tb_distrito----
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(1, 'Carmen', 1);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(2, 'San Francisco', 1);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(3, 'San Antonio', 2);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(4, 'San Rafael', 2);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(5, 'San Rafael', 3);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(6, 'San Crist�bal', 3);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(7, 'San Josecito', 4);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(8, 'R�o Segundo', 4);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(9, 'San Isidro', 5);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(10, 'Barva', 6);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(11, 'San Antonio', 7);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(12, 'Concepci�n', 7);

----tb_Lote----
INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (1, TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2023-08-31', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (2, TO_DATE('2023-07-15', 'YYYY-MM-DD'), TO_DATE('2023-09-15', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (3, TO_DATE('2023-08-10', 'YYYY-MM-DD'), TO_DATE('2023-09-10', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (4, TO_DATE('2023-07-20', 'YYYY-MM-DD'), TO_DATE('2023-08-20', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (5, TO_DATE('2023-08-05', 'YYYY-MM-DD'), TO_DATE('2023-09-05', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (6, TO_DATE('2023-07-25', 'YYYY-MM-DD'), TO_DATE('2023-08-25', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (7, TO_DATE('2023-08-02', 'YYYY-MM-DD'), TO_DATE('2023-09-02', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (8, TO_DATE('2023-07-12', 'YYYY-MM-DD'), TO_DATE('2023-08-12', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (9, TO_DATE('2023-08-08', 'YYYY-MM-DD'), TO_DATE('2023-09-08', 'YYYY-MM-DD'));

INSERT INTO tb_Lote (ID_Lote, Fecha_Produccion, Fecha_Vencimiento)
VALUES (10, TO_DATE('2023-07-18', 'YYYY-MM-DD'), TO_DATE('2023-08-18', 'YYYY-MM-DD'));
cimiento)
VALUES ('2023-07-18', '2023-08-18');

----tb_Marca----
INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Coca-Cola');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Kellogg\'s');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Nestlé');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Pepsi');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Johnson & Johnson');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Procter & Gamble');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Kraft Heinz');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Unilever');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('General Mills');

INSERT INTO tb_Marca (nombre_Marca)
VALUES ('Campbell\'s');

----tb_Categoria----
INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Bebidas', 'Refrescos, zumos y bebidas diversas');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Carnes', 'Carnes frescas y procesadas');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Lácteos', 'Productos lácteos y derivados');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Panadería', 'Productos de panadería y repostería');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Frutas y Verduras', 'Frutas, verduras y hortalizas frescas');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Cereales y Pastas', 'Cereales, pastas y productos de grano');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Cuidado Personal', 'Productos de cuidado personal y belleza');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Limpieza del Hogar', 'Productos de limpieza y artículos para el hogar');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Snacks', 'Aperitivos, chips y snacks');

INSERT INTO tb_Categoria (nombre_Categoria, descripcion)
VALUES ('Productos Congelados', 'Alimentos y platos congelados');


----tb_Direccion----
INSERT INTO tb_direccion (id_Direccion, Provincia, Otras_senas, Canton, Distrito)
VALUES (1, 1, 'Centro', 1, 1);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (1, 'Calle Principal, Casa 123', 1, 1);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (2, 'Avenida Central, Apartamento 456', 2, 2);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (1, 'Plaza Mayor, Piso 3', 1, 3);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (3, 'Calle de la Montaña, Casa 789', 3, 4);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (2, 'Boulevard del Río, Bloque D', 2, 5);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (3, 'Camino Real, Chalet 10', 3, 6);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (1, 'Paseo del Parque, Número 25', 1, 7);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (2, 'Calle de los Artistas, Local 7', 2, 8);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (1, 'Avenida del Sol, Casa 15', 1, 9);

INSERT INTO tb_Direccion (Provincia, Otras_senas, Canton, Distrito)
VALUES (3, 'Calle del Bosque, Casa 30', 3, 10);

----tb_usuario_rol----
INSERT INTO tb_usuario_rol (id_usuario_Rol, nombre_Rol, descripcion_Rol)
VALUES(1, 'Administrador', 'n');

INSERT INTO tb_usuario_rol (id_usuario_Rol, nombre_Rol, descripcion_Rol)
VALUES(2, 'Bodeguero', 'n');

INSERT INTO tb_usuario_rol (id_usuario_Rol, nombre_Rol, descripcion_Rol)
VALUES(3, 'Vendedor', 'n');

----tb_Proveedor----
INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Smith', 123456789, 'proveedorsmith@example.com', 12345678, 1, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Johnson', 987654321, 'proveedorjohnson@example.com', 87654321, 2, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor García', 555555555, 'proveedorgarcia@example.com', 55555555, 3, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Wang', 777777777, 'proveedorwang@example.com', 77777777, 4, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Patel', 999999999, 'proveedorpatel@example.com', 99999999, 5, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor López', 111111111, 'proveedorlopez@example.com', 11111111, 6, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Müller', 222222222, 'proveedormuller@example.com', 22222222, 7, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Kim', 333333333, 'proveedorkim@example.com', 33333333, 8, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Patel', 444444444, 'proveedorpatel2@example.com', 44444444, 9, 1);

INSERT INTO tb_Proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado)
VALUES ('Proveedor Rossi', 666666666, 'proveedorrossi@example.com', 66666666, 10, 1);


----tb_Producto----
INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Leche entera', 100, 2.99, 'Leche fresca y nutritiva', 1, 11, 1, 1);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Pan integral', 150, 1.49, 'Pan de trigo integral', 2, 12, 2, 2);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Manzanas', 200, 0.75, 'Manzanas frescas y crujientes', 3, 13, 3, 3);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Yogur natural', 80, 1.25, 'Yogur cremoso y sin azúcar', 4, 14, 4, 4);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Arroz integral', 120, 2.49, 'Arroz de grano largo y nutritivo', 5, 15, 2, 5);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Pasta de trigo', 90, 1.99, 'Pasta de trigo durum de alta calidad', 1, 16, 3, 6);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Aceite de oliva extra virgen', 50, 5.99, 'Aceite de oliva prensado en frío', 2, 17, 1, 7);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Jabón líquido para manos', 70, 3.49, 'Jabón suave con aloe vera', 3, 18, 2, 8);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Cereal de avena', 110, 2.75, 'Cereal de avena integral con frutas secas', 4, 19, 3, 9);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Papel higiénico', 40, 0.99, 'Rollo de papel higiénico suave y absorbente', 5, 20, 1, 10);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Galletas de chocolate', 200, 1.99, 'Deliciosas galletas con chips de chocolate', 1, 11, 1, 1);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Cerveza Lager', 300, 3.49, 'Cerveza lager refrescante y ligera', 2, 12, 2, 2);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Pasta dental blanqueadora', 150, 4.99, 'Pasta dental para un blanqueamiento eficaz', 3, 13, 3, 3);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Atún enlatado', 120, 1.79, 'Atún enlatado en agua, rico en proteínas', 4, 14, 4, 4);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Detergente líquido', 250, 2.49, 'Detergente concentrado para ropa', 5, 15, 5, 5);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Café en grano', 80, 7.99, 'Café arábica tostado, perfecto para espresso', 1, 16, 6, 6);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Champú revitalizante', 180, 6.49, 'Champú para cabello saludable y brillante', 2, 17, 7, 7);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Pasta de tomate', 100, 0.99, 'Pasta de tomate concentrada para cocinar', 3, 18, 8, 8);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Yogur de frutas', 130, 1.49, 'Yogur con trozos de frutas, sin conservantes', 4, 19, 9, 9);

INSERT INTO tb_Producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
VALUES ('Cepillo de dientes eléctrico', 70, 12.99, 'Cepillo eléctrico para una limpieza superior', 5, 20, 10, 10);


----tb_Cliente----
INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (123456789, 'Ana', 'García', 'López', 'ana@example.com', 12345678, 1, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (987654321, 'Juan', 'Martínez', 'Pérez', 'juan@example.com', 87654321, 2, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (555555555, 'María', 'Rodríguez', 'Hernández', 'maria@example.com', 55555555, 3, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (777777777, 'Carlos', 'López', 'González', 'carlos@example.com', 77777777, 4, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (999999999, 'Sofía', 'Fernández', 'Martínez', 'sofia@example.com', 99999999, 5, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (111111111, 'Pedro', 'Pérez', 'Gutiérrez', 'pedro@example.com', 11111111, 6, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (222222222, 'Luisa', 'Díaz', 'Sánchez', 'luisa@example.com', 22222222, 7, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (333333333, 'Javier', 'Ramírez', 'López', 'javier@example.com', 33333333, 8, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (444444444, 'Carmen', 'González', 'Martínez', 'carmen@example.com', 44444444, 9, 1);

INSERT INTO tb_Cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado)
VALUES (666666666, 'Alejandro', 'Hernández', 'Pérez', 'alejandro@example.com', 66666666, 10, 1);


----tb_Empleado----
INSERT INTO tb_empleado (id_Empleado, Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES (1, 'Melanie', 'Picado', 'Mora', 'melaniepicado30@gmail.com', '86242591', 45678678, '3025', 118830750, TO_DATE('2003-08-30', 'YYYY-MM-DD'), 4567, 1, 1, 1);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Carlos', 'González', 'López', 'carlos@example.com', '12345678', 2500, 'contrasena123', 123456789, '1990-05-15', 40, 1, 1, 1);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('María', 'Martínez', 'Pérez', 'maria@example.com', '98765432', 2800, 'contrasena456', 987654321, '1988-08-20', 35, 2, 1, 2);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Javier', 'Ramírez', 'Sánchez', 'javier@example.com', '55555555', 2300, 'contrasena789', 555555555, '1995-01-10', 30, 3, 1, 3);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Ana', 'García', 'López', 'ana@example.com', '77777777', 2700, 'contrasena012', 777777777, '1992-07-25', 35, 4, 1, 1);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Pedro', 'Fernández', 'Martínez', 'pedro@example.com', '99999999', 2600, 'contrasena345', 999999999, '1993-04-03', 30, 5, 1, 2);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Luisa', 'Díaz', 'Sánchez', 'luisa@example.com', '11111111', 2400, 'contrasena678', 111111111, '1994-11-18', 40, 6, 1, 3);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Andrés', 'Hernández', 'Gutiérrez', 'andres@example.com', '22222222', 2200, 'contrasena901', 222222222, '1996-02-05', 35, 7, 1, 1);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Elena', 'López', 'González', 'elena@example.com', '33333333', 2500, 'contrasena234', 333333333, '1991-09-30', 30, 8, 1, 2);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Miguel', 'Pérez', 'Hernández', 'miguel@example.com', '44444444', 2700, 'contrasena567', 444444444, '1990-12-12', 35, 9, 1, 3);

INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES ('Laura', 'García', 'Martínez', 'laura@example.com', '66666666', 2300, 'contrasena890', 666666666, '1995-06-08', 40, 10, 1, 1);

---------------------------------------Indices y claves primarias-----------------------------------------------  
--
-- Claves primarias de las tablas
--

-- tb_canton
ALTER TABLE tb_canton
ADD CONSTRAINT pk_canton PRIMARY KEY (id_Canton);

-- tb_categoria
ALTER TABLE tb_categoria
ADD CONSTRAINT pk_categoria PRIMARY KEY (id_Categoria);

-- tb_cliente
ALTER TABLE tb_cliente
ADD CONSTRAINT pk_cliente PRIMARY KEY (idCliente);

-- tb_compra
ALTER TABLE tb_compra
ADD CONSTRAINT pk_compra PRIMARY KEY (id_Compra);

-- tb_detalle_compra
ALTER TABLE tb_detalle_compra
ADD CONSTRAINT pk_detalle_compra PRIMARY KEY (id_detalle_Compra);

-- tb_detalle_factura
ALTER TABLE tb_detalle_factura
ADD CONSTRAINT pk_detalle_factura PRIMARY KEY (id_detalleFactura);

-- tb_direccion
ALTER TABLE tb_direccion
ADD CONSTRAINT pk_direccion PRIMARY KEY (id_Direccion);

-- tb_distrito
ALTER TABLE tb_distrito
ADD CONSTRAINT pk_distrito PRIMARY KEY (id_Distrito);

-- tb_empleado
ALTER TABLE tb_empleado
ADD CONSTRAINT pk_empleado PRIMARY KEY (id_Empleado);

-- tb_factura
ALTER TABLE tb_factura
ADD CONSTRAINT pk_factura PRIMARY KEY (id_Factura);

-- tb_lote
ALTER TABLE tb_lote
ADD CONSTRAINT pk_lote PRIMARY KEY (id_Lote);

-- tb_marca
ALTER TABLE tb_marca
ADD CONSTRAINT pk_marca PRIMARY KEY (id_Marca);

-- tb_producto
ALTER TABLE tb_producto
ADD CONSTRAINT pk_producto PRIMARY KEY (id_Producto);

-- tb_proveedor
ALTER TABLE tb_proveedor
ADD CONSTRAINT pk_proveedor PRIMARY KEY (id_Proveedor);

-- tb_provincia
ALTER TABLE tb_provincia
ADD CONSTRAINT pk_provincia PRIMARY KEY (id_Provincia);

-- tb_usuario_rol
ALTER TABLE tb_usuario_rol
ADD CONSTRAINT pk_usuario_rol PRIMARY KEY (id_usuario_Rol);

--
-- Claves foráneas de las tablas
--

-- tb_canton
ALTER TABLE tb_canton
ADD CONSTRAINT fk_canton_provincia FOREIGN KEY (id_Provincia)
REFERENCES tb_provincia (id_Provincia);

-- tb_cliente
ALTER TABLE tb_cliente
ADD CONSTRAINT fk_cliente_direccion FOREIGN KEY (id_Direccion) REFERENCES tb_direccion (id_Direccion);

-- tb_compra**
ALTER TABLE tb_compra
ADD CONSTRAINT fk_compra_cliente FOREIGN KEY (idCliente) REFERENCES tb_cliente (idCliente);

ALTER TABLE tb_compra
ADD CONSTRAINT fk_compra_empleado FOREIGN KEY (id_Empleado) REFERENCES tb_empleado (id_Empleado);

-- tb_detalle_compra****
CREATE INDEX idx_detalle_compra_producto ON tb_detalle_compra (id_Producto);
CREATE INDEX idx_detalle_compra_compra ON tb_detalle_compra (id_Compra);

-- tb_detalle_factura
CREATE INDEX idx_detalle_factura_producto ON tb_detalle_factura (id_Producto);
CREATE INDEX idx_detalle_factura_factura ON tb_detalle_factura (id_Factura);

-- tb_direccion
ALTER TABLE tb_direccion
ADD CONSTRAINT fk_direccion_provincia FOREIGN KEY (Provincia) REFERENCES tb_provincia (id_Provincia);

ALTER TABLE tb_direccion
ADD CONSTRAINT fk_direccion_canton FOREIGN KEY (Canton) REFERENCES tb_canton (id_Canton);

ALTER TABLE tb_direccion
ADD CONSTRAINT fk_direccion_distrito FOREIGN KEY (Distrito) REFERENCES tb_distrito (id_Distrito);

-- tb_distrito*****
ALTER TABLE tb_distrito
ADD CONSTRAINT fk_distrito_canton FOREIGN KEY (id_Canton) REFERENCES tb_canton (id_Canton);

-- tb_empleado**
ALTER TABLE tb_empleado
ADD CONSTRAINT fk_empleado_direccion FOREIGN KEY (id_Direccion) REFERENCES tb_direccion(id_Direccion);

ALTER TABLE tb_empleado
ADD CONSTRAINT fk_empleado_usuario_rol FOREIGN KEY (id_usuario_Rol) REFERENCES tb_usuario_Rol(id_usuario_Rol);

-- tb_factura
ALTER TABLE tb_factura
ADD CONSTRAINT fk_factura_cliente FOREIGN KEY (idCliente) REFERENCES tb_cliente(idCliente);

ALTER TABLE tb_factura
ADD CONSTRAINT fk_factura_empleado FOREIGN KEY (id_Empleado) REFERENCES tb_empleado(id_Empleado);

-- tb_producto


CREATE INDEX idx_producto_lote ON tb_producto (id_Lote);

CREATE INDEX idx_producto_marca ON tb_producto (id_Marca);

CREATE INDEX idx_producto_categoria ON tb_producto (id_Categoria);

CREATE INDEX idx_producto_proveedor ON tb_producto (id_Proveedor);

-- tb_proveedor
CREATE INDEX idx_proveedor_direccion ON tb_proveedor (id_Direccion);
   

----------------------------------------------Procedimientos---------------------------------------------------
-- Procedimiento: ActivarCliente
CREATE OR REPLACE PROCEDURE ActivarCliente (pIdCliente IN NUMBER) AS
BEGIN
  UPDATE tb_cliente SET estado = 1 WHERE idCliente = pIdCliente;
  COMMIT; -- Asegura que los cambios se confirmen
END;
/

-- Procedimiento: ActivarEmpleado
CREATE OR REPLACE PROCEDURE ActivarEmpleado (pIdEmpleado IN NUMBER) AS
BEGIN
  UPDATE tb_empleado SET estado = 1 WHERE id_Empleado = pIdEmpleado;
  COMMIT;
END;
/

-- Procedimiento: ActivarProveedor
CREATE OR REPLACE PROCEDURE ActivarProveedor (pIdProveedor IN NUMBER) AS
BEGIN
  UPDATE tb_proveedor SET estado = 1 WHERE id_Proveedor = pIdProveedor;
  COMMIT;
END;
/

-- Procedimiento: ActualizarCliente
CREATE OR REPLACE PROCEDURE ActualizarCliente (
  pIdClientein IN NUMBER,
  pCorreoElectronico IN VARCHAR2,
  pIdentificacion IN NUMBER,
  pNombre IN VARCHAR2,
  pPrimerApellido IN VARCHAR2,
  pSegundoApellido IN VARCHAR2,
  pTelefono IN NUMBER,
  pProvincia IN NUMBER,
  pCanton IN NUMBER,
  pDistrito IN NUMBER,
  pOtrasSenales IN VARCHAR2
) AS
BEGIN
  IF pProvincia != 0 THEN
    UPDATE tb_direccion
    SET Provincia = pProvincia, Otras_senas = pOtrasSenales, Canton = pCanton, Distrito = pDistrito
    WHERE id_Direccion = (SELECT id_Direccion FROM tb_cliente WHERE idCliente = pIdClientein);
  END IF;
  
  UPDATE tb_cliente
  SET identificacion = pIdentificacion, Nombre = pNombre, PrimerApellido = pPrimerApellido,
      SegundApellido = pSegundoApellido, Correo = pCorreoElectronico, telefono = pTelefono
  WHERE idCliente = pIdClientein;
  
  COMMIT;
END;
/
-- Procedimiento: ActualizarEmpleado
CREATE OR REPLACE PROCEDURE ActualizarEmpleado (
  pIdEmpleado         IN tb_empleado.id_Empleado%TYPE,
  pCorreoElectronico  IN tb_empleado.correo%TYPE,
  pIdentificacion     IN tb_empleado.num_identificacion%TYPE, -- Cambiado a "num_identificacion"
  pNombre             IN tb_empleado.Nombre%TYPE,
  pPrimerApellido     IN tb_empleado.PrimerApellido%TYPE,
  pSegundoApellido    IN tb_empleado.SegundoApellido%TYPE,
  pSalario            IN tb_empleado.Salario%TYPE,
  pFechaNacimiento    IN tb_empleado.fecha_Nacimiento%TYPE,
  pHorasLaborar       IN tb_empleado.horas_labor%TYPE,
  pTelefono           IN tb_empleado.telefono%TYPE,
  pProvincia          IN tb_direccion.Provincia%TYPE,
  pCanton             IN tb_direccion.Canton%TYPE,
  pDistrito           IN tb_direccion.Distrito%TYPE,
  pOtrasSenales       IN tb_direccion.Otras_senas%TYPE,
  pContrasenna        IN tb_empleado.contrasena%TYPE,
  pRol                IN tb_empleado.id_usuario_Rol%TYPE
)
IS
  direccion_id tb_empleado.id_Direccion%TYPE;
BEGIN
  IF pProvincia != 0 THEN
    SELECT id_Direccion INTO direccion_id FROM tb_empleado WHERE id_Empleado = pIdEmpleado;
    UPDATE tb_direccion
    SET Provincia = pProvincia, Otras_senas = pOtrasSenales, Canton = pCanton, Distrito = pDistrito
    WHERE id_Direccion = direccion_id;
  END IF;

  IF pContrasenna IS NOT NULL THEN
    UPDATE tb_empleado SET contrasena = pContrasenna WHERE id_Empleado = pIdEmpleado;
  END IF;

  IF pRol != 0 THEN
    UPDATE tb_empleado SET id_usuario_Rol = pRol WHERE id_Empleado = pIdEmpleado;
  END IF;

  UPDATE tb_empleado
  SET Nombre = pNombre,
      PrimerApellido = pPrimerApellido,
      SegundoApellido = pSegundoApellido,
      correo = pCorreoElectronico,
      telefono = pTelefono,
      Salario = pSalario,
      fecha_Nacimiento = pFechaNacimiento,
      horas_labor = pHorasLaborar
  WHERE id_Empleado = pIdEmpleado;
  
  COMMIT; -- Asegura que los cambios se confirmen
END;
/
-- Procedimiento: ActualizarProducto
CREATE OR REPLACE PROCEDURE ActualizarProducto (
    pidProducto IN INT,
    pNombre IN VARCHAR2,
    pCantidad IN INT,
    pPrecio IN NUMBER,
    pDescripcionProducto IN VARCHAR2,
    pProveedor IN INT
)
IS
BEGIN
    UPDATE tb_Producto
    SET cantidad_Disponible = pCantidad,
        precio_Venta = pPrecio,
        descripcion = pDescripcionProducto,
        id_Proveedor = pProveedor
    WHERE id_Producto = pidProducto;
END;
/
CREATE OR REPLACE PROCEDURE BuscarDatosCliente (
    pIdentificacion IN INT,
    pCliente OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN pCliente FOR
    SELECT c.*, d.*, p.*, ca.*, di.*
    FROM tb_Cliente c
    INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
    INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
    INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
    INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    WHERE c.identificacion = pIdentificacion;
END;
-- Procedimiento: ActualizarProveedor
CREATE OR REPLACE PROCEDURE ActualizarProveedor(
  pIdProveedor IN NUMBER,
  pCorreoElectronico IN VARCHAR2,
  pIdentificacion IN NUMBER,
  pNombre IN VARCHAR2,
  pTelefono IN NUMBER,
  pProvincia IN NUMBER,
  pCanton IN NUMBER,
  pDistrito IN NUMBER,
  pOtrasSenales IN VARCHAR2
)
IS
  direccion_id NUMBER;
BEGIN
  IF (pProvincia != 0) THEN
    SELECT id_Direccion INTO direccion_id
    FROM tb_proveedor
    WHERE id_Proveedor = pIdProveedor;

    UPDATE tb_direccion
    SET Provincia = pProvincia,
        Otras_senas = pOtrasSenales,
        Canton = pCanton,
        Distrito = pDistrito
    WHERE id_Direccion = direccion_id;
  END IF;

  UPDATE tb_proveedor
  SET identificacion = pIdentificacion,
      nombreProveedor = pNombre,
      correo = pCorreoElectronico,
      telefono = pTelefono
  WHERE id_Proveedor = pIdProveedor;
END;
-- Procedimiento: AgregarProducto
CREATE OR REPLACE PROCEDURE AgregarProducto(
  pidProducto IN NUMBER,
  pidFactura IN NUMBER,
  pCantidadProducto IN NUMBER
)
IS
  item_exists NUMBER;
BEGIN
  SELECT 1 INTO item_exists
  FROM tb_detalle_Factura
  WHERE pidProducto = id_Producto AND id_Factura = pidFactura;

  IF item_exists = 1 THEN
    UPDATE tb_Producto
    SET cantidad_Disponible = cantidad_Disponible - pCantidadProducto
    WHERE pidProducto = id_Producto;

    UPDATE tb_detalle_Factura
    SET cantidad_Venta = cantidad_Venta + pCantidadProducto
    WHERE pidProducto = id_Producto AND id_Factura = pidFactura;
  ELSE
    INSERT INTO tb_detalle_Factura(cantidad_Venta, id_Producto, id_Factura)
    VALUES (pCantidadProducto, pidProducto, pidFactura);

    UPDATE tb_Producto
    SET cantidad_Disponible = cantidad_Disponible - pCantidadProducto
    WHERE pidProducto = id_Producto;
  END IF;
END;
/
-- Procedimiento: BuscarProducto
CREATE OR REPLACE PROCEDURE BuscarProducto (
    pNombre IN VARCHAR2
)
IS
    -- Declare a cursor to hold the query result
    CURSOR product_cursor IS
        SELECT id_Producto, nombre_Producto, cantidad_Disponible, precio_Venta
        FROM tb_Producto
        WHERE nombre_Producto = pNombre;
        
    -- Declare variables to store the fetched data
    -- Replace the data types with appropriate ones for your columns
    vId_Producto tb_Producto.id_Producto%TYPE;
    vNombre_Producto tb_Producto.nombre_Producto%TYPE;
    vCantidad_Disponible tb_Producto.cantidad_Disponible%TYPE;
    vPrecio_Venta tb_Producto.precio_Venta%TYPE;
BEGIN
    IF pNombre IS NULL OR pNombre = '' THEN
        -- Fetch all products if the input pNombre is null or empty
        OPEN product_cursor;
    ELSE
        -- Fetch products with the specified name
        OPEN product_cursor;
    END IF;

    -- You can use the fetched data as needed in the rest of the procedure.
    -- For example, you can process the data, insert it into another table, etc.
    
    -- Close the cursor after processing the data
    CLOSE product_cursor;
END;
-- Procedimiento: CrearFactura
CREATE OR REPLACE PROCEDURE CrearFactura (
    pidCliente IN INT,
    pidEmpleado IN INT,
    pidFactura OUT INT
)
IS
BEGIN
    INSERT INTO tb_Factura(fecha_Factura, idCliente, id_Empleado) 
    VALUES (SYSDATE, pidCliente, pidEmpleado)
    RETURNING id_Factura INTO pidFactura;
END;
/
CREATE OR REPLACE PROCEDURE EliminarCliente (
    pIdCliente IN INT
)
IS
BEGIN
    UPDATE tb_cliente SET estado = 0 WHERE idCliente = pIdCliente;
END;
/
-- Procedimiento: EliminarProveedor
CREATE OR REPLACE PROCEDURE EliminarProveedor (
    pIdProveedor IN INT
)
IS
BEGIN
    UPDATE tb_proveedor SET estado = 0 WHERE id_Proveedor = pIdProveedor;
END;
/

CREATE OR REPLACE PROCEDURE EliminarEmpleado (
    pIdEmpleado IN INT
)
IS
BEGIN
    UPDATE tb_empleado SET estado = 0 WHERE id_Empleado = pIdEmpleado;
END;
/

-- Procedimiento: EliminarFactura
CREATE OR REPLACE PROCEDURE EliminarFactura (pidFactura IN NUMBER) AS
BEGIN
  -- Insertar los datos de la factura a eliminar en la tabla tb_compra
  INSERT INTO tb_compra (id_Compra, fecha_Factura, idCliente, id_Empleado)
  SELECT id_Factura, fecha_Factura, idCliente, id_Empleado
  FROM tb_factura
  WHERE id_Factura = pidFactura;
  
  -- Insertar los detalles de la factura a eliminar en la tabla tb_detalle_compra
  INSERT INTO tb_detalle_compra (id_detalle_Compra, cantidad_Venta, id_Producto, id_Compra)
  SELECT id_detalleFactura, cantidad_Venta, id_Producto, id_Factura
  FROM tb_detalle_factura
  WHERE id_Factura = pidFactura;

  -- Eliminar los detalles de la factura de la tabla tb_detalle_Factura
  DELETE FROM tb_detalle_Factura WHERE id_Factura = pidFactura;
  
  -- Eliminar la factura de la tabla tb_Factura
  DELETE FROM tb_Factura WHERE id_Factura = pidFactura;
END;
/


-- Procedimiento: EliminarProducto
CREATE OR REPLACE PROCEDURE EliminarProducto (pidProducto IN NUMBER, pidFactura IN NUMBER, pCantidadProducto IN NUMBER) AS
BEGIN
  UPDATE tb_Producto
  SET cantidad_Disponible = cantidad_Disponible + pCantidadProducto
  WHERE id_Producto = pidProducto;
  
  DELETE FROM tb_detalle_Factura
  WHERE pidProducto = pidProducto AND id_Factura = pidFactura;
END;
/
-- Procedimiento: InsertarCliente
CREATE OR REPLACE PROCEDURE InsertarCliente (
  pCorreoElectronico IN VARCHAR2,
  pIdentificacion IN NUMBER,
  pNombre IN VARCHAR2,
  pPrimerApellido IN VARCHAR2,
  pSegundoApellido IN VARCHAR2,
  pTelefono IN NUMBER,
  pProvincia IN NUMBER,
  pCanton IN NUMBER,
  pDistrito IN NUMBER,
  pOtrasSenales IN VARCHAR2
) AS
  id_Direccion NUMBER;
BEGIN
  INSERT INTO tb_direccion (Provincia, Otras_senas, Canton, Distrito)
  VALUES (pProvincia, pOtrasSenales, pCanton, pDistrito);
  
  id_Direccion := seq_direccion_id.CURRVAL;
  
  INSERT INTO tb_cliente (identificacion, Nombre, PrimerApellido, SegundApellido, Correo, telefono, id_Direccion, estado) 
  VALUES (pIdentificacion, pNombre, pPrimerApellido, pSegundoApellido, pCorreoElectronico, pTelefono, id_Direccion, 1);
END;
/
-- Procedimiento: InsertarEmpleado
CREATE OR REPLACE PROCEDURE InsertarEmpleado (
  pCorreoElectronico IN VARCHAR2,
  pIdentificacion IN NUMBER,
  pNombre IN VARCHAR2,
  pPrimerApellido IN VARCHAR2,
  pSegundoApellido IN VARCHAR2,
  pSalario IN NUMBER,
  pFechaNacimiento IN DATE,
  pHorasLaborar IN NUMBER,
  pTelefono IN NUMBER,
  pProvincia IN NUMBER,
  pCanton IN NUMBER,
  pDistrito IN NUMBER,
  pOtrasSenales IN VARCHAR2,
  pContrasenna IN VARCHAR2,
  pRol IN NUMBER
) AS
  id_Direccion NUMBER;
BEGIN
  INSERT INTO tb_direccion (Provincia, Otras_senas, Canton, Distrito)
  VALUES (pProvincia, pOtrasSenales, pCanton, pDistrito);
  
  id_Direccion := seq_direccion_id.CURRVAL;
  
  INSERT INTO tb_Empleado (Nombre, PrimerApellido, SegundoApellido, correo, telefono,
    Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
  VALUES (pNombre, pPrimerApellido, pSegundoApellido, pCorreoElectronico, pTelefono, 
    pSalario, pContrasenna, pIdentificacion, pFechaNacimiento, pHorasLaborar, id_Direccion, 1, pRol);
END;
/

-- Procedimiento: InsertarProducto
CREATE OR REPLACE PROCEDURE InsertarProducto (
  pNombre IN VARCHAR2,
  pCantidad IN NUMBER,
  pPrecio IN NUMBER,
  pDescripcionProducto IN VARCHAR2,
  pFechaProduccion IN DATE,
  pFechaVencimiento IN DATE,
  pMarca IN VARCHAR2,
  pCategoria IN VARCHAR2,
  pdescripcionCategoria IN VARCHAR2,
  pProveedor IN NUMBER
) AS
  id_Lote NUMBER;
  id_Marca NUMBER;
  id_Categoria NUMBER;
BEGIN
  INSERT INTO tb_lote (Fecha_Produccion, Fecha_Vencimiento)
  VALUES (pFechaProduccion, pFechaVencimiento);
  
  id_Lote := seq_lote_id.CURRVAL;
  
  INSERT INTO tb_marca (nombre_Marca)
  VALUES (pMarca);
  
  id_Marca := seq_marca_id.CURRVAL;
  
  INSERT INTO tb_categoria (nombre_Categoria, descripcion)
  VALUES (pCategoria, pdescripcionCategoria);
  
  id_Categoria := seq_categoria_id.CURRVAL;
  
  INSERT INTO tb_producto (nombre_Producto, cantidad_Disponible, precio_Venta, descripcion, id_Lote, id_Marca, id_Categoria, id_Proveedor)
  VALUES (pNombre, pCantidad, pPrecio, pDescripcionProducto, id_Lote, id_Marca, id_Categoria, pProveedor);
END;
/
-- Procedimiento: InsertarProveedor
CREATE OR REPLACE PROCEDURE InsertarProveedor (
    pCorreoElectronico IN VARCHAR2,
    pIdentificacion IN NUMBER,
    pNombre IN VARCHAR2,
    pTelefono IN NUMBER,
    pProvincia IN NUMBER,
    pCanton IN NUMBER,
    pDistrito IN NUMBER,
    pOtrasSenales IN VARCHAR2
) AS
    id_Direccion NUMBER;
BEGIN
    INSERT INTO tb_direccion (Provincia, Otras_senas, Canton, Distrito)
    VALUES (pProvincia, pOtrasSenales, pCanton, pDistrito)
    RETURNING id_Direccion INTO id_Direccion;

    INSERT INTO tb_proveedor (nombreProveedor, identificacion, correo, telefono, id_Direccion, estado) 
    VALUES (pNombre, pIdentificacion, pCorreoElectronico, pTelefono, id_Direccion, 1);
END;
/
-- Procedimiento: obtenerCanton
CREATE OR REPLACE PROCEDURE obtenerCanton (pProvincia IN NUMBER)
AS
BEGIN
    -- Use a cursor to fetch the results of the SELECT query
    FOR canton_rec IN (SELECT id_Canton, Canton
                       FROM tb_canton
                       WHERE id_Provincia = pProvincia)
    LOOP
        -- This loop will iterate over the result set but won't do anything with the data.
        -- If you don't want to display or process the data, you can leave this loop empty.
        -- If the loop is empty, you can remove it entirely.

        -- You can perform any additional logic or processing here if needed.
        -- For example, you can do something with each record in the loop, or just leave the loop empty.
        NULL;
    END LOOP;
END;
/
-- Procedimiento: obtenerDistrito
CREATE OR REPLACE PROCEDURE obtenerDistrito (
    pCanton IN NUMBER,
    oId_Distrito OUT tb_distrito.id_Distrito%TYPE,
    oDistrito OUT tb_distrito.Distrito%TYPE
)
AS
BEGIN
    SELECT id_Distrito, Distrito
    INTO oId_Distrito, oDistrito
    FROM tb_distrito
    WHERE id_Canton = pCanton;
END;
/
-- Procedimiento: obtenerRol
CREATE OR REPLACE PROCEDURE obtenerRol (
    oId_Rol OUT tb_usuario_rol.id_usuario_Rol%TYPE,
    oNombre_Rol OUT tb_usuario_rol.nombre_rol%TYPE
)
AS
BEGIN
    SELECT id_usuario_Rol, nombre_rol
    INTO oId_Rol, oNombre_Rol
    FROM tb_usuario_rol;
END;
/
-- Procedimiento: ValidacionSesion
CREATE OR REPLACE PROCEDURE ValidacionSesion (
    pCorreo IN VARCHAR2,
    pContrasena IN NUMBER,
    oId_Empleado OUT tb_empleado.id_Empleado%TYPE,
    oNum_Identificacion OUT tb_empleado.num_identificacion%TYPE,
    oCorreo OUT tb_empleado.correo%TYPE,
    oEstado OUT tb_empleado.estado%TYPE,
    oId_Rol OUT tb_empleado.id_usuario_Rol%TYPE,
    oNombre_Rol OUT tb_usuario_rol.nombre_rol%TYPE
)
AS
BEGIN
    SELECT id_Empleado, num_identificacion, correo, estado, U.id_usuario_Rol, R.nombre_Rol
    INTO oId_Empleado, oNum_Identificacion, oCorreo, oEstado, oId_Rol, oNombre_Rol
    FROM tb_Empleado U
    INNER JOIN tb_usuario_rol R ON U.id_usuario_Rol = R.id_usuario_Rol
    WHERE correo = pCorreo AND contrasena = pContrasena AND estado = 1;
END;
/
-- Procedimiento: VerCompras
CREATE OR REPLACE PROCEDURE VerCompras AS
BEGIN
    FOR rec IN (SELECT d.id_Compra, d.fecha_Factura, c.Nombre as Cliente, e.Nombre as Empleado
                FROM tb_compra d
                INNER JOIN tb_cliente c ON d.idCliente = c.idCliente
                INNER JOIN tb_empleado e ON d.id_Empleado = e.id_Empleado)
    LOOP
        DBMS_OUTPUT.PUT_LINE('ID Compra: ' || rec.id_Compra || ', Fecha: ' || rec.fecha_Factura || ', Cliente: ' || rec.Cliente || ', Empleado: ' || rec.Empleado);
    END LOOP;
END;
/

-- Procedimiento: VerDatosCliente
CREATE OR REPLACE PROCEDURE VerDatosCliente (pIdCliente IN NUMBER) AS
BEGIN
    FOR datos_cliente_rec IN (
        SELECT c.idCliente, c.identificacion, c.Nombre as c_Nombre, c.PrimerApellido as c_PrimerApellido,
               c.SegundApellido as c_SegundApellido, c.Correo as c_Correo, c.telefono as c_telefono,
               c.estado as c_estado,
               d.id_Direccion, d.Provincia as d_Provincia, d.Otras_senas as d_Otras_senas,
               d.Canton as d_Canton, d.Distrito as d_Distrito,
               p.id_Provincia, p.Provincia as p_Provincia,
               ca.id_Canton, ca.Canton as ca_Canton,
               di.id_Distrito, di.Distrito as di_Distrito
        FROM tb_Cliente c
        INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
        INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
        INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
        INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
        WHERE c.idCliente = pIdCliente
    )
    LOOP
        -- You can use the fetched data as needed
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || datos_cliente_rec.c_Nombre || ' ' || datos_cliente_rec.c_PrimerApellido);
        -- You can similarly access other columns using the aliases
    END LOOP;
END;
/

-- Procedimiento: VerDatosEmpleado
CREATE OR REPLACE PROCEDURE VerDatosEmpleado (pIdEmpleado IN NUMBER) AS
BEGIN
    FOR datos_empleado_rec IN (
        SELECT e.id_Empleado, e.Nombre as e_Nombre, e.PrimerApellido as e_PrimerApellido,
               e.SegundoApellido as e_SegundoApellido, e.correo as e_correo, e.telefono as e_telefono,
               e.Salario as e_Salario, e.num_identificacion as e_num_identificacion,
               e.fecha_Nacimiento as e_fecha_Nacimiento, e.horas_labor as e_horas_labor,
               e.estado as e_estado,
               d.id_Direccion, d.Provincia as d_Provincia, d.Otras_senas as d_Otras_senas,
               d.Canton as d_Canton, d.Distrito as d_Distrito,
               p.id_Provincia, p.Provincia as p_Provincia,
               ca.id_Canton, ca.Canton as ca_Canton,
               di.id_Distrito, di.Distrito as di_Distrito,
               r.id_usuario_Rol, r.nombre_Rol as r_nombre_Rol
        FROM tb_empleado e
        INNER JOIN tb_Direccion d ON e.id_Direccion = d.id_Direccion
        INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
        INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
        INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
        INNER JOIN tb_usuario_rol r ON r.id_usuario_Rol = e.id_usuario_Rol
        WHERE e.id_Empleado = pIdEmpleado
    )
    LOOP
        -- You can use the fetched data as needed
        DBMS_OUTPUT.PUT_LINE('Empleado: ' || datos_empleado_rec.e_Nombre || ' ' || datos_empleado_rec.e_PrimerApellido);
        -- You can similarly access other columns using the aliases
    END LOOP;
END;
/

-- Procedimiento: VerDatosEmpleados
CREATE OR REPLACE PROCEDURE VerDatosEmpleados AS
BEGIN
    FOR datos_empleado_rec IN (
        SELECT id_Empleado,
               Nombre,
               PrimerApellido,
               SegundoApellido,
               correo,
               telefono,
               Salario,
               num_identificacion,
               fecha_Nacimiento,
               horas_labor,       
               r.*,
               CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS DescEstado
        FROM tb_empleado c  
        INNER JOIN tb_usuario_rol r ON r.id_usuario_Rol = c.id_usuario_Rol
    )
    LOOP
        -- You can use the fetched data as needed
        DBMS_OUTPUT.PUT_LINE('Empleado: ' || datos_empleado_rec.Nombre || ' ' || datos_empleado_rec.PrimerApellido ||
                             ', Estado: ' || datos_empleado_rec.DescEstado);
    END LOOP;
END;
/
-- Procedimiento: VerDatosProducto
CREATE OR REPLACE PROCEDURE VerDatosProducto (pIdProducto IN NUMBER) AS
    vId_Producto tb_Producto.id_Producto%TYPE;
    vNombre_Producto tb_Producto.nombre_Producto%TYPE;
    vCantidad_Disponible tb_Producto.cantidad_Disponible%TYPE;
    vPrecio_Venta tb_Producto.precio_Venta%TYPE;
    vDescripcion tb_Producto.descripcion%TYPE;
    vFecha_Produccion tb_Lote.Fecha_Produccion%TYPE;
    vFecha_Vencimiento tb_Lote.Fecha_Vencimiento%TYPE;
    vNombre_Marca tb_Marca.nombre_Marca%TYPE;
    vNombre_Categoria tb_Categoria.nombre_Categoria%TYPE;
    vDescripcion_Categoria tb_Categoria.descripcion%TYPE;
    vNombreProveedor tb_Proveedor.nombreProveedor%TYPE;
BEGIN
    SELECT p.id_Producto, p.nombre_Producto, p.cantidad_Disponible, p.precio_Venta, p.descripcion, 
           l.Fecha_Produccion, l.Fecha_Vencimiento, m.nombre_Marca, 
           c.nombre_Categoria, c.descripcion AS descripcion_Categoria, 
           pv.nombreProveedor
    INTO vId_Producto, vNombre_Producto, vCantidad_Disponible, vPrecio_Venta, vDescripcion, 
         vFecha_Produccion, vFecha_Vencimiento, vNombre_Marca, 
         vNombre_Categoria, vDescripcion_Categoria, 
         vNombreProveedor
    FROM tb_Producto p
    INNER JOIN tb_lote l ON p.id_Lote = l.id_Lote
    INNER JOIN tb_marca m ON p.id_Marca = m.id_Marca
    INNER JOIN tb_categoria c ON p.id_Categoria = c.id_Categoria
    INNER JOIN tb_proveedor pv ON p.id_Proveedor = pv.id_Proveedor
    WHERE p.id_Producto = pIdProducto;
    
    -- Aquí podemos utilizar las variables (vId_Producto, vNombre_Producto, etc.) según las necesidades
    -- Por ejemplo,  imprimirlos o utilizarlos en otras operaciones.
END;

-- Procedimiento: VerDatosProducto
CREATE OR REPLACE PROCEDURE VerDatosProductos AS
    vId_Producto tb_Producto.id_Producto%TYPE;
    vNombre_Producto tb_Producto.nombre_Producto%TYPE;
    vCantidad_Disponible tb_Producto.cantidad_Disponible%TYPE;
    vPrecio_Venta tb_Producto.precio_Venta%TYPE;
    vDescripcion tb_Producto.descripcion%TYPE;
    vFecha_Produccion tb_Lote.Fecha_Produccion%TYPE;
    vFecha_Vencimiento tb_Lote.Fecha_Vencimiento%TYPE;
    vNombre_Marca tb_Marca.nombre_Marca%TYPE;
    vNombre_Categoria tb_Categoria.nombre_Categoria%TYPE;
    vDescripcion_Categoria tb_Categoria.descripcion%TYPE;
    vNombreProveedor tb_Proveedor.nombreProveedor%TYPE;
BEGIN
    SELECT p.id_Producto, p.nombre_Producto, p.cantidad_Disponible, p.precio_Venta, p.descripcion, 
           l.Fecha_Produccion, l.Fecha_Vencimiento, m.nombre_Marca, 
           c.nombre_Categoria, c.descripcion AS descripcion_Categoria, 
           pv.nombreProveedor
    INTO vId_Producto, vNombre_Producto, vCantidad_Disponible, vPrecio_Venta, vDescripcion, 
         vFecha_Produccion, vFecha_Vencimiento, vNombre_Marca, 
         vNombre_Categoria, vDescripcion_Categoria, 
         vNombreProveedor
    FROM tb_Producto p
    INNER JOIN tb_lote l ON p.id_Lote = l.id_Lote
    INNER JOIN tb_marca m ON p.id_Marca = m.id_Marca
    INNER JOIN tb_categoria c ON p.id_Categoria = c.id_Categoria
    INNER JOIN tb_proveedor pv ON p.id_Proveedor = pv.id_Proveedor;
    
    --  Aquí podemos utilizar las variables (vId_Producto, vNombre_Producto, etc.) según tus necesidades
    -- Por ejemplo, imprimirlos o utilizarlos en otras operaciones.
END;
-- Procedimiento: VerDatosProveedor
CREATE OR REPLACE PROCEDURE VerDatosProveedor(pIdProveedor IN NUMBER) AS
    vId_Proveedor tb_Proveedor.id_Proveedor%TYPE;
    vNombreProveedor tb_Proveedor.nombreProveedor%TYPE;
    vIdentificacion tb_Proveedor.identificacion%TYPE;
    vCorreoElectronico tb_Proveedor.correo%TYPE;
    vTelefono tb_Proveedor.telefono%TYPE;
    vProvincia tb_Provincia.Provincia%TYPE;
    vCanton tb_Canton.Canton%TYPE;
    vDistrito tb_Distrito.Distrito%TYPE;
    vOtrasSenales tb_Direccion.Otras_senas%TYPE;
BEGIN
    SELECT c.id_Proveedor, c.nombreProveedor, c.identificacion, c.correo, c.telefono,
           d.Provincia, d.Canton, d.Distrito, d.Otras_senas
    INTO vId_Proveedor, vNombreProveedor, vIdentificacion, vCorreoElectronico, vTelefono,
         vProvincia, vCanton, vDistrito, vOtrasSenales
    FROM tb_proveedor c
    INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
    INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
    INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
    INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    WHERE c.id_Proveedor = pIdProveedor;

    -- Aquí podemos utilizar las variables (vId_Proveedor, vNombreProveedor, etc.) según tus necesidades
    -- Por ejemplo,  imprimirlos o utilizarlos en otras operaciones.
END;
/
-- Procedimiento: VerDatosProveedores
CREATE OR REPLACE PROCEDURE VerDatosProveedores AS
BEGIN
    FOR proveedor_rec IN (SELECT id_Proveedor,
                                  nombreProveedor,
                                  identificacion,
                                  correo,
                                  telefono,
                                  CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS DescEstado
                           FROM tb_proveedor)
    LOOP
        DBMS_OUTPUT.PUT_LINE('ID Proveedor: ' || proveedor_rec.id_Proveedor);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || proveedor_rec.nombreProveedor);
        DBMS_OUTPUT.PUT_LINE('Identificación: ' || proveedor_rec.identificacion);
        DBMS_OUTPUT.PUT_LINE('Correo: ' || proveedor_rec.correo);
        DBMS_OUTPUT.PUT_LINE('Teléfono: ' || proveedor_rec.telefono);
        DBMS_OUTPUT.PUT_LINE('Estado: ' || proveedor_rec.DescEstado);
        DBMS_OUTPUT.PUT_LINE('------------------------');
    END LOOP;
END;
/
-- Procedimiento: VerDetalleCompra
CREATE OR REPLACE PROCEDURE VerDetalleCompra(pIdCompra IN NUMBER) AS
BEGIN
    FOR detalle_rec IN (SELECT d.cantidad_Venta, p.nombre_Producto, p.precio_Venta
                        FROM tb_detalle_Compra d
                        INNER JOIN tb_Producto p ON p.id_Producto = d.id_Producto
                        WHERE d.id_Compra = pIdCompra)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Cantidad Venta: ' || detalle_rec.cantidad_Venta);
        DBMS_OUTPUT.PUT_LINE('Nombre Producto: ' || detalle_rec.nombre_Producto);
        DBMS_OUTPUT.PUT_LINE('Precio Venta: ' || detalle_rec.precio_Venta);
        DBMS_OUTPUT.PUT_LINE('------------------------');
    END LOOP;
END;
/

-- Procedimiento: VerDetalleFactura
CREATE OR REPLACE PROCEDURE VerDetalleFactura(pidFactura IN NUMBER) AS
BEGIN
    FOR detalle_rec IN (SELECT p.nombre_Producto, p.precio_Venta, d.cantidad_Venta, d.id_Factura, d.id_Producto
                        FROM tb_detalle_factura d
                        INNER JOIN tb_producto p ON p.id_Producto = d.id_Producto
                        WHERE pidFactura = d.id_Factura)
    LOOP
        DBMS_OUTPUT.PUT_LINE('Nombre Producto: ' || detalle_rec.nombre_Producto);
        DBMS_OUTPUT.PUT_LINE('Precio Venta: ' || detalle_rec.precio_Venta);
        DBMS_OUTPUT.PUT_LINE('Cantidad Venta: ' || detalle_rec.cantidad_Venta);
        DBMS_OUTPUT.PUT_LINE('ID Factura: ' || detalle_rec.id_Factura);
        DBMS_OUTPUT.PUT_LINE('ID Producto: ' || detalle_rec.id_Producto);
        DBMS_OUTPUT.PUT_LINE('------------------------');
    END LOOP;
END;
------------------

CREATE OR REPLACE PACKAGE paquete_super  AS
  -- Procedimiento: ActivarCliente
  PROCEDURE ActivarCliente (pIdCliente IN NUMBER);

  -- Procedimiento: ActivarEmpleado
  PROCEDURE ActivarEmpleado (pIdEmpleado IN NUMBER);

  -- Procedimiento: ActualizarCliente
  PROCEDURE ActualizarCliente (
    pIdClientein IN NUMBER,
    pCorreoElectronico IN VARCHAR2,
    pIdentificacion IN NUMBER,
    pNombre IN VARCHAR2,
    pPrimerApellido IN VARCHAR2,
    pSegundoApellido IN VARCHAR2,
    pTelefono IN NUMBER,
    pProvincia IN NUMBER,
    pCanton IN NUMBER,
    pDistrito IN NUMBER,
    pOtrasSenales IN VARCHAR2
  );

  -- Procedimiento: ActualizarEmpleado
  PROCEDURE ActualizarEmpleado (
    pIdEmpleado         IN tb_empleado.id_Empleado%TYPE,
    pCorreoElectronico  IN tb_empleado.correo%TYPE,
    pIdentificacion     IN tb_empleado.num_identificacion%TYPE,
    pNombre             IN tb_empleado.Nombre%TYPE,
    pPrimerApellido     IN tb_empleado.PrimerApellido%TYPE,
    pSegundoApellido    IN tb_empleado.SegundoApellido%TYPE,
    pSalario            IN tb_empleado.Salario%TYPE,
    pFechaNacimiento    IN tb_empleado.fecha_Nacimiento%TYPE,
    pHorasLaborar       IN tb_empleado.horas_labor%TYPE,
    pTelefono           IN tb_empleado.telefono%TYPE,
    pProvincia          IN tb_direccion.Provincia%TYPE,
    pCanton             IN tb_direccion.Canton%TYPE,
    pDistrito           IN tb_direccion.Distrito%TYPE,
    pOtrasSenales       IN tb_direccion.Otras_senas%TYPE,
    pContrasenna        IN tb_empleado.contrasena%TYPE,
    pRol                IN tb_empleado.id_usuario_Rol%TYPE
  );

  -- Procedimiento: ActualizarProducto
  PROCEDURE ActualizarProducto (
    pidProducto IN INT,
    pNombre IN VARCHAR2,
    pCantidad IN INT,
    pPrecio IN NUMBER,
    pDescripcionProducto IN VARCHAR2,
    pProveedor IN INT
  );

  -- Procedimiento: BuscarDatosCliente
  PROCEDURE BuscarDatosCliente (
    pIdentificacion IN INT,
    pCliente OUT SYS_REFCURSOR
  );

  -- Procedimiento: ActualizarProveedor
  PROCEDURE ActualizarProveedor(
    pIdProveedor IN NUMBER,
    pCorreoElectronico IN VARCHAR2,
    pIdentificacion IN NUMBER,
    pNombre IN VARCHAR2,
    pTelefono IN NUMBER,
    pProvincia IN NUMBER,
    pCanton IN NUMBER,
    pDistrito IN NUMBER,
    pOtrasSenales IN VARCHAR2
  );

  -- Procedimiento: AgregarProducto
  PROCEDURE AgregarProducto(
    pidProducto IN NUMBER,
    pidFactura IN NUMBER,
    pCantidadProducto IN NUMBER
  );

  -- Procedimiento: CrearFactura
  PROCEDURE CrearFactura (
    pidCliente IN INT,
    pidEmpleado IN INT,
    pidFactura OUT INT
  );

  -- Procedimiento: EliminarCliente
  PROCEDURE EliminarCliente (
    pIdCliente IN INT
  );

END paquete_super;