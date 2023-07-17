-- --------------------------------------------------------
-- 
-- Base de datos: `proyecto_supermercado_la_amistad`
--
-- --------------------------------------------------------
--
-- Estructura de tabla para la tabla `tb_canton`
--

CREATE TABLE `tb_canton` (
  `id_Canton` int(11) NOT NULL,
  `Canton` varchar(50) DEFAULT NULL,
  `id_Provincia` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_canton`
--

INSERT INTO `tb_canton` (`id_Canton`, `Canton`, `id_Provincia`) VALUES
(1, 'San Jose', 1),
(2, 'Escazú', 1),
(3, 'Desamparados', 1),
(4, 'Alajuela', 2),
(5, 'Atenas', 2),
(6, 'Cartago', 3),
(7, 'La Unión', 3),
(8, 'Heredia', 4),
(9, 'Barva', 4),
(10, 'Belén', 4),
(11, 'Santa Cruz', 5),
(12, 'Esparza', 5),
(13, 'Puntarenas', 6),
(14, 'Quepos', 6),
(15, 'Limón', 7),
(16, 'Pococí', 7),
(17, 'Siquirres', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_categoria`
--

CREATE TABLE `tb_categoria` (
  `id_Categoria` int(11) NOT NULL,
  `nombre_Categoria` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `idCliente` int(11) NOT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `PrimerApellido` varchar(50) DEFAULT NULL,
  `SegundApellido` varchar(50) DEFAULT NULL,
  `Correo` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `id_Direccion` int(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_compra`
--

CREATE TABLE `tb_compra` (
  `id_Compra` int(11) NOT NULL,
  `fecha_Factura` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `id_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_compra`
--

CREATE TABLE `tb_detalle_compra` (
  `id_detalle_Compra` int(11) NOT NULL,
  `cantidad_Venta` int(11) DEFAULT NULL,
  `id_Producto` int(11) DEFAULT NULL,
  `id_Compra` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_detalle_factura`
--

CREATE TABLE `tb_detalle_factura` (
  `id_detalleFactura` int(11) NOT NULL,
  `cantidad_Venta` int(11) DEFAULT NULL,
  `id_Producto` int(11) DEFAULT NULL,
  `id_Factura` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_direccion`
--

CREATE TABLE `tb_direccion` (
  `id_Direccion` int(11) NOT NULL,
  `Provincia` int(11) DEFAULT NULL,
  `Otras_senas` varchar(100) DEFAULT NULL,
  `Canton` int(11) DEFAULT NULL,
  `Distrito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_direccion`
--

INSERT INTO `tb_direccion` (`id_Direccion`, `Provincia`, `Otras_senas`, `Canton`, `Distrito`) VALUES
(1, 1, 'Centro', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_distrito`
--

CREATE TABLE `tb_distrito` (
  `id_Distrito` int(11) NOT NULL,
  `Distrito` varchar(50) DEFAULT NULL,
  `id_Canton` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_distrito`
--

INSERT INTO `tb_distrito` (`id_Distrito`, `Distrito`, `id_Canton`) VALUES
(1, 'Carmen', 1),
(2, 'San Francisco', 1),
(3, 'San Antonio', 2),
(4, 'San Rafael', 2),
(5, 'San Rafael', 3),
(6, 'San Cristóbal', 3),
(7, 'San Josecito', 4),
(8, 'Río Segundo', 4),
(9, 'San Isidro', 5),
(10, 'Barva', 6),
(11, 'San Antonio', 7),
(12, 'Concepción', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_empleado`
--

CREATE TABLE `tb_empleado` (
  `id_Empleado` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `PrimerApellido` varchar(50) DEFAULT NULL,
  `SegundoApellido` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `num_identificacion` int(11) DEFAULT NULL,
  `fecha_Nacimiento` date DEFAULT NULL,
  `horas_labor` int(11) DEFAULT NULL,
  `id_Direccion` int(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `id_usuario_Rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_empleado`
--

INSERT INTO `tb_empleado` (`id_Empleado`, `Nombre`, `PrimerApellido`, `SegundoApellido`, `correo`, `telefono`, `Salario`, `contrasena`, `num_identificacion`, `fecha_Nacimiento`, `horas_labor`, `id_Direccion`, `estado`, `id_usuario_Rol`) VALUES
(1, 'Melanie', 'Picado', 'Mora', 'melaniepicado30@gmail.com', '86242591', 45678678, '3025', 118830750, '2003-08-30', 4567, 1, b'1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_factura`
--

CREATE TABLE `tb_factura` (
  `id_Factura` int(11) NOT NULL,
  `fecha_Factura` date DEFAULT NULL,
  `idCliente` int(11) DEFAULT NULL,
  `id_Empleado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_lote`
--

CREATE TABLE `tb_lote` (
  `id_Lote` int(11) NOT NULL,
  `Fecha_Produccion` date DEFAULT NULL,
  `Fecha_Vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_marca`
--

CREATE TABLE `tb_marca` (
  `id_Marca` int(11) NOT NULL,
  `nombre_Marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_producto`
--

CREATE TABLE `tb_producto` (
  `id_Producto` int(11) NOT NULL,
  `nombre_Producto` varchar(50) DEFAULT NULL,
  `cantidad_Disponible` int(11) DEFAULT NULL,
  `precio_Venta` double DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `id_Lote` int(11) DEFAULT NULL,
  `id_Marca` int(11) DEFAULT NULL,
  `id_Categoria` int(11) DEFAULT NULL,
  `id_Proveedor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_proveedor`
--

CREATE TABLE `tb_proveedor` (
  `id_Proveedor` int(11) NOT NULL,
  `nombreProveedor` varchar(50) DEFAULT NULL,
  `identificacion` int(11) DEFAULT NULL,
  `correo` varchar(80) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `id_Direccion` int(11) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_provincia`
--

CREATE TABLE `tb_provincia` (
  `id_Provincia` int(11) NOT NULL,
  `Provincia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_provincia`
--

INSERT INTO `tb_provincia` (`id_Provincia`, `Provincia`) VALUES
(1, 'San Jose'),
(2, 'Alajuela'),
(3, 'Cartago'),
(4, 'Heredia'),
(5, 'Guanacaste'),
(6, 'Puntarenas'),
(7, 'Limón');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tb_usuario_rol`
--

CREATE TABLE `tb_usuario_rol` (
  `id_usuario_Rol` int(11) NOT NULL,
  `nombre_Rol` varchar(50) DEFAULT NULL,
  `descripcion_Rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tb_usuario_rol`
--

INSERT INTO `tb_usuario_rol` (`id_usuario_Rol`, `nombre_Rol`, `descripcion_Rol`) VALUES
(1, 'Administrador', 'n'),
(2, 'Bodeguero', 'n'),
(3, 'Vendedor', 'n');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tb_canton`
--
ALTER TABLE `tb_canton`
  ADD PRIMARY KEY (`id_Canton`),
  ADD KEY `id_Provincia` (`id_Provincia`);

--
-- Indices de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  ADD PRIMARY KEY (`id_Categoria`);

--
-- Indices de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `id_Direccion` (`id_Direccion`);

--
-- Indices de la tabla `tb_compra`
--
ALTER TABLE `tb_compra`
  ADD PRIMARY KEY (`id_Compra`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `id_Empleado` (`id_Empleado`);

--
-- Indices de la tabla `tb_detalle_compra`
--
ALTER TABLE `tb_detalle_compra`
  ADD PRIMARY KEY (`id_detalle_Compra`),
  ADD KEY `id_Producto` (`id_Producto`),
  ADD KEY `id_Compra` (`id_Compra`);

--
-- Indices de la tabla `tb_detalle_factura`
--
ALTER TABLE `tb_detalle_factura`
  ADD PRIMARY KEY (`id_detalleFactura`),
  ADD KEY `id_Producto` (`id_Producto`),
  ADD KEY `id_Factura` (`id_Factura`);

--
-- Indices de la tabla `tb_direccion`
--
ALTER TABLE `tb_direccion`
  ADD PRIMARY KEY (`id_Direccion`),
  ADD KEY `Provincia` (`Provincia`),
  ADD KEY `Canton` (`Canton`),
  ADD KEY `Distrito` (`Distrito`);

--
-- Indices de la tabla `tb_distrito`
--
ALTER TABLE `tb_distrito`
  ADD PRIMARY KEY (`id_Distrito`),
  ADD KEY `id_Canton` (`id_Canton`);

--
-- Indices de la tabla `tb_empleado`
--
ALTER TABLE `tb_empleado`
  ADD PRIMARY KEY (`id_Empleado`),
  ADD KEY `id_Direccion` (`id_Direccion`),
  ADD KEY `id_usuario_Rol` (`id_usuario_Rol`);

--
-- Indices de la tabla `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD PRIMARY KEY (`id_Factura`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `id_Empleado` (`id_Empleado`);

--
-- Indices de la tabla `tb_lote`
--
ALTER TABLE `tb_lote`
  ADD PRIMARY KEY (`id_Lote`);

--
-- Indices de la tabla `tb_marca`
--
ALTER TABLE `tb_marca`
  ADD PRIMARY KEY (`id_Marca`);

--
-- Indices de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD PRIMARY KEY (`id_Producto`),
  ADD KEY `id_Lote` (`id_Lote`),
  ADD KEY `id_Marca` (`id_Marca`),
  ADD KEY `id_Categoria` (`id_Categoria`),
  ADD KEY `id_Proveedor` (`id_Proveedor`);

--
-- Indices de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD PRIMARY KEY (`id_Proveedor`),
  ADD KEY `id_Direccion` (`id_Direccion`);

--
-- Indices de la tabla `tb_provincia`
--
ALTER TABLE `tb_provincia`
  ADD PRIMARY KEY (`id_Provincia`);

--
-- Indices de la tabla `tb_usuario_rol`
--
ALTER TABLE `tb_usuario_rol`
  ADD PRIMARY KEY (`id_usuario_Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tb_categoria`
--
ALTER TABLE `tb_categoria`
  MODIFY `id_Categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_detalle_factura`
--
ALTER TABLE `tb_detalle_factura`
  MODIFY `id_detalleFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_direccion`
--
ALTER TABLE `tb_direccion`
  MODIFY `id_Direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tb_distrito`
--
ALTER TABLE `tb_distrito`
  MODIFY `id_Distrito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tb_empleado`
--
ALTER TABLE `tb_empleado`
  MODIFY `id_Empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tb_factura`
--
ALTER TABLE `tb_factura`
  MODIFY `id_Factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_lote`
--
ALTER TABLE `tb_lote`
  MODIFY `id_Lote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_marca`
--
ALTER TABLE `tb_marca`
  MODIFY `id_Marca` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  MODIFY `id_Producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  MODIFY `id_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tb_provincia`
--
ALTER TABLE `tb_provincia`
  MODIFY `id_Provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tb_usuario_rol`
--
ALTER TABLE `tb_usuario_rol`
  MODIFY `id_usuario_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tb_canton`
--
ALTER TABLE `tb_canton`
  ADD CONSTRAINT `tb_canton_ibfk_1` FOREIGN KEY (`id_Provincia`) REFERENCES `tb_provincia` (`id_Provincia`);

--
-- Filtros para la tabla `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD CONSTRAINT `tb_cliente_ibfk_1` FOREIGN KEY (`id_Direccion`) REFERENCES `tb_direccion` (`id_Direccion`);

--
-- Filtros para la tabla `tb_compra`
--
ALTER TABLE `tb_compra`
  ADD CONSTRAINT `tb_compra_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tb_cliente` (`idCliente`),
  ADD CONSTRAINT `tb_compra_ibfk_2` FOREIGN KEY (`id_Empleado`) REFERENCES `tb_empleado` (`id_Empleado`);

--
-- Filtros para la tabla `tb_detalle_compra`
--
ALTER TABLE `tb_detalle_compra`
  ADD CONSTRAINT `tb_detalle_compra_ibfk_1` FOREIGN KEY (`id_Producto`) REFERENCES `tb_producto` (`id_Producto`),
  ADD CONSTRAINT `tb_detalle_compra_ibfk_2` FOREIGN KEY (`id_Compra`) REFERENCES `tb_compra` (`id_Compra`);

--
-- Filtros para la tabla `tb_detalle_factura`
--
ALTER TABLE `tb_detalle_factura`
  ADD CONSTRAINT `tb_detalle_factura_ibfk_1` FOREIGN KEY (`id_Producto`) REFERENCES `tb_producto` (`id_Producto`),
  ADD CONSTRAINT `tb_detalle_factura_ibfk_2` FOREIGN KEY (`id_Factura`) REFERENCES `tb_factura` (`id_Factura`);

--
-- Filtros para la tabla `tb_direccion`
--
ALTER TABLE `tb_direccion`
  ADD CONSTRAINT `tb_direccion_ibfk_1` FOREIGN KEY (`Provincia`) REFERENCES `tb_provincia` (`id_Provincia`),
  ADD CONSTRAINT `tb_direccion_ibfk_2` FOREIGN KEY (`Canton`) REFERENCES `tb_canton` (`id_Canton`),
  ADD CONSTRAINT `tb_direccion_ibfk_3` FOREIGN KEY (`Distrito`) REFERENCES `tb_distrito` (`id_Distrito`);

--
-- Filtros para la tabla `tb_distrito`
--
ALTER TABLE `tb_distrito`
  ADD CONSTRAINT `tb_distrito_ibfk_1` FOREIGN KEY (`id_Canton`) REFERENCES `tb_canton` (`id_Canton`);

--
-- Filtros para la tabla `tb_empleado`
--
ALTER TABLE `tb_empleado`
  ADD CONSTRAINT `tb_empleado_ibfk_1` FOREIGN KEY (`id_Direccion`) REFERENCES `tb_direccion` (`id_Direccion`),
  ADD CONSTRAINT `tb_empleado_ibfk_2` FOREIGN KEY (`id_usuario_Rol`) REFERENCES `tb_usuario_rol` (`id_usuario_Rol`);

--
-- Filtros para la tabla `tb_factura`
--
ALTER TABLE `tb_factura`
  ADD CONSTRAINT `tb_factura_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `tb_cliente` (`idCliente`),
  ADD CONSTRAINT `tb_factura_ibfk_2` FOREIGN KEY (`id_Empleado`) REFERENCES `tb_empleado` (`id_Empleado`);

--
-- Filtros para la tabla `tb_producto`
--
ALTER TABLE `tb_producto`
  ADD CONSTRAINT `tb_producto_ibfk_1` FOREIGN KEY (`id_Lote`) REFERENCES `tb_lote` (`id_Lote`),
  ADD CONSTRAINT `tb_producto_ibfk_2` FOREIGN KEY (`id_Marca`) REFERENCES `tb_marca` (`id_Marca`),
  ADD CONSTRAINT `tb_producto_ibfk_3` FOREIGN KEY (`id_Categoria`) REFERENCES `tb_categoria` (`id_Categoria`),
  ADD CONSTRAINT `tb_producto_ibfk_4` FOREIGN KEY (`id_Proveedor`) REFERENCES `tb_proveedor` (`id_Proveedor`);

--
-- Filtros para la tabla `tb_proveedor`
--
ALTER TABLE `tb_proveedor`
  ADD CONSTRAINT `tb_proveedor_ibfk_1` FOREIGN KEY (`id_Direccion`) REFERENCES `tb_direccion` (`id_Direccion`);
COMMIT;

-- --------------------------------------------------------
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActivarCliente` (IN `pIdCliente` INT)   BEGIN
    update tb_cliente set  estado = 1 where idCliente = pIdCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActivarEmpleado` (IN `pIdEmpleado` INT)   BEGIN
    update tb_empleado set  estado = 1 where id_Empleado = pIdEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActivarProveedor` (IN `pIdProveedor` INT)   BEGIN
    update tb_proveedor set  estado = 1 where id_Proveedor = pIdProveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCliente` (IN `pIdClientein` INT, IN `pCorreoElectronico` VARCHAR(50), IN `pIdentificacion` INT, IN `pNombre` VARCHAR(50), IN `pPrimerApellido` VARCHAR(50), IN `pSegundoApellido` VARCHAR(50), IN `pTelefono` INT, IN `pProvincia` INT, IN `pCanton` INT, IN `pDistrito` INT, IN `pOtrasSenales` VARCHAR(100))   BEGIN
    
    if (pProvincia != 0) then
    set @direccion = (select id_Direccion from tb_cliente where pIdClientein = idCliente);
		update tb_direccion set Provincia =pProvincia,Otras_senas =pOtrasSenales,Canton =pCanton
        ,Distrito =pDistrito  where id_Direccion = @direccion;
	end if;
		update tb_cliente set identificacion =pIdentificacion ,Nombre = pNombre,PrimerApellido = pPrimerApellido
		,SegundApellido = pSegundoApellido,Correo = pCorreoElectronico,telefono = pTelefono where pIdClientein = idCliente;        
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarEmpleado` (IN `pIdEmpleado` INT, IN `pCorreoElectronico` VARCHAR(50), IN `pIdentificacion` INT, IN `pNombre` VARCHAR(50), IN `pPrimerApellido` VARCHAR(50), IN `pSegundoApellido` VARCHAR(50), IN `pSalario` DOUBLE, IN `pFechaNacimiento` DATE, IN `pHorasLaborar` INT, IN `pTelefono` INT, IN `pProvincia` INT, IN `pCanton` INT, IN `pDistrito` INT, IN `pOtrasSenales` VARCHAR(100), IN `pContrasenna` VARCHAR(50), IN `pRol` INT)   BEGIN
    
    if (pProvincia != 0) then
    set @direccion = (select id_Direccion from tb_empleado where pIdEmpleado = id_Empleado);
		update tb_direccion set Provincia =pProvincia,Otras_senas =pOtrasSenales,Canton =pCanton
        ,Distrito =pDistrito  where id_Direccion = @direccion;
	end if;
    if(pContrasenna != null)then
		update tb_empleado set contrasenna = pContrasenna where pIdEmpleado = id_Empleado;
    end if;
    if(pRol != 0)then
		update tb_empleado set id_usuario_Rol = pRol where pIdEmpleado = id_Empleado;
    end if;
		update tb_empleado set Nombre =pNombre ,PrimerApellido = pPrimerApellido,SegundoApellido = pSegundoApellido,
        correo = pCorreoElectronico,telefono = pTelefono,Salario = pSalario,fecha_Nacimiento = pFechaNacimiento,
        horas_labor = pHorasLaborar where pIdEmpleado = id_Empleado;       
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProducto` (IN `pidProducto` INT, IN `pNombre` VARCHAR(50), IN `pCantidad` INT, IN `pPrecio` DOUBLE, IN `pDescripcionProducto` VARCHAR(50), IN `pProveedor` INT)   BEGIN
		update tb_Producto set cantidad_Disponible = pCantidad ,precio_Venta = pPrecio ,descripcion = pDescripcionProducto ,id_Proveedor = pProveedor
        where id_Producto = pidProducto;       
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarProveedor` (IN `pIdProveedor` INT, IN `pCorreoElectronico` VARCHAR(50), IN `pIdentificacion` INT, IN `pNombre` VARCHAR(50), IN `pTelefono` INT, IN `pProvincia` INT, IN `pCanton` INT, IN `pDistrito` INT, IN `pOtrasSenales` VARCHAR(100))   BEGIN
    
    if (pProvincia != 0) then
    set @direccion = (select id_Direccion from tb_proveedor where pIdProveedor = id_Proveedor);
		update tb_direccion set Provincia =pProvincia,Otras_senas =pOtrasSenales,Canton =pCanton
        ,Distrito =pDistrito  where id_Direccion = @direccion;
	end if;
		update tb_proveedor set identificacion =pIdentificacion ,nombreProveedor = pNombre
        ,correo = pCorreoElectronico,telefono = pTelefono where pIdProveedor = id_Proveedor;       
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarProducto` (IN `pidProducto` INT, IN `pidFactura` INT, IN `pCantidadProducto` INT)   BEGIN
	if(select 1 from tb_detalle_Factura where  pidProducto = id_Producto and id_Factura = pidFactura)then
		update tb_Producto set cantidad_Disponible = cantidad_Disponible-pCantidadProducto where pidProducto = id_Producto;
		update tb_detalle_Factura set cantidad_Venta = cantidad_Venta + pCantidadProducto where  pidProducto = id_Producto and id_Factura = pidFactura;
    else
		insert into tb_detalle_Factura(cantidad_Venta,id_Producto,id_Factura) values(pCantidadProducto,pidProducto,pidFactura);
        update tb_Producto set cantidad_Disponible = cantidad_Disponible-pCantidadProducto where pidProducto = id_Producto;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarDatosCliente` (IN `pIdentificacion` INT)   BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*
	FROM tb_Cliente c
	INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
	INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
	INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
	INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    where c.identificacion = pIdentificacion;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarProducto` (IN `pNombre` VARCHAR(50))   BEGIN
	if pNombre = '' 
    then
	SELECT id_Producto, nombre_Producto, cantidad_Disponible, precio_Venta
    FROM tb_Producto;     
    else
    SELECT id_Producto, nombre_Producto, cantidad_Disponible, precio_Venta
    FROM tb_Producto 
    where nombre_Producto = pNombre; 
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CrearFactura` (IN `pidCliente` INT, IN `pidEmpleado` INT, OUT `pidFactura` INT)   BEGIN
	insert into tb_Factura(fecha_Factura, idCliente, id_Empleado) values (NOW(), pidCliente, pidEmpleado);
    set pidFactura = Last_insert_id();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ElimiarCliente` (IN `pIdCliente` INT)   BEGIN
    update tb_cliente set  estado = 0 where idCliente = pIdCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ElimiarProveedor` (IN `pIdProveedor` INT)   BEGIN
    update tb_proveedor set  estado = 0 where id_Proveedor = pIdProveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarEmpleado` (IN `pIdEmpleado` INT)   BEGIN
    update tb_empleado set  estado = 0 where id_Empleado = pIdEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarFactura` (IN `pidFactura` INT)   BEGIN
    INSERT INTO tb_compra(id_Compra,fecha_Factura,idCliente,id_Empleado)
	select id_Factura,fecha_Factura,idCliente,id_Empleado
	FROM tb_factura
    where id_Factura = pidFactura;
    
	INSERT INTO tb_detalle_compra(id_detalle_Compra,cantidad_Venta,id_Producto,id_Compra)
    SELECT id_detalleFactura,cantidad_Venta,id_Producto,id_Factura FROM tb_detalle_factura
    where  id_Factura = pidFactura;

	delete from tb_detalle_Factura where id_Factura = pidFactura;
    delete from tb_Factura where  id_Factura = pidFactura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarProducto` (IN `pidProducto` INT, IN `pidFactura` INT, IN `pCantidadProducto` INT)   BEGIN
	update tb_Producto set cantidad_Disponible = cantidad_Disponible + pCantidadProducto where pidProducto = id_Producto;
	delete from tb_detalle_Factura where  pidProducto = id_Producto and id_Factura = pidFactura;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCleinte` (IN `pCorreoElectronico` VARCHAR(50), IN `pIdentificacion` INT, IN `pNombre` VARCHAR(50), IN `pPrimerApellido` VARCHAR(50), IN `pSegundoApellido` VARCHAR(50), IN `pTelefono` INT, IN `pProvincia` INT, IN `pCanton` INT, IN `pDistrito` INT, IN `pOtrasSenales` VARCHAR(100))   BEGIN
	insert into tb_direccion(Provincia,Otras_senas,Canton,Distrito) values (pProvincia,pOtrasSenales,pCanton,pDistrito);
    set @id_Direccion = LAST_INSERT_ID();
    insert into tb_cliente(identificacion,Nombre,PrimerApellido,SegundApellido,Correo,telefono,id_Direccion,estado) 
    values(pIdentificacion,pNombre,pPrimerApellido,pSegundoApellido,pCorreoElectronico,pTelefono,@id_Direccion,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEmpleado` (IN `pCorreoElectronico` VARCHAR(50), IN `pIdentificacion` INT, IN `pNombre` VARCHAR(50), IN `pPrimerApellido` VARCHAR(50), IN `pSegundoApellido` VARCHAR(50), IN `pSalario` DOUBLE, IN `pFechaNacimiento` DATE, IN `pHorasLaborar` INT, IN `pTelefono` INT, IN `pProvincia` INT, IN `pCanton` INT, IN `pDistrito` INT, IN `pOtrasSenales` VARCHAR(100), IN `pContrasenna` VARCHAR(50), IN `pRol` INT)   BEGIN
    
	insert into tb_direccion(Provincia,Otras_senas,Canton,Distrito) values (pProvincia,pOtrasSenales,pCanton,pDistrito);
    set @id_Direccion = LAST_INSERT_ID();
    
    INSERT INTO tb_Empleado ( `Nombre`, `PrimerApellido`, `SegundoApellido`,`correo`,`telefono`,
    `Salario`,`contrasena`,`num_identificacion`,`fecha_Nacimiento`,`horas_labor`,`id_Direccion`,`estado`,`id_usuario_Rol`) VALUES
    (pNombre,pPrimerApellido,pSegundoApellido,pCorreoElectronico,pTelefono,pSalario,pContrasenna,pIdentificacion,pFechaNacimiento,pHorasLaborar
    ,@id_Direccion,1,pRol);
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProducto` (IN `pNombre` VARCHAR(50), IN `pCantidad` INT, IN `pPrecio` DOUBLE, IN `pDescripcionProducto` VARCHAR(50), IN `pFechaProduccion` DATE, IN `pFechaVencimiento` DATE, IN `pMarca` VARCHAR(50), IN `pCategoria` VARCHAR(50), IN `pdescripcionCategoria` VARCHAR(50), IN `pProveedor` INT)   BEGIN
    
	insert into tb_lote(Fecha_Produccion,Fecha_Vencimiento) values (pFechaProduccion,pFechaVencimiento);
    set @id_lote = LAST_INSERT_ID();
    insert into tb_marca(nombre_Marca) values (pMarca);
    set @id_marca = LAST_INSERT_ID();
    insert into tb_categoria(nombre_Categoria,descripcion) values (pCategoria,pdescripcionCategoria);
    set @id_categoria = LAST_INSERT_ID();
    
    insert into tb_producto(nombre_Producto,cantidad_Disponible,precio_Venta,descripcion,id_Lote,id_Marca,id_Categoria,id_Proveedor) 
    values(pNombre,pCantidad,pPrecio,pDescripcionProducto,@id_lote,@id_marca,@id_categoria,pProveedor);
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarProveedor` (IN `pCorreoElectronico` VARCHAR(50), IN `pIdentificacion` INT, IN `pNombre` VARCHAR(50), IN `pTelefono` INT, IN `pProvincia` INT, IN `pCanton` INT, IN `pDistrito` INT, IN `pOtrasSenales` VARCHAR(100))   BEGIN
	insert into tb_direccion(Provincia,Otras_senas,Canton,Distrito) values (pProvincia,pOtrasSenales,pCanton,pDistrito);
    set @id_Direccion = LAST_INSERT_ID();
    insert into tb_proveedor(nombreProveedor,identificacion,correo,telefono,id_Direccion,estado) 
    values(pNombre,pIdentificacion,pCorreoElectronico,pTelefono,@id_Direccion,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerCanton` (IN `pProvincia` INT)   BEGIN
	SELECT 	id_Canton,
    		Canton
  	FROM 	tb_canton UobtenerDistrito
    WHERE 	id_Provincia = pProvincia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerDistrito` (IN `pCanton` INT)   BEGIN
	SELECT 	id_Distrito,
    		Distrito
  	FROM 	tb_distrito
    WHERE 	id_Canton = pCanton;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerProveedor` ()   BEGIN
	SELECT 	id_Proveedor,
    		nombreProveedor
  	FROM 	tb_proveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerProvincia` ()   BEGIN
	SELECT 	id_Provincia,
    		Provincia
  	FROM 	tb_provincia;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerRol` ()   BEGIN
   select id_usuario_Rol, nombre_rol from tb_usuario_rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UltimoConsecutivo` ()   BEGIN
	SELECT MAX(nombre_de_columna) FROM nombre_de_tabla;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ValidacionSesion` (IN `pCorreo` VARCHAR(80), IN `pContrasena` INT)   BEGIN
SELECT 	id_Empleado,
		num_identificacion,
    	correo,
        estado,
        U.id_usuario_Rol,
        R.nombre_Rol
  	FROM 	tb_Empleado U
    INNER JOIN tb_usuario_rol R ON U.id_usuario_Rol = R.id_usuario_Rol
    WHERE 	correo = pCorreo
    	AND contrasena = pContrasena
        AND estado= 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerCompras` ()   BEGIN
select d.id_Compra, d.fecha_Factura ,c.Nombre as Cliente,e.Nombre as Empleado
from tb_compra d
inner join tb_cliente c on d.idCliente = c.idCliente
inner join tb_empleado e on d.id_Empleado = e.id_Empleado
;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosCliente` (IN `pIdCliente` INT)   BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*
	FROM tb_Cliente c
	INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
	INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
	INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
	INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    where c.idCliente = pIdCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosClientes` ()   BEGIN
    SELECT idCliente,
           identificacion,
           Nombre,
           PrimerApellido,
           SegundApellido,
           Correo,
           telefono,
           CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END 'DescEstado'
    FROM   tb_cliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosEmpleado` (IN `pIdEmpleado` INT)   BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*,r.*
	FROM tb_empleado c
	INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
	INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
	INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
	INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    inner join tb_usuario_rol r on r.id_usuario_Rol = c.id_usuario_Rol
    where c.id_Empleado = pIdEmpleado;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosEmpleados` ()   BEGIN
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
           CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END 'DescEstado'
    FROM   tb_empleado c  
    inner join tb_usuario_rol r on r.id_usuario_Rol = c.id_usuario_Rol;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosProducto` (IN `pIdProducto` INT)   BEGIN
    SELECT p.id_Producto, p.nombre_Producto, p.cantidad_Disponible, p.precio_Venta, p.descripcion, 
    l.Fecha_Produccion, l.Fecha_Vencimiento, m.nombre_Marca, 
    c.nombre_Categoria, c.descripcion as descripcion_Categoria, 
    pv.nombreProveedor,pv.id_Proveedor
    FROM tb_Producto p
    INNER JOIN tb_lote l ON p.id_Lote = l.id_Lote
    INNER JOIN tb_marca m ON p.id_Marca = m.id_Marca
    INNER JOIN tb_categoria c ON p.id_Categoria = c.id_Categoria
    INNER JOIN tb_proveedor pv ON p.id_Proveedor = pv.id_Proveedor
    where p.id_Producto = pIdProducto;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosProductos` ()   BEGIN
    SELECT p.id_Producto, p.nombre_Producto, p.cantidad_Disponible, p.precio_Venta, p.descripcion, 
    l.Fecha_Produccion, l.Fecha_Vencimiento, m.nombre_Marca, 
    c.nombre_Categoria, c.descripcion as descripcion_Categoria, 
    pv.nombreProveedor
    FROM tb_Producto p
    INNER JOIN tb_lote l ON p.id_Lote = l.id_Lote
    INNER JOIN tb_marca m ON p.id_Marca = m.id_Marca
    INNER JOIN tb_categoria c ON p.id_Categoria = c.id_Categoria
    INNER JOIN tb_proveedor pv ON p.id_Proveedor = pv.id_Proveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosProveedor` (IN `pIdProveedor` INT)   BEGIN
    SELECT c.*, d.*, p.*, ca.*, di.*
	FROM tb_proveedor c
	INNER JOIN tb_Direccion d ON c.id_Direccion = d.id_Direccion
	INNER JOIN tb_Provincia p ON d.Provincia = p.id_Provincia
	INNER JOIN tb_Canton ca ON d.Canton = ca.id_Canton
	INNER JOIN tb_Distrito di ON d.Distrito = di.id_Distrito
    where c.id_Proveedor = pIdProveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDatosProveedores` ()   BEGIN
    SELECT id_Proveedor,
			nombreProveedor,
           identificacion,
           correo,
           telefono,
           CASE WHEN estado = 1 THEN 'Activo' ELSE 'Inactivo' END 'DescEstado'
    FROM   tb_proveedor;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDetalleCompra` (IN `pIdCompra` INT)   BEGIN
Select d.cantidad_Venta,p.nombre_Producto,p.precio_Venta
from 
tb_detalle_Compra d
INNER JOIN tb_Producto p ON p.id_Producto = d.id_Producto
where d.id_Compra = pIdCompra;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `VerDetalleFactura` (IN `pidFactura` INT)   BEGIN
	select p.nombre_Producto,p.precio_Venta,d.cantidad_Venta,d.id_Factura,d.id_Producto
    from tb_detalle_factura d
    inner join tb_producto p on p.id_Producto = d.id_Producto
    where pidFactura = id_Factura;
END$$

DELIMITER ;
