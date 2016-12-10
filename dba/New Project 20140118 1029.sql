-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.15


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sistemadeventa
--

CREATE DATABASE IF NOT EXISTS sistemadeventa;
USE sistemadeventa;

--
-- Temporary table structure for view `detallecompra`
--
DROP TABLE IF EXISTS `detallecompra`;
DROP VIEW IF EXISTS `detallecompra`;
CREATE TABLE `detallecompra` (
  `total` decimal(32,2),
  `fecha` varchar(8)
);

--
-- Temporary table structure for view `reportedeventas`
--
DROP TABLE IF EXISTS `reportedeventas`;
DROP VIEW IF EXISTS `reportedeventas`;
CREATE TABLE `reportedeventas` (
  `codigoFactura` char(6),
  `datos` varchar(50),
  `fecha` varchar(8),
  `nombres` varchar(30),
  `importe` decimal(32,2)
);

--
-- Temporary table structure for view `v_producto`
--
DROP TABLE IF EXISTS `v_producto`;
DROP VIEW IF EXISTS `v_producto`;
CREATE TABLE `v_producto` (
  `codigoproducto` char(6),
  `nombre` varchar(15),
  `modelo` varchar(20),
  `categoria` varchar(20),
  `precioventa` decimal(10,2),
  `operador` varchar(10),
  `stock` int(11)
);

--
-- Temporary table structure for view `vempleado`
--
DROP TABLE IF EXISTS `vempleado`;
DROP VIEW IF EXISTS `vempleado`;
CREATE TABLE `vempleado` (
  `codigoempleado` char(6),
  `dni` char(8),
  `apellidos` varchar(30),
  `nombres` varchar(30),
  `direccion` varchar(50),
  `email` varchar(40),
  `telefono` char(9)
);

--
-- Temporary table structure for view `vproducto`
--
DROP TABLE IF EXISTS `vproducto`;
DROP VIEW IF EXISTS `vproducto`;
CREATE TABLE `vproducto` (
  `codigoproducto` char(6),
  `nombre` varchar(15),
  `modelo` varchar(20),
  `categoria` varchar(20),
  `precioventa` decimal(10,2),
  `operador` varchar(10),
  `stock` int(11)
);

--
-- Temporary table structure for view `vrepaciones_caja`
--
DROP TABLE IF EXISTS `vrepaciones_caja`;
DROP VIEW IF EXISTS `vrepaciones_caja`;
CREATE TABLE `vrepaciones_caja` (
  `total_reparaciones` decimal(32,2),
  `fecha` varchar(8)
);

--
-- Definition of table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
CREATE TABLE `acceso` (
  `idusuario` varchar(20) NOT NULL,
  `Contraseña` varchar(15) NOT NULL,
  `codigoempleado` char(6) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_acc_emp` (`codigoempleado`),
  CONSTRAINT `fk_acc_emp` FOREIGN KEY (`codigoempleado`) REFERENCES `empleado` (`CodigoEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acceso`
--

/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` (`idusuario`,`Contraseña`,`codigoempleado`) VALUES 
 ('abcxyz','qwertyu','100003'),
 ('edson061193','qwerty','100005');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;


--
-- Definition of table `caja`
--

DROP TABLE IF EXISTS `caja`;
CREATE TABLE `caja` (
  `Fecha` char(8) NOT NULL,
  `Entrada` decimal(10,2) NOT NULL,
  `Ventas` decimal(10,2) NOT NULL,
  `Reparaciones` decimal(10,2) NOT NULL,
  `Compras` decimal(10,2) NOT NULL,
  `totalEfectivo` decimal(10,2) NOT NULL,
  `TotalVenta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `caja`
--

/*!40000 ALTER TABLE `caja` DISABLE KEYS */;
INSERT INTO `caja` (`Fecha`,`Entrada`,`Ventas`,`Reparaciones`,`Compras`,`totalEfectivo`,`TotalVenta`) VALUES 
 ('14/01/05','0.00','1000000.00','11110.00','0.00','0.00','0.00'),
 ('14/01/06','0.00','0.00','0.00','0.00','0.00','0.00'),
 ('14/01/07','0.00','1000000.00','11110.00','0.00','0.00','0.00'),
 ('14/01/08','600.00','0.00','0.00','0.00','0.00','0.00'),
 ('14/01/09','120.00','400.00','100.00','1690.00','2310.00','2190.00'),
 ('14/01/11','1000.00','500.00','3000.00','3866.00','8366.00','7366.00'),
 ('14/01/12','200.00','0.00','0.00','0.00','0.00','0.00');
/*!40000 ALTER TABLE `caja` ENABLE KEYS */;


--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `CodigocCliente` char(6) NOT NULL,
  `DNI` char(8) NOT NULL,
  `datos` varchar(50) NOT NULL,
  `Direccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CodigocCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`CodigocCliente`,`DNI`,`datos`,`Direccion`) VALUES 
 ('C00000','00000000','--- --- --- --- ----','--- --- --- ---'),
 ('C00002','78965412','qwerty','Barranca'),
 ('C00003','96325874','aaaa','Barranca'),
 ('C00004','96325874','aaa','Barranca');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


--
-- Definition of table `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE `compra` (
  `codigoCompra` char(6) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` varchar(8) NOT NULL,
  PRIMARY KEY (`codigoCompra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `compra`
--

/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` (`codigoCompra`,`total`,`fecha`) VALUES 
 ('K00001','1.00','07/01/14'),
 ('K00002','3.00','14/01/07'),
 ('K00003','3.00','14/01/07'),
 ('K00004','1.00','14/01/07'),
 ('K00005','1.00','14/01/07'),
 ('K00006','1.00','14/01/08'),
 ('K00007','2.00','14/01/09'),
 ('K00008','1.00','14/01/11'),
 ('K00009','1.00','14/01/11'),
 ('K00010','2.00','14/01/12');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;


--
-- Definition of table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
CREATE TABLE `detalle_compra` (
  `codigoCompra` char(6) NOT NULL,
  `codigoMarca` varchar(6) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigoCompra`,`codigoMarca`),
  KEY `fk_marc` (`codigoMarca`),
  CONSTRAINT `fk_codc` FOREIGN KEY (`codigoCompra`) REFERENCES `compra` (`codigoCompra`),
  CONSTRAINT `fk_marc` FOREIGN KEY (`codigoMarca`) REFERENCES `marca_producto` (`codigoMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_compra`
--

/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` (`codigoCompra`,`codigoMarca`,`Precio`,`Cantidad`,`Importe`) VALUES 
 ('K00002','M00005','120.00',3,'360.00'),
 ('K00003','M00005','30.00',3,'90.00'),
 ('K00004','M00003','300.00',1,'300.00'),
 ('K00005','M00002','1000.00',1,'1000.00'),
 ('K00006','M00005','120.00',1,'120.00'),
 ('K00007','M00005','120.00',2,'240.00'),
 ('K00008','M00002','120.00',1,'120.00'),
 ('K00009','M00002','123.00',1,'123.00'),
 ('K00010','M00007','120.00',2,'240.00');
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;


--
-- Definition of table `detalle_servicio`
--

DROP TABLE IF EXISTS `detalle_servicio`;
CREATE TABLE `detalle_servicio` (
  `codigoFactura` char(6) NOT NULL,
  `codigoServicio` char(6) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  `codigoEmpleado` varchar(6) NOT NULL,
  PRIMARY KEY (`codigoFactura`,`codigoServicio`),
  KEY `fk_cods_s` (`codigoServicio`),
  CONSTRAINT `fk_codf_s` FOREIGN KEY (`codigoFactura`) REFERENCES `factura` (`codigoFactura`),
  CONSTRAINT `fk_cods_s` FOREIGN KEY (`codigoServicio`) REFERENCES `servicios` (`codigoServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_servicio`
--

/*!40000 ALTER TABLE `detalle_servicio` DISABLE KEYS */;
INSERT INTO `detalle_servicio` (`codigoFactura`,`codigoServicio`,`precio`,`cantidad`,`Importe`,`codigoEmpleado`) VALUES 
 ('000263','S00001','35.00',1,'35.00','100002');
/*!40000 ALTER TABLE `detalle_servicio` ENABLE KEYS */;


--
-- Definition of table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
CREATE TABLE `detalle_venta` (
  `codigoFactura` char(6) NOT NULL,
  `codigoProducto` char(6) NOT NULL,
  `CodigoEmpleado` char(6) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `Importe` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigoFactura`,`codigoProducto`),
  KEY `fk_codp_dv` (`codigoProducto`),
  KEY `fk_code_dv` (`CodigoEmpleado`),
  CONSTRAINT `fk_code_dv` FOREIGN KEY (`CodigoEmpleado`) REFERENCES `empleado` (`CodigoEmpleado`),
  CONSTRAINT `fk_codf_dv` FOREIGN KEY (`codigoFactura`) REFERENCES `factura` (`codigoFactura`),
  CONSTRAINT `fk_codp_dv` FOREIGN KEY (`codigoProducto`) REFERENCES `producto` (`codigoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detalle_venta`
--

/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` (`codigoFactura`,`codigoProducto`,`CodigoEmpleado`,`Precio`,`cantidad`,`Importe`) VALUES 
 ('000261','P00022','100004','123.00',1,'123.00'),
 ('000262','P00013','100002','120.00',1,'120.00');
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;


--
-- Definition of table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE `empleado` (
  `CodigoEmpleado` char(6) NOT NULL,
  `DNI` char(8) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `Nombres` varchar(30) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `telefono` char(9) DEFAULT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`CodigoEmpleado`),
  UNIQUE KEY `u_dni` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `empleado`
--

/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` (`CodigoEmpleado`,`DNI`,`Apellidos`,`Nombres`,`Direccion`,`email`,`telefono`,`estado`) VALUES 
 ('100001','96325874','abc','abc','bca','@hotmail','986952369','a');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;


--
-- Definition of table `factura`
--

DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `codigoFactura` char(6) NOT NULL,
  `CodigocCliente` char(6) NOT NULL,
  `fecha` varchar(8) NOT NULL,
  `IGV` decimal(10,2) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`codigoFactura`),
  KEY `fk_codc_f` (`CodigocCliente`),
  CONSTRAINT `fk_codc_f` FOREIGN KEY (`CodigocCliente`) REFERENCES `cliente` (`CodigocCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `factura`
--

/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` (`codigoFactura`,`CodigocCliente`,`fecha`,`IGV`,`Subtotal`,`total`) VALUES 
 ('000260','C00000','00/00/00','0.00','-1.00','0.00'),
 ('000261','C00002','11/01/14','22.14','100.86','123.00'),
 ('000262','C00003','12/01/14','21.60','98.40','120.00'),
 ('000263','C00004','12/01/14','0.00','0.00','35.00');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;


--
-- Definition of table `marca_producto`
--

DROP TABLE IF EXISTS `marca_producto`;
CREATE TABLE `marca_producto` (
  `codigoMarca` varchar(6) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `Caracteristicas` varchar(50) NOT NULL,
  PRIMARY KEY (`codigoMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marca_producto`
--

/*!40000 ALTER TABLE `marca_producto` DISABLE KEYS */;
INSERT INTO `marca_producto` (`codigoMarca`,`nombre`,`modelo`,`Caracteristicas`) VALUES 
 ('M00001','Lg','abc','ninguna'),
 ('M00002','samsung','galaxi','internet'),
 ('M00003','nokia','xyz','facebook,pantalla touch'),
 ('M00004','nokia','RZTW','ninguna'),
 ('M00005','motorola','records','abcqwe'),
 ('M00006','Lg','uu','abc'),
 ('M00007','motorola','mb256 defy','pantalla gorilla glass,camara 5mp,flash led'),
 ('M00008','Sony','xperia tipo','pantalla touch,camara 3.15 mp, android 4.0'),
 ('M00009','Lg','e410-l1 II','camara 2mp,\r\nandroid 4.1\r\npantalla touch');
/*!40000 ALTER TABLE `marca_producto` ENABLE KEYS */;


--
-- Definition of table `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `codigoProducto` char(6) NOT NULL,
  `codigoMarca` varchar(6) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `precioVenta` decimal(10,2) NOT NULL,
  `operador` varchar(10) NOT NULL,
  `Stock` int(11) NOT NULL,
  PRIMARY KEY (`codigoProducto`),
  KEY `fk_marc_p` (`codigoMarca`),
  CONSTRAINT `fk_marc_p` FOREIGN KEY (`codigoMarca`) REFERENCES `marca_producto` (`codigoMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `producto`
--

/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` (`codigoProducto`,`codigoMarca`,`categoria`,`precioVenta`,`operador`,`Stock`) VALUES 
 ('P00001','m00001','segunda','120.00','movistar',2),
 ('P00002','m00002','nueva','600.00','claro',8),
 ('p00003','m00002','segunda','80.00','nextel',7),
 ('P00004','m00001','segunda','400.00','nextel',7),
 ('P00005','m00002','nuevo','700.00','movistar',8),
 ('P00006','m00001','nuevo','400.00','movistar',10),
 ('P00007','m00003','nuevo','700.00','movistar',10),
 ('P00008','m00003','segunda','900.00','nextel',0),
 ('P00009','M00003','Nuevo','400.00','Nextel',5),
 ('P00010','M00002','Segunda','360.00','Nextel',7),
 ('P00011','M00005','Nuevo','1250.00','Nextel',10),
 ('P00012','M00002','Segunda','800.00','Nextel',4),
 ('P00013','M00002','Segunda','120.00',' Movistar',99),
 ('P00014','M00001','Nuevo','249.00',' Movistar',2),
 ('P00015','M00008','Nuevo','439.00',' Movistar',599),
 ('P00016','M00001','Nuevo','349.00','   Claro ',10),
 ('P00017','M00001','Segunda','349.00','Nextel',100),
 ('P00018','M00001','Nuevo','400.00',' Movistar',1),
 ('P00019','M00005','Nuevo','120.00',' Movistar',2),
 ('P00020','M00009','Nuevo','100.00',' Movistar',0),
 ('P00021','M00002','Nuevo','10.00',' Movistar',12),
 ('P00022','M00007','Nuevo','123.00',' Movistar',99),
 ('P00023','M00007','Nuevo','120.00',' Movistar',10),
 ('P00024','M00008','Nuevo','1233.00',' Movistar',100);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;


--
-- Definition of table `servicios`
--

DROP TABLE IF EXISTS `servicios`;
CREATE TABLE `servicios` (
  `codigoServicio` char(6) NOT NULL,
  `observacion` varchar(30) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `fecha` varchar(8) NOT NULL,
  PRIMARY KEY (`codigoServicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `servicios`
--

/*!40000 ALTER TABLE `servicios` DISABLE KEYS */;
INSERT INTO `servicios` (`codigoServicio`,`observacion`,`costo`,`fecha`) VALUES 
 ('S00001','','35.00','12/01/14');
/*!40000 ALTER TABLE `servicios` ENABLE KEYS */;


--
-- Definition of procedure `Cliente_Eliminar`
--

DROP PROCEDURE IF EXISTS `Cliente_Eliminar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cliente_Eliminar`(
in xcod_cliente char(6))
begin
update cliente set estado='X' where codigoccliente=xcod_cliente;
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Cliente_insertar`
--

DROP PROCEDURE IF EXISTS `Cliente_insertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Cliente_insertar`(
in xdni char(8),
in xdatos varchar(50),
in xdireccion varchar(50))
begin
set @num=0;
select count(*)into @num from Cliente;
set @codC=concat('C',right(concat('0000',cast((@num+1) as char)),5));
insert into cliente values(@codC,xdni, xdatos,xdireccion);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `compra_insertar`
--

DROP PROCEDURE IF EXISTS `compra_insertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `compra_insertar`(
in xtotal integer,
in xfecha varchar(8))
begin
set @num=0;
select count(*)into @num from compra;
set @cods=concat('K',right(concat('0000',cast((@num+1) as char)),5));
insert into compra values(@cods,xtotal,xfecha);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `eliminar_empleado`
--

DROP PROCEDURE IF EXISTS `eliminar_empleado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_empleado`(
in xcodigo char(6))
begin
update empleado set estado='E' where codigoempleado=xcodigo;
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `empleado_insertar`
--

DROP PROCEDURE IF EXISTS `empleado_insertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `empleado_insertar`(
in xdni char(8),
in xApellidos varchar(30),
in xNombres varchar(30),
in xdireccion varchar(50),
in xemail varchar(40),
in xtelefono char(9))
begin
set @num=0;
select count(*)into @num from empleado;
set @codC=concat('1',right(concat('0000',cast((@num+1) as char)),5));
insert into empleado values(@codC,xdni, xApellidos,xNombres,xdireccion,xemail,xtelefono,'A');
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `grabarFactura`
--

DROP PROCEDURE IF EXISTS `grabarFactura`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `grabarFactura`(
in xcodigofactura char(6),
in xcodigocliente char(6),
in xfecha varchar(8),
in xigv decimal(10,2),
in xsubtotal decimal(10,2),
in xtotal decimal(10,2))
begin
insert into factura values(xcodigofactura,xcodigocliente,xfecha,xigv,xsubtotal,xtotal);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insertar_detalleventa`
--

DROP PROCEDURE IF EXISTS `insertar_detalleventa`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_detalleventa`(
in xcod_factura char(6),
in xcod_producto char(6),
in xcod_Empleado char(6),
in xprecio decimal(10,2),
in xcantidad integer,
in ximporte decimal(10,2))
begin
insert into detalle_venta values(xcod_factura, xcod_producto, xcod_Empleado, xprecio, xcantidad, ximporte);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `marca_prod_Insertar`
--

DROP PROCEDURE IF EXISTS `marca_prod_Insertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `marca_prod_Insertar`(
in xnombre varchar(15),
in xmodelo varchar(20),
in xcaracteristica varchar(50) )
begin
set @num=0;
select count(*) into @num from marca_producto;
set @cod=concat('M',right(concat('0000',cast((@num+1) as char)),5));
insert into marca_producto values(@cod,xnombre,xmodelo,xcaracteristica);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Producto_insertar`
--

DROP PROCEDURE IF EXISTS `Producto_insertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Producto_insertar`(

in xcodigomarca varchar(6),
in xcategoria varchar(20),
in xpreciodeVenta decimal(10,2),
in xoperador varchar(10),
in xstock integer)
begin
set @num=0;
select count(*)into @num from producto;
set @codp=concat('P',right(concat('0000',cast((@num+1) as char)),5));
insert into producto values(@codp,xcodigomarca, xcategoria,xpreciodeVenta,xoperador,xstock);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Producto_modificar`
--

DROP PROCEDURE IF EXISTS `Producto_modificar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Producto_modificar`(
 in xcodpr char(6),
in xpreciodeVenta decimal(10,2),
in xstock integer)
begin


update  producto set precioventa=xpreciodeVenta,stock=xstock where codigoproducto=xcodpr;
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `Registrar_Cliente`
--

DROP PROCEDURE IF EXISTS `Registrar_Cliente`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Registrar_Cliente`(
in xdni char(8),
in xdatos varchar(50),
in xdireccion varchar(50))
begin
set @num=0;
select count(*)into @num from Cliente;
set @codC=concat('C',right(concat('0000',cast((@num+1) as char)),5));
insert into cliente values(@codC,xdni, xdatos, xdireccion);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `reporteGanancias`
--

DROP PROCEDURE IF EXISTS `reporteGanancias`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporteGanancias`(
in xfecha1 varchar(8),
in xfecha2 varchar(8))
begin
select f.codigofactura,c.datos,f.fecha,f.igv,f.subtotal,f.total from factura f ,cliente c where
             f.codigoccliente=c.codigoccliente and f.total>0 and
                fecha  between xfecha1 and xfecha2 order by subtotal;
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `servicios_insertar`
--

DROP PROCEDURE IF EXISTS `servicios_insertar`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `servicios_insertar`(
in xobservacion varchar(30),
in xcosto decimal(10,2),
in xfecha varchar(8))
begin
set @num=0;
select count(*)into @num from servicios;
set @cods=concat('S',right(concat('0000',cast((@num+1) as char)),5));
insert into servicios values(@cods,xobservacion,xcosto,xfecha);
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `updata_marca_prod`
--

DROP PROCEDURE IF EXISTS `updata_marca_prod`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `updata_marca_prod`(
in xcod varchar(6),
in xnombre varchar(15),
in  xmodelo varchar(15),
in xcaracteristica varchar(50))
begin
update marca_producto set nombre=xnombre,modelo=xmodelo,caracteristicas=xcaracteristica where codigomarca=xcod;
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `update_caja`
--

DROP PROCEDURE IF EXISTS `update_caja`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_caja`(
in xfecha char(8),
in xventas decimal(10,2),
in xreparaciones decimal(10,2),
in xcompras decimal(10,2),
in xtotalefectivo decimal(10,2),
in xtotalventa decimal(10,2))
begin
update caja set ventas=xventas,reparaciones=xreparaciones,compras=xcompras,totalefectivo=xtotalefectivo,totalventa=xtotalventa
where fecha=xfecha;
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `update_empleado`
--

DROP PROCEDURE IF EXISTS `update_empleado`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_empleado`(
in xcodigo char(6),
in xdni char(8),
in xapellidos varchar(30),
in xnombres varchar(30),
in xdireccion varchar(50),
in xemail varchar(40),
in xtelefono char(9))
begin
update empleado set dni=xdni,apellidos=xapellidos,nombres=xnombres,direccion=xdireccion,
email=xemail,telefono=xtelefono,estado='A' where codigoempleado=xcodigo;
commit;
end $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `detallecompra`
--

DROP TABLE IF EXISTS `detallecompra`;
DROP VIEW IF EXISTS `detallecompra`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detallecompra` AS select sum(`d`.`Precio`) AS `total`,`c`.`fecha` AS `fecha` from (`compra` `c` join `detalle_compra` `d`) group by `c`.`fecha` order by 2 desc limit 1;

--
-- Definition of view `reportedeventas`
--

DROP TABLE IF EXISTS `reportedeventas`;
DROP VIEW IF EXISTS `reportedeventas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `reportedeventas` AS select `d`.`codigoFactura` AS `codigoFactura`,`c`.`datos` AS `datos`,`f`.`fecha` AS `fecha`,`e`.`Nombres` AS `nombres`,sum(`d`.`Importe`) AS `importe` from (((`detalle_venta` `d` join `cliente` `c`) join `factura` `f`) join `empleado` `e`) where ((`e`.`CodigoEmpleado` = `d`.`CodigoEmpleado`) and (`f`.`codigoFactura` = `d`.`codigoFactura`) and (`c`.`CodigocCliente` = `f`.`CodigocCliente`)) group by 1;

--
-- Definition of view `v_producto`
--

DROP TABLE IF EXISTS `v_producto`;
DROP VIEW IF EXISTS `v_producto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_producto` AS select `p`.`codigoProducto` AS `codigoproducto`,`m`.`nombre` AS `nombre`,`m`.`modelo` AS `modelo`,`p`.`categoria` AS `categoria`,`p`.`precioVenta` AS `precioventa`,`p`.`operador` AS `operador`,`p`.`Stock` AS `stock` from (`producto` `p` join `marca_producto` `m`) where (`p`.`codigoMarca` = `m`.`codigoMarca`) order by `m`.`nombre`;

--
-- Definition of view `vempleado`
--

DROP TABLE IF EXISTS `vempleado`;
DROP VIEW IF EXISTS `vempleado`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vempleado` AS select `empleado`.`CodigoEmpleado` AS `codigoempleado`,`empleado`.`DNI` AS `dni`,`empleado`.`Apellidos` AS `apellidos`,`empleado`.`Nombres` AS `nombres`,`empleado`.`Direccion` AS `direccion`,`empleado`.`email` AS `email`,`empleado`.`telefono` AS `telefono` from `empleado` where (`empleado`.`estado` = 'a');

--
-- Definition of view `vproducto`
--

DROP TABLE IF EXISTS `vproducto`;
DROP VIEW IF EXISTS `vproducto`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vproducto` AS select `p`.`codigoProducto` AS `codigoproducto`,`m`.`nombre` AS `nombre`,`m`.`modelo` AS `modelo`,`p`.`categoria` AS `categoria`,`p`.`precioVenta` AS `precioventa`,`p`.`operador` AS `operador`,`p`.`Stock` AS `stock` from (`producto` `p` join `marca_producto` `m`) where ((`p`.`codigoMarca` = `m`.`codigoMarca`) and (`p`.`Stock` > 0));

--
-- Definition of view `vrepaciones_caja`
--

DROP TABLE IF EXISTS `vrepaciones_caja`;
DROP VIEW IF EXISTS `vrepaciones_caja`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vrepaciones_caja` AS select sum(`servicios`.`costo`) AS `total_reparaciones`,`servicios`.`fecha` AS `fecha` from `servicios` group by 2 order by 2 desc limit 1;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
