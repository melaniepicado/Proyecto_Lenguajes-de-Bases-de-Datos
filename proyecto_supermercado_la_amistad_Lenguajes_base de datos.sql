CONNECT C##Mlaken3025/302528;
SELECT USER FROM DUAL;
ALTER SESSION SET CURRENT_SCHEMA = Mlaken302528;

CREATE TABLE tb_canton (
  id_Canton NUMBER(11) NOT NULL,
  Canton VARCHAR2(50),
  id_Provincia NUMBER(11),
  CONSTRAINT pk_canton PRIMARY KEY (id_Canton)
);

INSERT INTO tb_canton  VALUES(1, 'San Jose', 1);
INSERT INTO tb_canton  VALUES(2, 'Escazú', 1);
INSERT INTO tb_canton  VALUES(3, 'Desamparados', 1);
INSERT INTO tb_canton  VALUES(4, 'Alajuela', 2);
INSERT INTO tb_canton  VALUES(5, 'Atenas', 2);
INSERT INTO tb_canton  VALUES(6, 'Cartago', 3);
INSERT INTO tb_canton  VALUES(7, 'La Unión', 3);
INSERT INTO tb_canton  VALUES(8, 'Heredia', 4);
INSERT INTO tb_canton  VALUES(9, 'Barva', 4);
INSERT INTO tb_canton  VALUES(10, 'Belén', 4);
INSERT INTO tb_canton  VALUES(11, 'Santa Cruz', 5);
INSERT INTO tb_canton  VALUES(12, 'Esparza', 5);
INSERT INTO tb_canton  VALUES(13, 'Puntarenas', 6);
INSERT INTO tb_canton  VALUES(14, 'Quepos', 6);
INSERT INTO tb_canton  VALUES(15, 'Limón', 7);
INSERT INTO tb_canton  VALUES(16, 'Pococí', 7);
INSERT INTO tb_canton  VALUES(17, 'Siquirres', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE tb_categoria (
  id_Categoria NUMBER(11) NOT NULL,
  nombre_Categoria VARCHAR2(50),
  descripcion VARCHAR2(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cliente`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_compra`
--

CREATE TABLE tb_compra (
  id_Compra NUMBER(11) NOT NULL,
  fecha_Factura DATE DEFAULT NULL,
  idCliente NUMBER(11) DEFAULT NULL,
  id_Empleado NUMBER(11) DEFAULT NULL
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_compra`
--

CREATE TABLE tb_detalle_compra (
  id_detalle_compra NUMBER(11) NOT NULL,
  cantidad_venta NUMBER(11),
  id_producto NUMBER(11),
  id_compra NUMBER(11),
  CONSTRAINT pk_detalle_compra PRIMARY KEY (id_detalle_compra)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_factura`
--

CREATE TABLE tb_detalle_factura (
  id_detalleFactura NUMBER(11) NOT NULL,
  cantidad_Venta NUMBER(11),
  id_Producto NUMBER(11),
  id_Factura NUMBER(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_direccion`
--

CREATE TABLE tb_direccion (
  id_Direccion NUMBER(11) NOT NULL,
  Provincia NUMBER(11),
  Otras_senas VARCHAR2(100),
  Canton NUMBER(11),
  Distrito NUMBER(11)
);

--
-- Volcado de datos para la tabla `tb_direccion`
--

INSERT INTO tb_direccion (id_Direccion, Provincia, Otras_senas, Canton, Distrito)
VALUES (1, 1, 'Centro', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_distrito`
--

CREATE TABLE tb_distrito (
  id_Distrito NUMBER(11) NOT NULL,
  Distrito VARCHAR2(50),
  id_Canton NUMBER(11)
);

--
-- Volcado de datos para la tabla `tb_distrito`
--

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
VALUES(6, 'San Cristóbal', 3);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(7, 'San Josecito', 4);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(8, 'Río Segundo', 4);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(9, 'San Isidro', 5);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(10, 'Barva', 6);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(11, 'San Antonio', 7);
INSERT INTO tb_distrito (id_Distrito, Distrito, id_Canton)
VALUES(12, 'Concepción', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empleado`
--

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

--
-- Volcado de datos para la tabla `tb_empleado`
--

INSERT INTO tb_empleado (id_Empleado, Nombre, PrimerApellido, SegundoApellido, correo, telefono, Salario, contrasena, num_identificacion, fecha_Nacimiento, horas_labor, id_Direccion, estado, id_usuario_Rol)
VALUES (1, 'Melanie', 'Picado', 'Mora', 'melaniepicado30@gmail.com', '86242591', 45678678, '3025', 118830750, TO_DATE('2003-08-30', 'YYYY-MM-DD'), 4567, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_factura`
--

CREATE TABLE tb_factura (
  id_Factura NUMBER(11) NOT NULL,
  fecha_Factura DATE,
  idCliente NUMBER(11),
  id_Empleado NUMBER(11)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_lote`
--

CREATE TABLE tb_lote (
  id_Lote NUMBER(11) NOT NULL,
  Fecha_Produccion DATE,
  Fecha_Vencimiento DATE
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_marca`
--

CREATE TABLE tb_marca (
  id_Marca NUMBER(11) NOT NULL,
  nombre_Marca VARCHAR2(50)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proveedor`
--

CREATE TABLE tb_proveedor (
  id_Proveedor NUMBER(11) NOT NULL,
  nombreProveedor VARCHAR2(50),
  identificacion NUMBER(11),
  correo VARCHAR2(80),
  telefono NUMBER(11),
  id_Direccion NUMBER(11),
  estado NUMBER(1)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_provincia`
--

CREATE TABLE tb_provincia (
  id_Provincia NUMBER(11) NOT NULL,
  Provincia VARCHAR2(50)
);

--
-- Volcado de datos para la tabla `tb_provincia`
--

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
VALUES(7, 'Limón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario_rol`
--

CREATE TABLE tb_usuario_rol (
  id_usuario_Rol NUMBER(11) NOT NULL,
  nombre_Rol VARCHAR2(50),
  descripcion_Rol VARCHAR2(50)
);

--
-- Volcado de datos para la tabla `tb_usuario_rol`
--

INSERT INTO tb_usuario_rol (id_usuario_Rol, nombre_Rol, descripcion_Rol)
VALUES(1, 'Administrador', 'n');
INSERT INTO tb_usuario_rol (id_usuario_Rol, nombre_Rol, descripcion_Rol)
VALUES(2, 'Bodeguero', 'n');
INSERT INTO tb_usuario_rol (id_usuario_Rol, nombre_Rol, descripcion_Rol)
VALUES(3, 'Vendedor', 'n');

--
-- Ã?ndices para tablas volcadas
--

--
-- Indices de la tabla `tb_canton`
--

ALTER TABLE tb_canton
ADD CONSTRAINT pk_canton PRIMARY KEY (id_Canton);

ALTER TABLE tb_canton
ADD CONSTRAINT fk_canton_provincia FOREIGN KEY (id_Provincia)
REFERENCES tb_provincia (id_Provincia);

--
-- Indices de la tabla `tb_categoria`
--

ALTER TABLE tb_categoria
ADD CONSTRAINT pk_categoria PRIMARY KEY (id_Categoria);

--
-- Indices de la tabla `tb_cliente`
--

ALTER TABLE tb_cliente
ADD CONSTRAINT pk_cliente PRIMARY KEY (idCliente);

ALTER TABLE tb_cliente
ADD CONSTRAINT fk_cliente_direccion FOREIGN KEY (id_Direccion) REFERENCES tb_direccion (id_Direccion);

--
-- Indices de la tabla `tb_compra`
--

ALTER TABLE tb_compra
ADD CONSTRAINT pk_compra PRIMARY KEY (id_Compra);

ALTER TABLE tb_compra
ADD CONSTRAINT fk_compra_cliente FOREIGN KEY (idCliente) REFERENCES tb_cliente (idCliente);

ALTER TABLE tb_compra
ADD CONSTRAINT fk_compra_empleado FOREIGN KEY (id_Empleado) REFERENCES tb_empleado (id_Empleado);

--
-- Indices de la tabla `tb_detalle_compra`
--

ALTER TABLE tb_detalle_compra
ADD CONSTRAINT pk_detalle_compra PRIMARY KEY (id_detalle_Compra);
CREATE INDEX idx_detalle_compra_producto ON tb_detalle_compra (id_Producto);
CREATE INDEX idx_detalle_compra_compra ON tb_detalle_compra (id_Compra);

--
-- Indices de la tabla `tb_detalle_factura`
--

ALTER TABLE tb_detalle_factura
ADD CONSTRAINT pk_detalle_factura PRIMARY KEY (id_detalleFactura);
ALTER TABLE tb_detalle_factura
CREATE INDEX idx_detalle_factura_producto ON tb_factura (id_Producto);
CREATE INDEX idx_detalle_factura_factura ON tb_factura (id_Factura);

--
-- Indices de la tabla `tb_direccion`
--

ALTER TABLE tb_direccion
ADD CONSTRAINT pk_direccion PRIMARY KEY (id_Direccion);
ALTER TABLE tb_direccion
ADD CONSTRAINT fk_direccion_provincia FOREIGN KEY (Provincia) REFERENCES tb_provincia (id_Provincia);
ALTER TABLE tb_direccion
ADD CONSTRAINT fk_direccion_canton FOREIGN KEY (Canton) REFERENCES tb_canton (id_Canton);
ALTER TABLE tb_direccion
ADD CONSTRAINT fk_direccion_distrito FOREIGN KEY (Distrito) REFERENCES tb_distrito (id_Distrito);

--
-- Indices de la tabla `tb_distrito`
--

ALTER TABLE tb_distrito
ADD CONSTRAINT pk_distrito PRIMARY KEY (id_Distrito);

ALTER TABLE tb_distrito
ADD CONSTRAINT fk_distrito_canton FOREIGN KEY (id_Canton) REFERENCES tb_canton (id_Canton);

--
-- Indices de la tabla `tb_empleado`
--

ALTER TABLE tb_empleado
ADD CONSTRAINT pk_empleado PRIMARY KEY (id_Empleado);
ALTER TABLE tb_empleado
ADD CONSTRAINT fk_empleado_direccion FOREIGN KEY (id_Direccion) REFERENCES tb_direccion(id_Direccion);
ALTER TABLE tb_empleado
ADD CONSTRAINT fk_empleado_usuario_rol FOREIGN KEY (id_usuario_Rol) REFERENCES tb_usuario_Rol(id_usuario_Rol);

--
-- Indices de la tabla `tb_factura`
--

ALTER TABLE tb_factura
ADD CONSTRAINT pk_factura PRIMARY KEY (id_Factura);
ALTER TABLE tb_factura
ADD CONSTRAINT fk_factura_cliente FOREIGN KEY (idCliente) REFERENCES tb_cliente(idCliente);
ALTER TABLE tb_factura
ADD CONSTRAINT fk_factura_empleado FOREIGN KEY (id_Empleado) REFERENCES tb_empleado(id_Empleado);

--
-- Indices de la tabla `tb_lote`
--

ALTER TABLE tb_lote
ADD CONSTRAINT pk_lote PRIMARY KEY (id_Lote);

--
-- Indices de la tabla `tb_marca`
--

ALTER TABLE tb_proveedor
ADD CONSTRAINT pk_proveedor PRIMARY KEY (id_Proveedor);
CREATE INDEX idx_proveedor_direccion ON tb_proveedor (id_Direccion);

--
-- Indices de la tabla `tb_producto`
--

ALTER TABLE tb_producto
ADD CONSTRAINT pk_producto PRIMARY KEY (id_Producto);

CREATE INDEX idx_producto_lote ON tb_producto (id_Lote);

CREATE INDEX idx_producto_marca ON tb_producto (id_Marca);

CREATE INDEX idx_producto_categoria ON tb_producto (id_Categoria);

CREATE INDEX idx_producto_proveedor ON tb_producto (id_Proveedor);

--
-- Indices de la tabla `tb_proveedor`
--

CREATE INDEX idx_proveedor_direccion ON tb_direccion (id_Direccion);

--
-- Indices de la tabla `tb_provincia`
--

ALTER TABLE tb_provincia
ADD CONSTRAINT pk_provincia PRIMARY KEY (id_Provincia);

--
-- Indices de la tabla `tb_usuario_rol`
--

-- Asumiendo que id_usuario_Rol es la clave primaria en tb_usuario_Rol
ALTER TABLE tb_usuario_Rol
ADD CONSTRAINT pk_usuario_rol PRIMARY KEY (id_usuario_Rol);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_categoria`
--

CREATE SEQUENCE seq_categoria_id
START WITH 1
INCREMENT BY 1;

ALTER TABLE tb_categoria
MODIFY id_Categoria NUMBER;

CREATE OR REPLACE TRIGGER trg_categoria_id
BEFORE INSERT ON tb_categoria
FOR EACH ROW
BEGIN
  :NEW.id_Categoria := seq_categoria_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_cliente`
--
CREATE SEQUENCE seq_cliente_id
START WITH 1
INCREMENT BY 1;

ALTER TABLE tb_cliente
MODIFY idCliente NUMBER;

CREATE OR REPLACE TRIGGER trg_cliente_id
BEFORE INSERT ON tb_cliente
FOR EACH ROW
BEGIN
  :NEW.idCliente := seq_cliente_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_detalle_factura`
--

CREATE SEQUENCE seq_detalle_factura_id
START WITH 1
INCREMENT BY 1;

ALTER TABLE tb_detalle_factura
MODIFY id_detalleFactura NUMBER;

CREATE OR REPLACE TRIGGER trg_detalle_factura_id
BEFORE INSERT ON tb_detalle_factura
FOR EACH ROW
BEGIN
  :NEW.id_detalleFactura := seq_detalle_factura_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_direccion`
--

CREATE SEQUENCE seq_direccion_id
START WITH 2  -- Starting with 2 to match the AUTO_INCREMENT value in MySQL.
INCREMENT BY 1;

ALTER TABLE tb_direccion
MODIFY id_Direccion NUMBER;

CREATE OR REPLACE TRIGGER trg_direccion_id
BEFORE INSERT ON tb_direccion
FOR EACH ROW
BEGIN
  :NEW.id_Direccion := seq_direccion_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_distrito`
--

CREATE SEQUENCE seq_distrito_id
START WITH 13  -- Starting with 13 to match the AUTO_INCREMENT value in MySQL.
INCREMENT BY 1;

ALTER TABLE tb_distrito
MODIFY id_Distrito NUMBER;

CREATE OR REPLACE TRIGGER trg_distrito_id
BEFORE INSERT ON tb_distrito
FOR EACH ROW
BEGIN
  :NEW.id_Distrito := seq_distrito_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_empleado`
--

CREATE SEQUENCE seq_empleado_id
START WITH 3  -- Starting with 3 to match the AUTO_INCREMENT value in MySQL.
INCREMENT BY 1;

ALTER TABLE tb_empleado
MODIFY id_Empleado NUMBER;

CREATE OR REPLACE TRIGGER trg_empleado_id
BEFORE INSERT ON tb_empleado
FOR EACH ROW
BEGIN
  :NEW.id_Empleado := seq_empleado_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_factura`
--

CREATE SEQUENCE seq_factura_id
START WITH 1 -- Starting with 1 as it's a common practice in Oracle.
INCREMENT BY 1;

ALTER TABLE tb_factura
MODIFY id_Factura NUMBER;

CREATE OR REPLACE TRIGGER trg_factura_id
BEFORE INSERT ON tb_factura
FOR EACH ROW
BEGIN
  :NEW.id_Factura := seq_factura_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_lote`
--

CREATE SEQUENCE seq_lote_id
START WITH 1  -- Starting with 1 as it's a common practice in Oracle.
INCREMENT BY 1;

ALTER TABLE tb_lote
MODIFY id_Lote NUMBER;

CREATE OR REPLACE TRIGGER trg_lote_id
BEFORE INSERT ON tb_lote
FOR EACH ROW
BEGIN
  :NEW.id_Lote := seq_lote_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_marca`
--

CREATE SEQUENCE seq_marca_id
START WITH 1  -- Starting with 1 as it's a common practice in Oracle.
INCREMENT BY 1;

ALTER TABLE tb_marca
MODIFY id_Marca NUMBER;

CREATE OR REPLACE TRIGGER trg_marca_id
BEFORE INSERT ON tb_marca
FOR EACH ROW
BEGIN
  :NEW.id_Marca := seq_marca_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_producto`
--

CREATE SEQUENCE seq_producto_id
START WITH 1  -- Starting with 1 as it's a common practice in Oracle.
INCREMENT BY 1;

ALTER TABLE tb_producto
MODIFY id_Producto NUMBER;

CREATE OR REPLACE TRIGGER trg_producto_id
BEFORE INSERT ON tb_producto
FOR EACH ROW
BEGIN
  :NEW.id_Producto := seq_producto_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_proveedor`
--

CREATE SEQUENCE seq_proveedor_id
START WITH 1  -- Starting with 1 as it's a common practice in Oracle.
INCREMENT BY 1;

ALTER TABLE tb_proveedor
MODIFY id_Proveedor NUMBER;

CREATE OR REPLACE TRIGGER trg_proveedor_id
BEFORE INSERT ON tb_proveedor
FOR EACH ROW
BEGIN
  :NEW.id_Proveedor := seq_proveedor_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_provincia`
--

CREATE SEQUENCE seq_provincia_id
START WITH 8  -- Starting with 8 to match the AUTO_INCREMENT value in MySQL.
INCREMENT BY 1;

ALTER TABLE tb_provincia
MODIFY id_Provincia NUMBER;

CREATE OR REPLACE TRIGGER trg_provincia_id
BEFORE INSERT ON tb_provincia
FOR EACH ROW
BEGIN
  :NEW.id_Provincia := seq_provincia_id.NEXTVAL;
END;
/

--
-- AUTO_INCREMENT de la tabla `tb_usuario_rol`
--

CREATE SEQUENCE seq_usuario_rol_id
START WITH 4  -- Starting with 4 to match the AUTO_INCREMENT value in MySQL.
INCREMENT BY 1;

ALTER TABLE tb_usuario_rol
MODIFY id_usuario_Rol NUMBER;

CREATE OR REPLACE TRIGGER trg_usuario_rol_id
BEFORE INSERT ON tb_usuario_rol
FOR EACH ROW
BEGIN
  :NEW.id_usuario_Rol := seq_usuario_rol_id.NEXTVAL;
END;
/

-- --------------------------------------------------------
--
-- Procedimientos
--
CREATE OR REPLACE PROCEDURE ActivarCliente (pIdCliente IN NUMBER) AS
BEGIN
  UPDATE tb_cliente SET estado = 1 WHERE idCliente = pIdCliente;
END;
/

CREATE OR REPLACE PROCEDURE ActivarEmpleado (pIdEmpleado IN NUMBER) AS
BEGIN
  UPDATE tb_empleado SET estado = 1 WHERE id_Empleado = pIdEmpleado;
END;
/

CREATE OR REPLACE PROCEDURE ActivarProveedor (pIdProveedor IN NUMBER) AS
BEGIN
  UPDATE tb_proveedor SET estado = 1 WHERE id_Proveedor = pIdProveedor;
END;
/

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
END;
/
----------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE ActualizarEmpleado (
  pIdEmpleado         IN tb_empleado.id_Empleado%TYPE,
  pCorreoElectronico  IN tb_empleado.correo%TYPE,
  pIdentificacion     IN tb_empleado.Identificacion%TYPE,
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
  pContrasenna        IN tb_empleado.contrasenna%TYPE,
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
    UPDATE tb_empleado SET contrasenna = pContrasenna WHERE id_Empleado = pIdEmpleado;
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
END;
/*/
----------------------------------------------------------------------------------------------------------------------------
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

----------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE BuscarDatosCliente (
    pIdentificacion IN INT
)
IS
BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*
    FROM tb_Cliente c
    INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
    INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
    INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
    INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    WHERE c.num_identificacion = pIdentificacion;
END;
/*/
----------------------------------------------------------------------------------------------------------------------------
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
/

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
/

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

CREATE OR REPLACE PROCEDURE EliminarFactura (pidFactura IN NUMBER) AS
BEGIN
  INSERT INTO tb_compra (id_Compra, fecha_Factura, idCliente, id_Empleado)
  SELECT id_Factura, fecha_Factura, idCliente, id_Empleado
  FROM tb_factura
  WHERE id_Factura = pidFactura;
  
  INSERT INTO tb_detalle_compra (id_detalle_Compra, cantidad_Venta, id_Producto, id_Compra)
  SELECT id_detalleFactura, cantidad_Venta, id_Producto, id_Factura
  FROM tb_detalle_factura
  WHERE id_Factura = pidFactura;

  DELETE FROM tb_detalle_Factura WHERE id_Factura = pidFactura;
  DELETE FROM tb_Factura WHERE id_Factura = pidFactura;
END;
/

CREATE OR REPLACE PROCEDURE EliminarProducto (pidProducto IN NUMBER, pidFactura IN NUMBER, pCantidadProducto IN NUMBER) AS
BEGIN
  UPDATE tb_Producto
  SET cantidad_Disponible = cantidad_Disponible + pCantidadProducto
  WHERE id_Producto = pidProducto;
  
  DELETE FROM tb_detalle_Factura
  WHERE pidProducto = pidProducto AND id_Factura = pidFactura;
END;
/

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

CREATE OR REPLACE PROCEDURE obtenerDistrito (
    pCanton IN NUMBER
)
AS
    -- Declare variables to hold the query results
    -- Replace the data types with appropriate ones for your columns
    vId_Distrito tb_distrito.id_Distrito%TYPE;
    vDistrito tb_distrito.Distrito%TYPE;
BEGIN
    -- Use SELECT INTO to fetch the data into variables
    SELECT id_Distrito, Distrito
    INTO vId_Distrito, vDistrito
    FROM tb_distrito
    WHERE id_Canton = pCanton;

    -- You can now use the retrieved data as needed.

    -- For example, you can use the variables in further processing or simply leave this part empty.
    -- The procedure will execute the SELECT statement without displaying the data.
    -- If you don't need to use the data, you can remove the SELECT INTO statement entirely.
END;
/
----------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE obtenerProveedor
IS
BEGIN
    -- Use a cursor to execute the SELECT query
    FOR proveedor_rec IN (SELECT id_Proveedor, nombreProveedor
                          FROM tb_proveedor)
    LOOP
        -- This loop will iterate over the result set but won't do anything with the data.
        -- If you don't want to display or process the data, you can leave this loop empty.
        -- If the loop is empty, you can remove it entirely.

        -- You can perform any additional logic or processing here if needed.
        -- For example, you can do something with each record in the loop, or just leave the loop empty.
    END LOOP;
END;
/*/
----------------------------------------------------------------------------------------------------------------------------
/*CREATE OR REPLACE PROCEDURE obtenerProvincia
AS
BEGIN
    SELECT id_Provincia, Provincia
    FROM tb_provincia;
END;
/*/
----------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE obtenerRol AS
BEGIN
    SELECT id_usuario_Rol, nombre_rol
    FROM tb_usuario_rol;
END;
/
----------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE ValidacionSesion (
    pCorreo IN VARCHAR2,
    pContrasena IN NUMBER
) AS
BEGIN
    SELECT id_Empleado, num_identificacion, correo, estado, U.id_usuario_Rol, R.nombre_Rol
    FROM tb_Empleado U
    INNER JOIN tb_usuario_rol R ON U.id_usuario_Rol = R.id_usuario_Rol
    WHERE correo = pCorreo AND contrasena = pContrasena AND estado = 1;
END;
/

CREATE OR REPLACE PROCEDURE VerCompras AS
BEGIN
    SELECT d.id_Compra, d.fecha_Factura, c.Nombre as Cliente, e.Nombre as Empleado
    FROM tb_compra d
    INNER JOIN tb_cliente c ON d.idCliente = c.idCliente
    INNER JOIN tb_empleado e ON d.id_Empleado = e.id_Empleado;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosCliente (pIdCliente IN NUMBER) AS
BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*
    FROM tb_Cliente c
    INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
    INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
    INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
    INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    WHERE c.idCliente = pIdCliente;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosClientes AS
BEGIN
    SELECT idCliente,
           identificacion,
           Nombre,
           PrimerApellido,
           SegundApellido,
           Correo,
           telefono,
           CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS DescEstado
    FROM tb_cliente;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosEmpleado (pIdEmpleado IN NUMBER) AS
BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*, r.*
    FROM tb_empleado c
    INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
    INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
    INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
    INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    INNER JOIN tb_usuario_rol r ON r.id_usuario_Rol = c.id_usuario_Rol
    WHERE c.id_Empleado = pIdEmpleado;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosEmpleados AS
BEGIN
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
    INNER JOIN tb_usuario_rol r ON r.id_usuario_Rol = c.id_usuario_Rol;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosProducto (pIdProducto IN NUMBER) AS
BEGIN
    SELECT p.id_Producto, p.nombre_Producto, p.cantidad_Disponible, p.precio_Venta, p.descripcion, 
    l.Fecha_Produccion, l.Fecha_Vencimiento, m.nombre_Marca, 
    c.nombre_Categoria, c.descripcion AS descripcion_Categoria, 
    pv.nombreProveedor, pv.id_Proveedor
    FROM tb_Producto p
    INNER JOIN tb_lote l ON p.id_Lote = l.id_Lote
    INNER JOIN tb_marca m ON p.id_Marca = m.id_Marca
    INNER JOIN tb_categoria c ON p.id_Categoria = c.id_Categoria
    INNER JOIN tb_proveedor pv ON p.id_Proveedor = pv.id_Proveedor
    WHERE p.id_Producto = pIdProducto;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosProductos AS
BEGIN
    SELECT p.id_Producto, p.nombre_Producto, p.cantidad_Disponible, p.precio_Venta, p.descripcion, 
    l.Fecha_Produccion, l.Fecha_Vencimiento, m.nombre_Marca, 
    c.nombre_Categoria, c.descripcion AS descripcion_Categoria, 
    pv.nombreProveedor
    FROM tb_Producto p
    INNER JOIN tb_lote l ON p.id_Lote = l.id_Lote
    INNER JOIN tb_marca m ON p.id_Marca = m.id_Marca
    INNER JOIN tb_categoria c ON p.id_Categoria = c.id_Categoria
    INNER JOIN tb_proveedor pv ON p.id_Proveedor = pv.id_Proveedor;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosProveedor(pIdProveedor IN NUMBER) AS
BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*
    FROM tb_proveedor c
    INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
    INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
    INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
    INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    WHERE c.id_Proveedor = pIdProveedor;
END;
/

CREATE OR REPLACE PROCEDURE VerDatosProveedores AS
BEGIN
    SELECT id_Proveedor,
           nombreProveedor,
           identificacion,
           correo,
           telefono,
           CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END AS DescEstado
    FROM tb_proveedor;
END;
/

CREATE OR REPLACE PROCEDURE VerDetalleCompra(pIdCompra IN NUMBER) AS
BEGIN
    SELECT d.cantidad_Venta, p.nombre_Producto, p.precio_Venta
    FROM tb_detalle_Compra d
    INNER JOIN tb_Producto p ON p.id_Producto = d.id_Producto
    WHERE d.id_Compra = pIdCompra;
END;
/

CREATE OR REPLACE PROCEDURE VerDetalleFactura(pidFactura IN NUMBER) AS
BEGIN
    SELECT p.nombre_Producto, p.precio_Venta, d.cantidad_Venta, d.id_Factura, d.id_Producto
    FROM tb_detalle_factura d
    INNER JOIN tb_producto p ON p.id_Producto = d.id_Producto
    WHERE pidFactura = d.id_Factura;
END;
/

SELECT * FROM dba_tab_columns;


