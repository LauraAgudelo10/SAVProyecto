-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-06-2020 a las 03:04:44
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `epractica`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta` (IN `varnumero` INT, IN `varaction` VARCHAR(20))  BEGIN
if varaction ="f" then 
	SELECT a.identificacion,a.nombre as nombreUsuario,a.telefono,f.numficha,p.nombre,al.tipoalternativa FROM epractica.aprendiz a 
	inner join ficha f on a.idficha = f.idficha 
	inner join programasdeformacion p on a.idprograma = p.idprograma 
	inner join alternativa al on a.idalternativa = al.idalternativa 
	where f.numficha = varnumero;
elseif varaction ="a" then 
	SELECT a.identificacion,a.nombre as nombreUsuario,a.telefono,f.numficha,p.nombre,al.tipoalternativa FROM epractica.aprendiz a 
	inner join ficha f on a.idficha = f.idficha 
	inner join programasdeformacion p on a.idprograma = p.idprograma 
	inner join alternativa al on a.idalternativa = al.idalternativa 
	where a.identificacion = varnumero;
    select * from alternativa;
else 
	set @mj ="error";
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDalternativa` (IN `vidalternativa` INT, IN `vtipoalternativa` VARCHAR(100), IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into alternativa values (vidalternativa,vtipoalternativa);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update alternativa set  tipoalternativa = vtipoalternativa where idalternativa = vidalternativa;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from alternativa where idalternativa = vidalternativa;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDaprendiz` (IN `vidaprendiz` INT, IN `vidficha` INT, IN `vidprograma` INT, IN `vidalternativa` INT, IN `videntificacion` INT, IN `vnombre` VARCHAR(255), IN `vtelefono` VARCHAR(12), IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into aprendiz values (vidaprendiz,vidficha,vidprograma,vidalternativa,videntificacion,vnombre,vtelefono);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update aprendiz set  idficha = vidficha, idprograma = vidprograma, idalternativa = vidalternativa, identificacion = videntificacion, nombre = vnombre, telefono = vtelefono where idaprendiz = vidaprendiz;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from aprendiz where idaprendiz = vidaprendiz;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDcadena` (IN `vidcadena` INT, IN `vnombreCadena` VARCHAR(255), IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into cadena values (vidcadena,vnombreCadena);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update cadena set  nombreCadena = vnombreCadena where idcadena = vidcadena;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from cadena where idcadena = vidcadena;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDficha` (IN `vidficha` INT, IN `vidprograma` INT, IN `vnumficha` INT, IN `vtrimestre` INT, IN `vinicioetapalectiva` DATE, IN `vfinetapalectiva` DATE, IN `vinicioetapaproductiva` DATE, IN `vfinetapaproductiva` DATE, IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into ficha values (vidficha,vidprograma,vnumficha,vtrimestre,vinicioetapalectiva,vfinetapalectiva,vinicioetapaproductiva,vfinetapaproductiva);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update ficha set  idprograma = vidprograma, numficha = vnumficha, trimestre = vtrimestre, inicioetapalectiva = vinicioetapalectiva, finetapalectiva = vfinetapalectiva, inicioetapaproductiva = vinicioetapaproductiva, finetapaproductiva = vfinetapaproductiva where idficha = vidficha;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from ficha where idficha = vidficha;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDprogramasdeformacion` (IN `vidprograma` INT, IN `vidcadena` INT, IN `vnombre` VARCHAR(255), IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into programasdeformacion values (vidprograma,vidcadena,vnombre);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update programasdeformacion set  idcadena = vidcadena, nombre = vnombre where idprograma = vidprograma;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from programasdeformacion where idprograma = vidprograma;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDReporte` (IN `vidReporte` INT, IN `vidaprendiz` INT, IN `vidficha` INT, IN `vInicioContrato` DATE, IN `vFinalContrato` DATE, IN `vEstadoContrato` VARCHAR(255), IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into Reporte values (vidReporte,vidaprendiz,vidficha,vInicioContrato,vFinalContrato,vEstadoContrato);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update Reporte set  idaprendiz = vidaprendiz, idficha = vidficha, InicioContrato = vInicioContrato, FinalContrato = vFinalContrato, EstadoContrato = vEstadoContrato where idReporte = vidReporte;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from Reporte where idReporte = vidReporte;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDusuario` (IN `vidusuario` INT, IN `vnombre` VARCHAR(100), IN `vclave` TEXT, IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into usuario values (vidusuario,vnombre ,vclave);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update usuario set  nombre = vnombre, clave = vclave where idusuario = vidusuario;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from usuario where idusuario = vidusuario;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CRUDUsuarioAprendiz` (IN `vidUsuarioAprendiz` INT, IN `vidusuario` INT, IN `vidaprendiz` INT, IN `opcion` VARCHAR(45))  BEGIN
declare msj varchar (255);
case 
when opcion ='guardar' then
	insert into UsuarioAprendiz values (vidUsuarioAprendiz,vidusuario,vidaprendiz);
    set msj = concat('se guardaron los datos  ');
    select msj;
when opcion = 'modificar' then
	update UsuarioAprendiz set  idusuario = vidusuario, idaprendiz = vidaprendiz where idUsuarioAprendiz = vidUsuarioAprendiz;
    set msj = concat('se modifió los datos para ');
    select msj;
when opcion = 'eliminar' then
	delete from UsuarioAprendiz where idUsuarioAprendiz = vidUsuarioAprendiz;
    set msj = 'se eliminó los datos';
    select msj;    
end case;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_login` (`usu` VARCHAR(100), `cla` TEXT)  SELECT * FROM  `usuario` WHERE `nombre`=usu AND `clave`=md5(cla)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alternativa`
--

CREATE TABLE `alternativa` (
  `idalternativa` int(11) NOT NULL,
  `tipoalternativa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `alternativa`
--

INSERT INTO `alternativa` (`idalternativa`, `tipoalternativa`) VALUES
(1, 'Vínculo Laboral'),
(2, 'Proyecto Productivo'),
(3, 'Asesoria A Pymes'),
(4, 'Unidades Productiva Familiares'),
(5, 'Institución Estatal, Municipal, etc.'),
(6, 'Monitorias'),
(7, 'Contrato De Aprendizaje'),
(8, 'Ninguna');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `idaprendiz` int(11) NOT NULL,
  `idficha` int(11) NOT NULL,
  `idprograma` int(11) NOT NULL,
  `idalternativa` int(11) NOT NULL,
  `identificacion` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aprendiz`
--

INSERT INTO `aprendiz` (`idaprendiz`, `idficha`, `idprograma`, `idalternativa`, `identificacion`, `nombre`, `telefono`) VALUES
(1, 1, 1, 1, 1045586453, 'DANIEL JAIME SEPULVEDA GOMEZ', '3117234335'),
(2, 1, 1, 8, 1045586454, 'DABIER GEOVANNY JIMENEZ GIRALDO', '3147229503'),
(3, 1, 1, 8, 1045586455, 'DANIELA ORTIZ SANCHEZ', '3157895234'),
(4, 1, 1, 8, 1045586456, 'CRISTIAN GUSTAVO PARRA RONDON', '3123456735'),
(5, 1, 1, 8, 1045586457, 'DEIVIS ALEJANDRO GARCIA FLOREZ', '3145879095'),
(6, 2, 1, 1, 1000206079, 'JUAN PABLO AREIZA AGUDELO', '4903635'),
(7, 2, 1, 8, 1000206070, 'MARIA CAMILA VELASQUEZ GOMEZ', '3233540191'),
(8, 2, 1, 8, 1000206071, 'LEIDY LAVERDE MERCADO', '3002560741'),
(9, 2, 1, 8, 1000206072, 'JOSE MANUEL ZAPATA VELEZ', '1453336735'),
(10, 2, 1, 7, 1000206073, 'KEVIN DAVID CARDONA ROJAS', '3193331957'),
(11, 3, 1, 7, 1035783854, 'JUAN PABLO HERNANDEZ ORTIZ', '3113760982'),
(12, 3, 1, 1, 103578385, 'DIEGO ALEJANDRO CASTRILLON TORRES', '3135799574'),
(13, 3, 1, 8, 1035783856, 'JUAN DIEGO GUTIERREZ ARANGO', '3507645405'),
(14, 3, 1, 8, 1035783857, 'JOHN ESTIVEN MONTOYA CORREA', '3108944586'),
(15, 3, 1, 8, 1035783858, 'DANIEL ALEXANDER ORTIZ GALEANO', '3218089305'),
(16, 4, 2, 8, 1001444753, 'ESTEBAN SALINAS MUÑOZ', '3194234525'),
(17, 4, 2, 8, 1001444754, 'ALISON DANIELA BRAN PECHENE', '3015246791'),
(18, 4, 2, 1, 1001444755, 'AURA ROSA VARGAS PARRA', '3226374708'),
(19, 4, 2, 1, 1001444756, 'JUAN PABLO OROZCO RAMIREZ', '3054310355'),
(20, 4, 2, 1, 1001444757, 'SARA GALVIS BOTERO', '3022468567'),
(21, 5, 2, 8, 1000855864, 'LEIDY VANESSA ORTIZ NARVAEZ', '3212693619'),
(22, 5, 2, 8, 1000855865, 'STEPHEN ALEJANDRO MUÑOZ BOTERO', '3212693620'),
(23, 5, 2, 8, 1000785586, 'JOSE ARMANDO SEPULVEDA GARCIA', '3212693621'),
(24, 5, 2, 8, 1000845587, 'YEISON DE JESUS LONDOÑO BLANDON', '3212693622'),
(25, 5, 2, 8, 1000855868, 'JORMAN ALEXANDER RAMIREZ ALVAREZ', '3212693623'),
(26, 6, 2, 8, 1000190881, 'MELANNY CANO HINCAPIE', '3004494871'),
(27, 6, 2, 8, 1000190882, 'SANTIAGO ECHEVERRI GAVIRIA', '3004494872'),
(28, 6, 2, 8, 1000190883, 'CAMILO AGUDELO TAPIAS', '3004494873'),
(29, 6, 2, 8, 1000190884, 'LEYDI VANESSA RENDON ALVAREZ', '3004494874'),
(30, 6, 2, 8, 1000190885, 'FABIO LEON ALVAREZ DIAZ', '3004494875'),
(31, 7, 3, 8, 1000445121, 'GRACE HERRERA URIBE', '3213720459'),
(32, 7, 3, 8, 1000445122, 'SEBASTIAN CANO MONTOYA', '3045254925'),
(33, 7, 3, 8, 1000445123, 'JOHAN DARLEY MONSALVE CARO', '3217725566'),
(34, 7, 3, 8, 1000445124, 'JAMES DAVID CIRO', '3003163077'),
(35, 7, 3, 2, 1000445125, 'JOHAN DAVID ROMAÑA ARROYO', '3005236277'),
(36, 8, 3, 8, 1020477300, 'GEORGE BRANDON HOLGUIN MONSALVE', '3194334565'),
(37, 8, 3, 8, 1020477301, 'KENAN ALVAREZ CANO', '3206084678'),
(38, 8, 3, 8, 1020477302, 'ERIK JHOAN SIERRA DAGUA', '3043845144'),
(39, 8, 3, 8, 1020477303, 'MARILYN BETANCUR SANCHEZ', '3016369077'),
(40, 8, 3, 8, 1020477304, 'MARILYN CASTAÑO JARAMILLO', '3053455237'),
(41, 9, 3, 8, 2147483647, 'CRISTIER ARMANDO TORO CARDENAS', '3003362022'),
(42, 9, 3, 8, 2147483647, 'BRAYAN HENAO JARAMILLO', '3023972235'),
(43, 9, 3, 8, 2147483647, 'JUAN ESTEBAN SEPULVEDA SEPULVEDA', '3023122222'),
(44, 9, 3, 8, 2147483647, 'LEISY LILIANA SANCHEZ TORRES', '3148564444'),
(45, 9, 3, 8, 2147483647, 'ANDRES MAURICIO GOMEZ', '3115876279'),
(46, 10, 4, 7, 1007623523, 'GUSTAVO RAMIRO CUELLO OJEDA', '3136588697'),
(47, 10, 4, 7, 1007623524, 'LUIS MANUEL TORRES QUIÑONEZ', '3226504534'),
(48, 10, 4, 1, 1007623525, 'MATEO LONDOÑO SANCHEZ', '3044415827'),
(49, 10, 4, 8, 1007623526, 'SOFIA GUERRA TORRES', '3218508353'),
(50, 10, 4, 8, 1007623527, 'KLIVER ANDRES PACHECO ARANGO', '3202476780'),
(51, 11, 4, 7, 1001745450, 'YERLIS ROCIO PEREIRA SIERRA', '3122657455'),
(52, 11, 4, 7, 1001745451, 'SANTIAGO DE JESUS MAZO MAZO', '3117114595'),
(53, 11, 4, 8, 1001745452, 'SANTIAGO VELASQUEZ HERRERA', '6002011'),
(54, 11, 4, 8, 1001745453, 'JHASAZARAY LOPEZ JASSA', '3138438333'),
(55, 11, 4, 7, 1001745454, 'KATERINE JUDITH RAMIREZ SALGADO', '3004533275'),
(56, 12, 4, 8, 1045233211, 'ANLLY DANIELA RAMIREZ CASTAÑEDA', '3136004463'),
(57, 12, 4, 1, 1045233212, 'SEBASTIAN HERNANDEZ TORO', '3005331222'),
(58, 12, 4, 7, 1045233213, 'ALEJANDRA PINEDA GONZALEZ', '3105273234'),
(59, 12, 4, 1, 1045233214, 'TATIANA BUILES CIRO', '3136144430'),
(60, 12, 4, 7, 1045233215, 'JERSON DAVID PASTRANA GARCIA', '3137456787'),
(61, 13, 5, 7, 1094283001, 'FREDY CEPEDA JAIMES', '3003296333'),
(62, 13, 5, 1, 1094283002, 'URIEL ALEXANDER MUÑOZ MORENO', '3023701333'),
(63, 13, 5, 2, 1094283003, 'ANDRES FERNANDO CORDOBA SOTO', '3148344905'),
(64, 13, 5, 8, 1094283004, 'SEBASTIAN BENAVIDES SEISA', '3023656729'),
(65, 13, 5, 8, 1094283005, 'JULIAN ALEXANDER TORRES CUEVAS', '3046236426'),
(66, 14, 5, 8, 1020673343, 'JUAN FERNANDO BETANCUR GUTIERREZ', '3206255256'),
(67, 14, 5, 8, 1020673344, 'BRYAM ALEXIS SALDARRIAGA OROZCO', '572657557'),
(68, 14, 5, 8, 1020673345, 'CESAR DAVID GALVIS HERNANDEZ', '3023751555'),
(69, 14, 5, 8, 1020673346, 'MAICOLL ANDRES GAVIRIA OCHOA', '3127504490'),
(70, 14, 5, 8, 1020673347, 'DAVID FERNANDO RESTREPO GONZALEZ', '3136922778'),
(71, 15, 5, 7, 1128453452, 'ANDRES CAMILO ORTIZ RESTREPO', '3205633241'),
(72, 15, 5, 8, 1128453453, 'MARCELO POSADA AMAYA', '3033334457'),
(73, 15, 5, 1, 1128453454, 'DANIEL MUNERA JIMENEZ', '3103381938'),
(74, 15, 5, 7, 1128453455, 'ERWIN ALEJANDRO ARTEAGA TAMAYO', '3115224767'),
(75, 15, 5, 8, 1128453456, 'MATEO OSORIO BAÑOL', '3222144683'),
(76, 16, 6, 7, 1000743345, 'MARIA PAULA MORENO RODRIGUEZ', '3014451180'),
(77, 16, 6, 8, 1000743346, 'JHOAN ALEXANDER MARIN CARDONA', '6026657'),
(78, 16, 6, 8, 1000743347, 'YICELA VILLADA SANCHEZ', '3178966702'),
(79, 16, 6, 8, 1000743348, 'DAVID AICARDO AGUDELO PATIÑO', '3045222036'),
(80, 16, 6, 2, 1000743349, 'ANA YISETH MARTINEZ MOSQUERA', '3012334204'),
(81, 17, 6, 8, 1000565742, 'LEDY JACKELINE YAGARI MEJIA', '3013334713'),
(82, 17, 6, 8, 1000565743, 'HAROLD ANDRES YEPES LEZCANO', '2354338'),
(83, 17, 6, 1, 1000565744, 'ANDERSON MORENO MOSQUERA', '3052327617'),
(84, 17, 6, 8, 1000565745, 'KELLY VANESA FLOREZ GARCIA', '3006843236'),
(85, 17, 6, 8, 1000565746, 'MARIA CAMILA ACOSTA MANCHEGO', '3182546334'),
(86, 18, 6, 8, 1037260075, 'WILSON ZAPATA CORREA', '3133457326'),
(87, 18, 6, 8, 1037260076, 'MARIA DEL CARMEN VILLAR HURTADO', '3148466322'),
(88, 18, 6, 8, 1037260077, 'JULIAN ANDRES MARROQUIN RESTREPO', '3024623441'),
(89, 18, 6, 8, 1037260078, 'KATHERINE ANDREA VASQUEZ OYOLA', '3016567835'),
(90, 18, 6, 8, 1037260079, 'DAYANA MARCELA HERRERA FOLIACO', '3153333978'),
(91, 19, 7, 8, 1007633345, 'JHON ANDRES FRANCO CAMARGO', '3128908635'),
(92, 19, 7, 8, 1007633346, 'CARLOS ADOLFO CARDONA VARGAS', '3003017231'),
(93, 19, 7, 8, 1007633347, 'DANIEL FELIPE QUINTO GARCIA', '3147830754'),
(94, 19, 7, 8, 1007633348, 'JOHAN SEBASTIAN RODRIGUEZ GALLEGO', '5712670759'),
(95, 19, 7, 8, 1007633349, 'JULIAN ESCOBAR MANRIQUE', '3008454332'),
(96, 20, 7, 8, 1234788892, 'ALIRIO DE JESUS QUINTERO TANGARIFE', '3044173711'),
(97, 20, 7, 8, 1234788893, 'ANGEL MARIA TABAREZ', '3023380111'),
(98, 20, 7, 2, 1234788894, 'JORGE OCTAVIO ZAPATA', '2622611'),
(99, 20, 7, 8, 1234788895, 'JAIRO ALFONSO LOPEZ SANCHEZ', '3126330211'),
(100, 20, 7, 8, 1234788896, 'CARLOS HUMBERTO OCHOA ISAZA', '2849611'),
(101, 21, 7, 7, 1000892121, 'FERNANDO JOSE DURANGO GUISAO', '3146444211'),
(102, 21, 7, 2, 1000892122, 'MARLON STIVEN GARCIA MADRID', '3226654711'),
(103, 21, 7, 8, 1000892123, 'ESAU RAMIREZ RENGIFO', '3173385111'),
(104, 21, 7, 8, 1000892124, 'JOSE MARTIN VASQUEZ ACEVEDO', '4619511'),
(105, 21, 7, 2, 1000892125, 'MIGUEL ANGEL LAYOS ARANGO', '3225994411'),
(106, 22, 8, 8, 1006407563, 'MICHAEL YORDAN FIGUEROA GOMEZ', '3143468622'),
(107, 22, 8, 8, 1006407564, 'ANDERSON DUBAN MUÑOZ BLANDON', '3870923228'),
(108, 22, 8, 8, 1006407565, 'JHON WILSON CARDONA GUEVARA', '3234109422'),
(109, 22, 8, 8, 1006407566, 'WILDER NAVA SANCHEZ', '3196636722'),
(110, 22, 8, 8, 1006407567, 'JULIO ARMANDO HENAO ZAMBRANO', '3123936522'),
(111, 23, 8, 7, 1026161684, 'MATEO OSPINA GOMEZ', '57338644'),
(112, 23, 8, 8, 1026161684, 'ROBERTO ALEJANDRO FLOREZ GAVIRIA', '3007444028'),
(113, 23, 8, 1, 1026161685, 'ANDRES FELIPE BEJARANO ANDRADE', '3504446245'),
(114, 23, 8, 8, 1026161687, 'SANTIAGO VALENCIA ROLDAN', '5990044'),
(115, 23, 8, 8, 1026161688, 'STIVEN CASTRO GAVIRIA', '3443115909'),
(116, 24, 8, 8, 1007306302, 'MIGUEL ANGEL CORREA PINO', '3122648482'),
(117, 24, 8, 8, 1007306303, 'ANDRES FERNANDO ZUÑIGA PIÑERES', '3225890501'),
(118, 24, 8, 8, 1007306304, 'CRISTIAN DAVID GOMEZ RESTREPO', '3016500102'),
(119, 24, 8, 8, 1007306305, 'JUAN JOSE RUA VELEZ', '3006199572'),
(120, 24, 8, 7, 1007306306, 'JESUS DAVID GALLEGO RIVERA', '3167048232'),
(121, 25, 9, 8, 71372223, 'DARIO ALEXANDER MONTOYA PORRAS', '5583722'),
(122, 25, 9, 8, 71372224, 'JOHN FREDY CORREA MADRID', '5822086'),
(123, 25, 9, 8, 71372225, 'PABLO ENRIQUE ROJAS VILLAMIL', '2283141'),
(124, 25, 9, 7, 71372226, 'IGNACIO ROSAS RAMIREZ', '3122815773'),
(125, 25, 9, 1, 71372227, 'WILSON JOSE COPETE MOSQUERA', '3102275425'),
(126, 26, 9, 2, 1042257322, 'MATEO BARRERO COLORADO', '3127543357'),
(127, 26, 9, 2, 1042257323, 'CARLOS ANDRES MORENO PANESSO', '3371117333'),
(128, 26, 9, 2, 1042257324, 'RICHARD CLAYDERMAN ROJO RUA', '3194533358'),
(129, 26, 9, 2, 1042257325, 'DAVID CANDELA CASTILLO', '3145383919'),
(130, 26, 9, 2, 1042257326, 'DAYRON LUIS MOSQUERA MOSQUERA', '3133775515'),
(131, 27, 9, 8, 1017276464, 'JUAN PABLO BOLIVAR ORREGO', '12938658'),
(132, 27, 9, 8, 1017276465, 'JONATAN ESTIP VILLA CARTAGENA', '3227555248'),
(133, 27, 9, 8, 1017276466, 'JONNY ALEJANDRO BETANCUR ESTRADA', '3006065355'),
(134, 27, 9, 8, 1017276467, 'ANA MARIA PERDOMO ROJAS', '3153108553'),
(135, 27, 9, 8, 1017276468, 'VICTOR JUNIOR MATUTE SOUZA', '2171665'),
(136, 28, 10, 8, 1000084562, 'ESTEBAN CASTAÑO MARULANDA', '1233927244'),
(137, 28, 10, 8, 1000084563, 'KEVIN DANIEL GUZMAN RIOS', '4955392434'),
(138, 28, 10, 8, 1000084563, 'ALBER ANDRES DURANGO CARVAJAL', '3122737255'),
(139, 28, 10, 8, 1000084564, 'VICTOR HUGO CASTAÑEDA PUERTA', '3013095766'),
(140, 28, 10, 8, 1000084565, 'CRISTIAN CAMILO LOPEZ GONZALEZ', '2928052779'),
(141, 29, 10, 8, 1007558455, 'JUAN PABLO MUÑOZ YOTAGRI', '3046555501'),
(142, 29, 10, 8, 1007558456, 'DANIEL OSORIO GRANADOS', '3057521557'),
(143, 29, 10, 8, 1007558457, 'WILLIAM ALEXIS AGUIRRE RUEDA', '3015582475'),
(144, 29, 10, 8, 1007558458, 'JORGE ANDRES CORREA MUÑOZ', '3013155336'),
(145, 29, 10, 8, 1007558459, 'KEVIN JOHAN GUTIERREZ CANO', '3195504807'),
(146, 30, 10, 7, 1039033452, 'BRANDON VANEGAS MESA', '3195924344'),
(147, 30, 10, 8, 1039033453, 'LUIS FERNANDO GRAJALES CARVAJAL', '3016429444'),
(148, 30, 10, 8, 1039033454, 'FELIPE VASQUEZ ARBOLEDA', '3226411444'),
(149, 30, 10, 1, 1039033455, 'YOMAR DAVID MORENO VILLADIEGO', '3207836444'),
(150, 30, 10, 8, 1039033456, 'FEDERICO MONTOYA HINCAPIE', '3102102444'),
(151, 31, 11, 7, 1125473432, 'DANIEL JULIAN SANCHEZ MAZO', '3172644444'),
(152, 31, 11, 8, 1125473433, 'ROBINSON ESTEBAN PEREZ QUINTERO', '3106636444'),
(153, 31, 11, 1, 1125473434, 'MATEO ANDRES RESTREPO JIMENEZ', '3192926444'),
(154, 31, 11, 8, 1125473435, 'JUAN DAVID QUINTANA LOAIZA', '3043404444'),
(155, 31, 11, 8, 1125473436, 'GUSTAVO CRUZ CARDOZO', '3123848444'),
(156, 32, 11, 2, 1013358900, 'SEBASTIAN DARIO MARIN RENDON', '3235122222'),
(157, 32, 11, 2, 1013358901, 'OSCAR DAVID BARON PASTRANA', '3145240222'),
(158, 32, 11, 2, 1013358902, 'ANDRES FELIPE OQUENDO COSSIO', '3005417222'),
(159, 32, 11, 2, 1013358903, 'JUAN DIEGO RUIZ OCAMPO', '3234596222'),
(160, 32, 11, 2, 1013358904, 'JOHN FREDY VALENCIA ZAPATA', '3192079222'),
(161, 33, 11, 7, 1000414565, 'MIKE HERNANDEZ CASAS', '3016244333'),
(162, 33, 11, 8, 1000414566, 'GILBERTO ANDRES CASTAÑO RIVERA', '3044887333'),
(163, 33, 11, 1, 1000414567, 'MIGUEL ANGEL MARTINEZ MONTENEGRO', '4877850333'),
(164, 33, 11, 7, 1000414568, 'LUISA FERNANDA MONSALVE TABORDA', '3004830333'),
(165, 33, 11, 8, 1000414569, 'DARLIN JUVERLEY PEREZ QUINTANA', '3045409333'),
(166, 34, 12, 2, 1035440453, 'FERNEY KURT ESPINAL RIVERA', '3162066464'),
(167, 34, 12, 2, 1035440454, 'JOSE ANGEL PANIAGUA VARGAS', '4384333'),
(168, 34, 12, 2, 1035440455, 'JUAN JOSE OSSA LOPEZ', '5855432'),
(169, 34, 12, 8, 1035440456, 'SNEIDER ALVAREZ ARIAS', '3173437768'),
(170, 34, 12, 8, 1035440457, 'JUAN DAVID RODRIGUEZ MUÑOZ', '2296456'),
(171, 35, 12, 7, 1000884440, 'CRISTIAN CAMILO TEJADA AGUDELO', '3006735833'),
(172, 35, 12, 1, 1000884441, 'FERNANDO JOSE BARON BERASTEGUI', '3122879833'),
(173, 35, 12, 1, 1000884442, 'JULIAN JAVIER SALGADO PEREZ', '3043566733'),
(174, 35, 12, 2, 1000884443, 'JUAN PABLO HERNANDEZ LONDOÑO', '6002888'),
(175, 35, 12, 2, 1000884444, 'BELMAR DUVAN GOMEZ MOLINA', '3128144895'),
(176, 36, 12, 1, 1000194072, 'CAMILO LONDOÑO OSORIO', '5286335444'),
(177, 36, 12, 1, 1000194073, 'JEFREY ORTEGA VALDES', '3017392444'),
(178, 36, 12, 2, 1000194074, 'JUAN PABLO GOMEZ ISAZA', '4810044'),
(179, 36, 12, 2, 1000194075, 'JOSE DAVID MUÑOZ SUAREZ', '3003720744'),
(180, 36, 12, 2, 1000194076, 'JUAN MANUEL GALVEZ DIAZ', '5712127744'),
(181, 37, 13, 7, 1000637943, 'LUZ PATRICIA RAMOS BUSTAMANTE', '3107630245'),
(182, 37, 13, 1, 1000637942, 'HENRY GARCIA BERRIO', '3138135946'),
(183, 37, 13, 8, 1000637945, 'HUGO ALEXANDER CATAÑO CASTAÑO', '3166034147'),
(184, 37, 13, 8, 1000637944, 'JAVIER JOSE JULIO DIAZ', '3106754448'),
(185, 37, 13, 8, 1000637948, 'JOSE LUIS CUETO PEÑATE', '3203587449'),
(186, 38, 13, 2, 1000637950, 'STEFANNY VANEGAS CALLES', '3023741365'),
(187, 38, 13, 8, 1000637951, 'CARLOS ALBERTO CANO HURTADO', '3124567242'),
(188, 38, 13, 8, 1000637952, 'ELIATC RANGEL SOTELO', '3042052956'),
(189, 38, 13, 2, 1000637953, 'JONATHAN ZAPATA COTAMO', '3144255078'),
(190, 38, 13, 2, 1000637954, 'LUIS FERNANDO MORENO MENA', '3116635333'),
(191, 39, 13, 2, 100063731, 'SANTIAGO QUIROZ GOMEZ', '3113647644'),
(192, 39, 13, 8, 100063732, 'SANTIAGO MORALES RESTREPO', '3177021455'),
(193, 39, 13, 8, 100063733, 'JHOMMY ELKIN COPETE GARCIA', '3222703156'),
(194, 39, 13, 2, 100063734, 'BRIAN STEVEN BEDOYA MEDINA', '3012816957'),
(195, 39, 13, 7, 100063735, 'CRISTIAN CAMILO RINCON PEREZ', '3112635958'),
(196, 40, 14, 1, 1000901456, 'MATEO ARBOLEDA LOAIZA', '602209545'),
(197, 40, 14, 8, 1000901457, 'DANILO HERNANDEZ FABRA', '3054859221'),
(198, 40, 14, 8, 1000901458, 'LEIDER BLANCO BARCO', '3013734677'),
(199, 40, 14, 8, 1000901459, 'YEINER ALEJANDRO LUNA ALVARADO', '3137726789'),
(200, 40, 14, 2, 1000901460, 'BRYAN MALAGON TANGARIFE', '234567655'),
(201, 41, 14, 7, 1000901461, 'ESTEBAN PAIPILLA TOBON', '596346055'),
(202, 41, 14, 1, 1000901462, 'NICOLAS RAMIREZ FONSECA', '614025655'),
(203, 41, 14, 1, 1128276603, 'JUAN DAVID URREGO MONTERO', '588860551'),
(204, 41, 14, 8, 1214744866, 'SEBASTIAN GOMEZ GIRALDO', '504535590'),
(205, 41, 14, 8, 1001346865, 'MARIA FERNANDA ESCARRAGA DE LA ROSA', '305329855'),
(206, 42, 14, 7, 1001131990, 'DUVAN DE JESUS BURITICA DUQUE', '3136978044'),
(207, 42, 14, 1, 1001142291, 'VICTOR MANUEL CASTAÑO VERGARA', '3117978544'),
(208, 42, 14, 8, 1007633792, 'DUVAN ANDRES MESA MONSALVE', '3197214484'),
(209, 42, 14, 7, 1017174593, 'DANIEL SALAZAR OCHOA', '3225611744'),
(210, 42, 14, 7, 1020106694, 'DAVID ALEXANDER GUTIERREZ GONZALEZ', '3507513544'),
(211, 43, 15, 8, 1001025344, 'JHONATAN ANDRES MENDOZA PEREZ', '3158320345'),
(212, 43, 15, 8, 1001025345, 'FREDY MANUEL HOYOS LUNA', '5730424361'),
(213, 43, 15, 8, 1063363946, 'CARLOS JULIO MORELO ARIAS', '3113591346'),
(214, 43, 15, 8, 1000535147, 'LUNA CAMILA NARANJO MONSALVE', '2214623456'),
(215, 43, 15, 8, 1003177948, 'CAROLI CABALLERO ZABALA', '3136522579'),
(216, 44, 15, 1, 1000099352, 'MATEO RIVERA GAVIRIA', '5385456'),
(217, 44, 15, 7, 1000099353, 'JOSE LEONARDO SANCHEZ LEON', '3103925567'),
(218, 44, 15, 1, 1000099354, 'JUAN PABLO', 'RAMIREZ RODR'),
(219, 44, 15, 1, 1000099355, 'IVAN DANIEL RODRIGUEZ PEREZ', '3216124558'),
(220, 44, 15, 8, 1000099356, 'JEAN EDIER GONZALEZ GARCIA', '3052663562'),
(221, 45, 15, 8, 1037544325, 'JUAN CARLOS VASQUEZ ALZATE', '5718664555'),
(222, 45, 15, 8, 1037544326, 'FRANCISCO JAVIER MORALES TORO', '3126615665'),
(223, 45, 15, 8, 1037544327, 'JULIAN SERNA PALACIO', '3178874567'),
(224, 45, 15, 8, 1037544328, 'JUAN MANUEL RAIGOSA MESA', '3008414442'),
(225, 45, 15, 8, 1037544328, 'JULIAN ESTEBAN ARANGO DUQUE', '5714679678'),
(226, 1, 1, 1, 1044682478, 'ANDRES FELIPE MARIN DIAZ', '6039287'),
(227, 1, 1, 7, 1194430972, 'JESUS MANUEL SANCHEZ MERCADO', '3127924895'),
(228, 1, 1, 1, 1444093953, 'ESTEBAN SANTOS TASCON', '3158010004'),
(229, 3, 1, 7, 16660411, 'Nell Stewart', '1-850-626-29'),
(230, 1, 1, 5, 16120222, 'Barry Curtis', '1-109-564-06'),
(231, 1, 1, 3, 16020625, 'Todd Collier', '1-933-385-56'),
(232, 3, 1, 5, 16760428, 'Nevada Sharp', '1-466-381-63'),
(233, 3, 1, 5, 16950630, 'Thomas Murray', '1-171-534-92'),
(234, 1, 1, 5, 16540503, 'Jenna Summers', '1-462-908-63'),
(235, 2, 1, 5, 16000801, 'Devin Blackwell', '1-976-657-73'),
(236, 1, 1, 3, 16471026, 'Thaddeus Fischer', '1-671-781-40'),
(237, 2, 1, 5, 16150416, 'Chancellor Anthony', '1-897-764-70'),
(238, 1, 1, 4, 16730227, 'Eagan Dillon', '1-542-813-97'),
(239, 1, 1, 3, 16051029, 'Leilani Drake', '1-899-113-54'),
(240, 3, 1, 5, 16641009, 'Destiny Wiggins', '1-732-951-82'),
(241, 2, 1, 6, 16160719, 'Ezekiel Curtis', '1-636-156-13'),
(242, 2, 1, 6, 16861114, 'Honorato Terry', '1-897-731-64'),
(243, 3, 1, 4, 16270605, 'Solomon Pittman', '1-491-807-55'),
(244, 3, 1, 1, 16020123, 'Cadman Wallace', '1-430-480-27'),
(245, 3, 1, 3, 16050218, 'Bernard Noble', '1-953-326-87'),
(246, 3, 1, 3, 16950416, 'Holmes Emerson', '1-951-625-78'),
(247, 3, 1, 7, 16611028, 'Damian Randolph', '1-450-308-33'),
(248, 3, 1, 1, 16570202, 'Colt Warner', '1-425-802-83'),
(249, 3, 1, 7, 16811025, 'Castor Wolfe', '1-151-470-84'),
(250, 2, 1, 8, 16551104, 'Kalia Dean', '1-785-642-01'),
(251, 1, 1, 3, 16230706, 'Eagan Brennan', '1-984-864-15'),
(252, 2, 1, 1, 16701111, 'Abra Reyes', '1-580-548-17'),
(253, 1, 1, 6, 16330307, 'Amery Nelson', '1-970-311-49'),
(254, 3, 1, 4, 16080408, 'Duncan Hodge', '1-546-561-89'),
(255, 3, 1, 8, 16650607, 'Kevyn Potts', '1-830-452-55'),
(256, 1, 1, 4, 16540712, 'Drake Taylor', '1-548-420-62'),
(257, 2, 1, 7, 16020402, 'Oscar Pugh', '1-986-688-47'),
(258, 2, 1, 3, 16110318, 'Emerson Myers', '1-143-255-72'),
(259, 3, 1, 2, 16210329, 'Len Mejia', '1-550-723-57'),
(260, 3, 1, 6, 16500328, 'Denise Park', '1-779-683-70'),
(261, 2, 1, 1, 16010313, 'Britanney Rowland', '1-490-672-00'),
(262, 1, 1, 3, 16690503, 'Iris Lott', '1-216-891-87'),
(263, 2, 1, 5, 16240801, 'Maxwell Rios', '1-221-196-53'),
(264, 2, 1, 6, 16230711, 'Lavinia Waller', '1-486-192-68'),
(265, 2, 1, 1, 16171023, 'Pascale Cote', '1-309-237-74'),
(266, 2, 1, 1, 16310514, 'Wynter Nielsen', '1-479-853-67'),
(267, 3, 1, 2, 16490325, 'Chester Mack', '1-379-307-88'),
(268, 3, 1, 8, 16490106, 'Elmo Acosta', '1-291-329-10'),
(269, 2, 1, 2, 16811108, 'Randall Hyde', '1-462-269-49'),
(270, 1, 1, 1, 16030425, 'Acton Stevenson', '1-265-681-64'),
(271, 1, 1, 4, 16131201, 'Jordan Norris', '1-500-440-96'),
(272, 1, 1, 7, 16000106, 'Evelyn Holcomb', '1-892-251-44'),
(273, 3, 1, 2, 16701013, 'Rebecca Irwin', '1-475-451-10'),
(274, 1, 1, 8, 16061022, 'Xavier Wheeler', '1-989-271-11'),
(275, 3, 1, 8, 16380229, 'Blaze Bowman', '1-567-365-52'),
(276, 3, 1, 1, 16321215, 'Aretha Alvarado', '1-994-874-56'),
(277, 2, 1, 3, 16390115, 'Shea Tran', '1-700-171-79'),
(278, 2, 1, 8, 16370630, 'Vincent Carson', '1-220-526-03'),
(279, 3, 1, 4, 16520507, 'Maite Tucker', '1-215-468-14'),
(280, 2, 1, 2, 16571221, 'Quentin Mack', '1-491-455-83'),
(281, 3, 1, 5, 16160321, 'Emma Randolph', '1-380-977-64'),
(282, 3, 1, 6, 16950405, 'Stone Mullins', '1-970-535-09'),
(283, 2, 1, 2, 16061126, 'Amery Cameron', '1-253-215-59'),
(284, 1, 1, 7, 16410308, 'Aphrodite Chavez', '1-620-669-66'),
(285, 1, 1, 4, 16300917, 'Marcia Perkins', '1-511-654-57'),
(286, 1, 1, 1, 16700310, 'Eric Frost', '1-826-289-89'),
(287, 3, 1, 1, 16311123, 'Lysandra Rich', '1-181-195-21'),
(288, 2, 1, 8, 16800408, 'Arden Spencer', '1-403-222-67'),
(289, 3, 1, 6, 16780727, 'Iola Joseph', '1-151-150-92'),
(290, 3, 1, 7, 16220524, 'Molly Salas', '1-892-317-66'),
(291, 1, 1, 1, 16260507, 'Elijah Peterson', '1-451-938-84'),
(292, 3, 1, 3, 16380210, 'Ebony Petersen', '1-183-327-32'),
(293, 2, 1, 1, 16510804, 'Connor Duke', '1-556-409-05'),
(294, 3, 1, 4, 16450411, 'Quintessa Golden', '1-971-459-86'),
(295, 3, 1, 3, 16590609, 'Dara Acevedo', '1-381-340-96'),
(296, 2, 1, 1, 16180918, 'Mira Holmes', '1-595-810-17'),
(297, 3, 1, 3, 16290829, 'Blake Wilkins', '1-418-800-24'),
(298, 2, 1, 7, 16150123, 'Cairo Norton', '1-435-367-27'),
(299, 3, 1, 2, 16251121, 'Edan Richmond', '1-243-615-86'),
(300, 3, 1, 3, 16670318, 'Victor Evans', '1-977-112-54'),
(301, 2, 1, 8, 16530927, 'Inez Palmer', '1-140-428-52'),
(302, 3, 1, 7, 16711026, 'Morgan Montgomery', '1-705-109-56'),
(303, 3, 1, 4, 16841225, 'Elizabeth Oneil', '1-505-576-42'),
(304, 2, 1, 8, 16690628, 'Neville Frazier', '1-941-263-00'),
(305, 1, 1, 7, 16360628, 'Sandra Sawyer', '1-919-156-91'),
(306, 3, 1, 8, 16040218, 'Glenna Kerr', '1-190-502-47'),
(307, 2, 1, 6, 16450106, 'Jack Page', '1-906-403-16'),
(308, 2, 1, 6, 16930519, 'Ulla Carlson', '1-938-737-32'),
(309, 2, 1, 3, 16100809, 'Justina Silva', '1-363-312-77'),
(310, 1, 1, 6, 16550921, 'Rudyard Horton', '1-249-795-60'),
(311, 2, 1, 7, 16251019, 'Olympia Luna', '1-277-496-24'),
(312, 1, 1, 7, 16550428, 'Joshua Henson', '1-308-130-96'),
(313, 3, 1, 1, 16031225, 'Cameran Hickman', '1-116-949-12'),
(314, 3, 1, 1, 16160614, 'Chaney Spencer', '1-238-210-67'),
(315, 3, 1, 5, 16861207, 'Alexandra Sweet', '1-920-786-38'),
(316, 1, 1, 5, 16651107, 'Chandler Lopez', '1-797-534-36'),
(317, 2, 1, 6, 16871220, 'Ahmed Mcdowell', '1-414-691-00'),
(318, 1, 1, 8, 16580911, 'Lucian Schneider', '1-425-990-29'),
(319, 2, 1, 8, 16630526, 'Hiram Tyson', '1-124-860-96'),
(320, 2, 1, 5, 16001027, 'Dane Higgins', '1-672-562-05'),
(321, 2, 1, 2, 16201023, 'Thomas Maldonado', '1-602-299-06'),
(322, 1, 1, 3, 16900529, 'Neville Patton', '1-478-855-26'),
(323, 3, 1, 2, 16610921, 'Tyrone Williams', '1-555-103-36'),
(324, 1, 1, 6, 16650306, 'Christopher Mcmillan', '1-688-534-50'),
(325, 2, 1, 6, 16420911, 'Avram Crane', '1-169-180-89'),
(326, 2, 1, 3, 16780621, 'Felix Mcclain', '1-157-716-10'),
(327, 3, 1, 3, 16530101, 'Abra Woods', '1-162-863-14'),
(328, 2, 1, 7, 16520628, 'Jacqueline Cox', '1-165-420-95'),
(329, 4, 2, 7, 16590626, 'Shana Abbott', '1-317-704-45'),
(330, 5, 2, 5, 16560308, 'Nigel Hartman', '1-387-399-12'),
(331, 6, 2, 8, 16060513, 'Kasimir Mcguire', '1-185-599-30'),
(332, 5, 2, 4, 16860208, 'Hilel Kaufman', '1-420-745-29'),
(333, 4, 2, 4, 16561105, 'Laith Stanley', '1-863-212-67'),
(334, 5, 2, 1, 16730322, 'Jonah Soto', '1-574-783-41'),
(335, 6, 2, 4, 16460210, 'Silas Bentley', '1-535-248-24'),
(336, 4, 2, 4, 16190618, 'Solomon Murphy', '1-926-618-50'),
(337, 5, 2, 5, 16000422, 'Hop Russell', '1-481-662-84'),
(338, 4, 2, 2, 16110615, 'Kermit Cooper', '1-907-369-52'),
(339, 4, 2, 5, 16700915, 'Gail Willis', '1-614-174-67'),
(340, 5, 2, 6, 16581018, 'Autumn Walker', '1-684-991-39'),
(341, 6, 2, 2, 16720713, 'Scott Gregory', '1-433-750-17'),
(342, 4, 2, 5, 16870419, 'Hamish Knox', '1-337-477-00'),
(343, 4, 2, 6, 16820305, 'Quon Rosario', '1-226-286-17'),
(344, 6, 2, 5, 16030919, 'Zephr Hill', '1-425-228-90'),
(345, 5, 2, 8, 16060722, 'Irma Hunt', '1-442-784-69'),
(346, 4, 2, 3, 16880212, 'Wang Bullock', '1-870-225-10'),
(347, 4, 2, 4, 16370921, 'Penelope Hopkins', '1-241-513-76'),
(348, 4, 2, 7, 16460305, 'Price Chaney', '1-236-676-92'),
(349, 5, 2, 8, 16870310, 'Hakeem Barber', '1-325-253-03'),
(350, 6, 2, 1, 16360302, 'Lionel Bowman', '1-610-509-35'),
(351, 5, 2, 3, 16330819, 'Michael Frederick', '1-825-291-42'),
(352, 5, 2, 8, 16050129, 'Ava Sweet', '1-251-384-27'),
(353, 4, 2, 3, 16760523, 'Wynter Blair', '1-831-804-54'),
(354, 4, 2, 8, 16600722, 'Christopher Nieves', '1-729-872-26'),
(355, 6, 2, 8, 16290713, 'Akeem England', '1-343-234-11'),
(356, 5, 2, 7, 16560410, 'Camilla Cox', '1-541-781-53'),
(357, 4, 2, 3, 16980510, 'Giselle Peck', '1-549-469-01'),
(358, 6, 2, 1, 16040106, 'Irene Brennan', '1-744-647-75'),
(359, 4, 2, 5, 16950509, 'Evan Phillips', '1-121-569-51'),
(360, 6, 2, 7, 16570223, 'Cullen Pollard', '1-127-251-28'),
(361, 6, 2, 4, 16090304, 'Nolan Castillo', '1-802-345-99'),
(362, 6, 2, 1, 16880217, 'Delilah Rocha', '1-623-971-85'),
(363, 4, 2, 8, 16861108, 'Renee Burris', '1-125-271-72'),
(364, 6, 2, 8, 16151006, 'Beck Vaughn', '1-113-722-68'),
(365, 5, 2, 3, 16540908, 'Edward Floyd', '1-685-843-22'),
(366, 6, 2, 6, 16720430, 'Elvis Chen', '1-908-534-01'),
(367, 5, 2, 3, 16590829, 'Ray Trevino', '1-357-949-06'),
(368, 4, 2, 3, 16041107, 'Odessa Britt', '1-473-519-71'),
(369, 4, 2, 5, 16830314, 'Aristotle Benton', '1-463-861-45'),
(370, 5, 2, 3, 16220127, 'Perry Day', '1-734-135-36'),
(371, 4, 2, 8, 16100314, 'Deborah Hopper', '1-346-998-67'),
(372, 4, 2, 6, 16810724, 'Constance Rivas', '1-538-906-44'),
(373, 5, 2, 6, 16590804, 'Wesley Campbell', '1-401-920-60'),
(374, 6, 2, 6, 16021230, 'Cailin Harvey', '1-571-250-61'),
(375, 5, 2, 6, 16540723, 'Charles Silva', '1-470-975-32'),
(376, 5, 2, 8, 16651019, 'Rosalyn Solis', '1-412-766-48'),
(377, 6, 2, 6, 16270904, 'Lillian Vaughn', '1-158-286-05'),
(378, 5, 2, 6, 16390505, 'Isadora Leon', '1-695-846-57'),
(379, 4, 2, 1, 16081001, 'Pascale Munoz', '1-899-791-98'),
(380, 5, 2, 6, 16821129, 'Quinn Guzman', '1-876-949-14'),
(381, 6, 2, 6, 16310824, 'Whoopi Oliver', '1-861-221-65'),
(382, 6, 2, 6, 16071116, 'Risa Golden', '1-329-699-54'),
(383, 4, 2, 8, 16960702, 'Brandon Knight', '1-204-462-71'),
(384, 4, 2, 3, 16530706, 'Chancellor Long', '1-194-968-13'),
(385, 6, 2, 5, 16970301, 'Simon Bauer', '1-122-784-04'),
(386, 4, 2, 4, 16621227, 'Jerome Barber', '1-267-911-46'),
(387, 6, 2, 4, 16951229, 'Martena Holmes', '1-871-299-80'),
(388, 5, 2, 2, 16020108, 'Quin Atkins', '1-728-479-88'),
(389, 5, 2, 5, 16321029, 'Kadeem Valencia', '1-679-411-17'),
(390, 6, 2, 8, 16960305, 'Shelly Bolton', '1-206-478-64'),
(391, 6, 2, 6, 16210814, 'Melanie Levy', '1-479-211-18'),
(392, 6, 2, 7, 16880405, 'Lamar Spencer', '1-418-828-46'),
(393, 5, 2, 3, 16651008, 'Kareem Langley', '1-168-158-99'),
(394, 5, 2, 7, 16931206, 'Holmes Blankenship', '1-742-225-98'),
(395, 5, 2, 1, 16510119, 'Xanthus Good', '1-238-645-76'),
(396, 5, 2, 8, 16030403, 'Garrison Fuller', '1-896-219-10'),
(397, 5, 2, 1, 16961029, 'Roary Cantu', '1-588-380-75'),
(398, 5, 2, 5, 16521026, 'Fuller Bass', '1-465-230-71'),
(399, 6, 2, 7, 16021211, 'Renee Camacho', '1-785-878-33'),
(400, 4, 2, 8, 16581010, 'Cleo Howard', '1-244-602-89'),
(401, 5, 2, 5, 16260721, 'Illana Glover', '1-445-421-37'),
(402, 6, 2, 6, 16321116, 'Kareem Hall', '1-560-193-22'),
(403, 6, 2, 3, 16000311, 'Pamela Moon', '1-594-882-13'),
(404, 5, 2, 4, 16700826, 'Regina Kirkland', '1-351-304-45'),
(405, 5, 2, 5, 16901016, 'Alana Hall', '1-158-431-64'),
(406, 6, 2, 4, 16990913, 'Elaine Griffin', '1-431-799-09'),
(407, 5, 2, 2, 16200417, 'Jocelyn Faulkner', '1-482-484-79'),
(408, 5, 2, 8, 16810126, 'Kermit Ward', '1-531-239-82'),
(409, 5, 2, 7, 16421016, 'Xavier Kelly', '1-186-843-05'),
(410, 5, 2, 2, 16111213, 'Benedict Kelly', '1-166-862-42'),
(411, 4, 2, 5, 16801205, 'Hayfa Ross', '1-914-173-82'),
(412, 6, 2, 3, 16170721, 'Jaden Ellison', '1-958-886-20'),
(413, 4, 2, 2, 16061010, 'Akeem Justice', '1-121-618-11'),
(414, 6, 2, 4, 16970618, 'Keegan Cherry', '1-180-677-18'),
(415, 4, 2, 8, 16210922, 'Jane Caldwell', '1-763-145-16'),
(416, 4, 2, 4, 16061003, 'Yvonne Goff', '1-425-667-41'),
(417, 5, 2, 4, 16291030, 'Jared Parker', '1-861-762-95'),
(418, 4, 2, 1, 16990824, 'Aurora Roy', '1-350-191-02'),
(419, 4, 2, 3, 16890415, 'Kameko Wiley', '1-633-486-94'),
(420, 6, 2, 8, 16760428, 'Britanney Dunlap', '1-560-651-31'),
(421, 4, 2, 4, 16940201, 'Kimberley Turner', '1-764-113-10'),
(422, 6, 2, 1, 16060722, 'Maxine Donaldson', '1-902-882-92'),
(423, 6, 2, 6, 16910217, 'Kelly Maxwell', '1-751-880-71'),
(424, 5, 2, 8, 16230514, 'Maya Mosley', '1-161-680-65'),
(425, 4, 2, 5, 16330919, 'Echo Cooley', '1-340-857-41'),
(426, 6, 2, 4, 16840522, 'Prescott Turner', '1-321-388-94'),
(427, 4, 2, 3, 16851006, 'Libby Alvarez', '1-870-941-85'),
(428, 4, 2, 6, 16371001, 'Lyle Hunter', '1-289-811-75'),
(429, 8, 3, 8, 16740806, 'Christian Camacho', '1-542-668-82'),
(430, 7, 3, 7, 16141029, 'John Burch', '1-177-625-67'),
(431, 9, 3, 5, 16030324, 'Colorado Prince', '1-233-248-02'),
(432, 8, 3, 8, 16510611, 'Kameko Orr', '1-879-952-17'),
(433, 8, 3, 4, 16081012, 'Dean Landry', '1-740-244-21'),
(434, 7, 3, 5, 16990728, 'Leroy Castro', '1-168-569-60'),
(435, 7, 3, 3, 16350917, 'Phelan Edwards', '1-877-486-34'),
(436, 8, 3, 5, 16580708, 'Cassandra Bell', '1-154-817-75'),
(437, 8, 3, 8, 16771211, 'Willa Flynn', '1-276-893-55'),
(438, 8, 3, 1, 16910920, 'Tallulah Owens', '1-571-905-87'),
(439, 8, 3, 8, 16760208, 'Aretha Hartman', '1-190-383-99'),
(440, 9, 3, 4, 16870530, 'Maxwell Zamora', '1-704-934-95'),
(441, 7, 3, 3, 16730313, 'Shelley Bradshaw', '1-881-655-19'),
(442, 7, 3, 8, 16950822, 'Mark Petersen', '1-826-265-06'),
(443, 8, 3, 1, 16051210, 'Alfreda Schmidt', '1-264-103-82'),
(444, 9, 3, 7, 16180519, 'Gary Bass', '1-727-431-80'),
(445, 9, 3, 6, 16580328, 'Xanthus Reese', '1-897-566-39'),
(446, 7, 3, 1, 16850818, 'Dean Colon', '1-509-798-73'),
(447, 9, 3, 1, 16370524, 'Hiram Cooley', '1-212-393-97'),
(448, 8, 3, 3, 16560809, 'Leslie Velazquez', '1-109-473-01'),
(449, 8, 3, 7, 16800520, 'Lunea Swanson', '1-238-727-38'),
(450, 7, 3, 7, 16000304, 'Holmes Barnes', '1-314-523-90'),
(451, 7, 3, 4, 16930908, 'Dahlia Fischer', '1-668-485-67'),
(452, 9, 3, 2, 16411102, 'Berk Sharp', '1-831-399-17'),
(453, 8, 3, 3, 16431110, 'Norman Lynn', '1-185-788-46'),
(454, 8, 3, 6, 16051105, 'Irene Tyler', '1-731-969-84'),
(455, 9, 3, 5, 16780819, 'Dalton Hart', '1-354-613-53'),
(456, 7, 3, 2, 16201229, 'Hayes Pierce', '1-599-486-80'),
(457, 8, 3, 6, 16940816, 'Valentine Mullen', '1-246-294-90'),
(458, 8, 3, 8, 16090202, 'Nolan Knox', '1-926-515-29'),
(459, 9, 3, 6, 16450913, 'Virginia Baxter', '1-401-768-70'),
(460, 8, 3, 1, 16181017, 'Octavius Hatfield', '1-470-612-78'),
(461, 7, 3, 2, 16061108, 'Raphael Huffman', '1-474-873-68'),
(462, 7, 3, 8, 16680105, 'Hashim Mccarty', '1-863-184-69'),
(463, 8, 3, 4, 16420321, 'Kelsey David', '1-424-208-01'),
(464, 7, 3, 4, 16050827, 'Yetta Livingston', '1-442-667-91'),
(465, 9, 3, 1, 16770801, 'Marvin Burks', '1-452-697-88'),
(466, 8, 3, 3, 16410402, 'Sade Jarvis', '1-129-768-28'),
(467, 8, 3, 2, 16070230, 'Adrian Cummings', '1-457-942-08'),
(468, 9, 3, 4, 16860410, 'Hermione Ramos', '1-543-346-66'),
(469, 7, 3, 7, 16721016, 'Asher Heath', '1-323-207-01'),
(470, 7, 3, 3, 16271210, 'Emerald Page', '1-161-667-94'),
(471, 9, 3, 5, 16001129, 'Alexis Harrison', '1-635-548-62'),
(472, 8, 3, 3, 16561015, 'Mason Booker', '1-888-514-94'),
(473, 8, 3, 1, 16080708, 'Brianna Bonner', '1-314-496-68'),
(474, 9, 3, 1, 16831208, 'Coby Coleman', '1-107-659-17'),
(475, 7, 3, 8, 16820420, 'Sydnee Waters', '1-920-611-65'),
(476, 9, 3, 5, 16100528, 'Mechelle Winters', '1-205-931-98'),
(477, 9, 3, 2, 16561003, 'Diana Yang', '1-800-504-37'),
(478, 9, 3, 2, 16881004, 'Oscar Stein', '1-599-416-83'),
(479, 9, 3, 1, 16970908, 'Ariel Day', '1-730-687-27'),
(480, 7, 3, 3, 16190415, 'Aileen Stevens', '1-150-137-94'),
(481, 9, 3, 2, 16000626, 'Stephanie White', '1-494-305-37'),
(482, 9, 3, 1, 16050527, 'Brett Mcmillan', '1-832-190-69'),
(483, 8, 3, 6, 16020713, 'Griffith Waller', '1-603-913-42'),
(484, 7, 3, 3, 16980719, 'Shannon King', '1-560-141-58'),
(485, 9, 3, 4, 16620220, 'Callum Cannon', '1-895-706-60'),
(486, 7, 3, 5, 16290421, 'Tucker Sims', '1-566-653-08'),
(487, 8, 3, 3, 16641214, 'Fredericka Powers', '1-627-857-75'),
(488, 8, 3, 2, 16460729, 'Yeo Quinn', '1-560-170-58'),
(489, 9, 3, 8, 16791103, 'Tanner Kinney', '1-556-371-68'),
(490, 8, 3, 2, 16460805, 'Quail Davenport', '1-381-890-27'),
(491, 9, 3, 3, 16390608, 'Conan Ross', '1-945-667-71'),
(492, 9, 3, 7, 16830804, 'Lareina Hall', '1-301-846-70'),
(493, 8, 3, 4, 16410406, 'Irma Peterson', '1-830-532-31'),
(494, 8, 3, 8, 16860918, 'Solomon Fields', '1-288-833-51'),
(495, 8, 3, 8, 16570601, 'Raja Montgomery', '1-917-594-07'),
(496, 7, 3, 8, 16970705, 'Rachel Rutledge', '1-126-291-24'),
(497, 7, 3, 6, 16260925, 'Uta Baldwin', '1-880-444-74'),
(498, 9, 3, 3, 16490627, 'Amanda Brennan', '1-493-499-23'),
(499, 9, 3, 2, 16770824, 'Patrick Castaneda', '1-917-256-47'),
(500, 9, 3, 3, 16580402, 'Wilma Clemons', '1-569-252-93'),
(501, 9, 3, 6, 16111118, 'Emi Beasley', '1-612-359-99'),
(502, 8, 3, 7, 16751210, 'Shellie Long', '1-784-586-56'),
(503, 8, 3, 8, 16181130, 'Alvin Tran', '1-264-690-43'),
(504, 7, 3, 4, 16500224, 'Dawn Campbell', '1-750-546-81'),
(505, 8, 3, 2, 16230830, 'Freya Oconnor', '1-543-582-28'),
(506, 8, 3, 3, 16181103, 'Jin Forbes', '1-669-554-27'),
(507, 8, 3, 1, 16630918, 'Caesar Hendrix', '1-535-859-38'),
(508, 9, 3, 5, 16491104, 'Walker Haynes', '1-876-118-63'),
(509, 7, 3, 6, 16730529, 'Ali Thomas', '1-758-271-67'),
(510, 7, 3, 7, 16750428, 'Lunea Sharp', '1-291-305-90'),
(511, 9, 3, 3, 16340720, 'Nolan Rodgers', '1-421-449-25'),
(512, 8, 3, 7, 16131127, 'Finn Leon', '1-445-403-03'),
(513, 8, 3, 2, 16011116, 'Jackson Conrad', '1-286-103-50'),
(514, 9, 3, 6, 16631202, 'Quentin Good', '1-547-372-64'),
(515, 7, 3, 8, 16490603, 'Robin Morgan', '1-621-437-59'),
(516, 9, 3, 6, 16621218, 'Gage Mckinney', '1-987-184-14'),
(517, 9, 3, 5, 16190721, 'Riley Washington', '1-805-323-53'),
(518, 9, 3, 1, 16020207, 'Renee Torres', '1-949-585-66'),
(519, 7, 3, 2, 16590611, 'George Pacheco', '1-489-290-65'),
(520, 7, 3, 4, 16330426, 'Arden York', '1-618-790-80'),
(521, 9, 3, 5, 16760825, 'Sasha Pace', '1-180-178-16'),
(522, 7, 3, 5, 16830213, 'Wyoming Battle', '1-422-710-89'),
(523, 9, 3, 7, 16610916, 'Rylee Summers', '1-458-787-63'),
(524, 8, 3, 4, 16320529, 'Debra Grant', '1-920-310-27'),
(525, 8, 3, 6, 16740110, 'Sara Oneal', '1-714-898-27'),
(526, 9, 3, 7, 16490728, 'Rachel Santiago', '1-517-829-00'),
(527, 9, 3, 8, 16510220, 'Uta Ramsey', '1-832-356-25'),
(528, 9, 3, 7, 16700230, 'Justina Le', '1-402-493-42'),
(529, 10, 4, 5, 16870614, 'Cameron Garrett', '1-735-178-44'),
(530, 10, 4, 6, 16961201, 'Keefe Wynn', '1-602-326-68'),
(531, 11, 4, 2, 16000924, 'Katelyn Moreno', '1-131-820-28'),
(532, 12, 4, 8, 16470626, 'Zachary Whitaker', '1-345-490-77'),
(533, 11, 4, 1, 16131112, 'Zachery Schultz', '1-469-133-27'),
(534, 11, 4, 4, 16690101, 'Blaze Weiss', '1-563-615-64'),
(535, 12, 4, 5, 16790710, 'Summer Lopez', '1-403-968-51'),
(536, 12, 4, 6, 16420114, 'Brenda Mendoza', '1-933-712-52'),
(537, 10, 4, 6, 16140410, 'Mona Maxwell', '1-488-313-68'),
(538, 10, 4, 3, 16430916, 'Gabriel Townsend', '1-806-564-58'),
(539, 10, 4, 4, 16940911, 'Shay Decker', '1-975-163-30'),
(540, 10, 4, 1, 16500812, 'Amir Mitchell', '1-546-752-71'),
(541, 11, 4, 6, 16050418, 'Nichole Stevens', '1-869-855-59'),
(542, 10, 4, 3, 16760122, 'Willa Parks', '1-947-979-87'),
(543, 11, 4, 6, 16390604, 'Iliana Cleveland', '1-844-867-29'),
(544, 12, 4, 7, 16210608, 'Rebecca Joyce', '1-995-850-77'),
(545, 10, 4, 2, 16150608, 'Ulric Mcmillan', '1-898-297-35'),
(546, 10, 4, 1, 16960214, 'Pearl Morgan', '1-286-319-07'),
(547, 10, 4, 4, 16290327, 'Bertha Hendricks', '1-861-839-07'),
(548, 11, 4, 1, 16001122, 'Orson Solomon', '1-279-804-82'),
(549, 11, 4, 6, 16151130, 'Breanna Yang', '1-613-139-65'),
(550, 11, 4, 2, 16850621, 'Cairo Jensen', '1-216-582-89'),
(551, 10, 4, 8, 16520229, 'Jade Chang', '1-634-724-23'),
(552, 10, 4, 4, 16070326, 'Eden Joyner', '1-722-805-50'),
(553, 10, 4, 4, 16730628, 'Nichole Gilbert', '1-777-596-53'),
(554, 12, 4, 5, 16971103, 'Taylor Navarro', '1-333-106-11'),
(555, 12, 4, 3, 16140829, 'Murphy Thompson', '1-130-541-35'),
(556, 11, 4, 2, 16380409, 'Beau Mcconnell', '1-535-351-22'),
(557, 11, 4, 6, 16340924, 'Nissim Carney', '1-790-339-17'),
(558, 11, 4, 8, 16900729, 'Teegan Campos', '1-562-988-28'),
(559, 10, 4, 6, 16580720, 'Fatima Madden', '1-452-110-49'),
(560, 12, 4, 5, 16961229, 'Angelica Puckett', '1-853-283-28'),
(561, 12, 4, 6, 16110229, 'Yetta Hood', '1-314-842-61'),
(562, 11, 4, 6, 16270720, 'Alexis Hines', '1-228-672-28'),
(563, 11, 4, 7, 16981117, 'Bree Bennett', '1-178-800-01'),
(564, 12, 4, 6, 16810101, 'Stephen Haley', '1-664-707-81'),
(565, 12, 4, 1, 16020814, 'Hector Pickett', '1-653-515-06'),
(566, 11, 4, 5, 16490210, 'Velma Mclean', '1-418-192-37'),
(567, 12, 4, 4, 16380223, 'Lawrence Lucas', '1-784-672-55'),
(568, 10, 4, 8, 16240926, 'Sawyer Duran', '1-563-226-78'),
(569, 10, 4, 1, 16741126, 'Blossom Grimes', '1-187-562-75'),
(570, 12, 4, 4, 16210704, 'Sage Kent', '1-828-591-40'),
(571, 11, 4, 5, 16250322, 'Jayme Larson', '1-567-989-00'),
(572, 12, 4, 2, 16560825, 'Martin Mckinney', '1-467-631-26'),
(573, 12, 4, 2, 16541121, 'Jillian Oconnor', '1-191-789-76'),
(574, 11, 4, 1, 16261218, 'Raja Allen', '1-485-122-58'),
(575, 11, 4, 4, 16650804, 'Maxwell Pope', '1-195-824-83'),
(576, 11, 4, 5, 16380205, 'Ian Burris', '1-117-725-40'),
(577, 12, 4, 8, 16041221, 'Nigel Ryan', '1-928-187-19'),
(578, 10, 4, 2, 16010917, 'Hamilton Rose', '1-152-184-56'),
(579, 10, 4, 7, 16150111, 'Regan Gonzales', '1-808-459-07'),
(580, 12, 4, 2, 16440723, 'Dahlia Romero', '1-914-500-52'),
(581, 10, 4, 2, 16640628, 'Camden Mccall', '1-401-282-72'),
(582, 12, 4, 2, 16600126, 'Kaye Butler', '1-548-359-51'),
(583, 10, 4, 4, 16210420, 'Jameson Key', '1-823-333-55'),
(584, 11, 4, 6, 16650922, 'Ariana Savage', '1-309-554-44'),
(585, 10, 4, 1, 16300817, 'Laith Mays', '1-711-993-77'),
(586, 10, 4, 5, 16391009, 'Reuben Clemons', '1-554-541-81'),
(587, 10, 4, 8, 16740330, 'Fallon Barton', '1-297-659-77'),
(588, 12, 4, 3, 16391228, 'Lance Harper', '1-855-961-90'),
(589, 10, 4, 2, 16850824, 'Elaine Kaufman', '1-896-917-74'),
(590, 11, 4, 1, 16490106, 'Megan Woodard', '1-526-742-17'),
(591, 12, 4, 8, 16961017, 'Timothy Aguilar', '1-422-165-29'),
(592, 10, 4, 7, 16111013, 'Raja Donaldson', '1-979-594-98'),
(593, 12, 4, 7, 16301013, 'Jaquelyn Tillman', '1-423-336-96'),
(594, 10, 4, 5, 16170620, 'Holly Wyatt', '1-778-483-50'),
(595, 11, 4, 3, 16471226, 'Tanya Buckner', '1-166-407-68'),
(596, 10, 4, 3, 16300608, 'Judith Vaughan', '1-339-142-89'),
(597, 10, 4, 5, 16460302, 'Brian Castaneda', '1-801-160-03'),
(598, 10, 4, 7, 16020905, 'Sylvia Dixon', '1-611-237-97'),
(599, 11, 4, 1, 16051214, 'Adria Underwood', '1-292-293-73'),
(600, 11, 4, 5, 16340520, 'Merritt Bolton', '1-487-707-05'),
(601, 12, 4, 7, 16690423, 'Lucy Lyons', '1-161-652-24'),
(602, 10, 4, 1, 16840106, 'Cullen Brewer', '1-190-455-50'),
(603, 12, 4, 5, 16571019, 'Shafira Buckley', '1-868-740-33'),
(604, 11, 4, 6, 16000504, 'Montana Webb', '1-427-407-86'),
(605, 10, 4, 5, 16970423, 'Eden Christensen', '1-742-796-50'),
(606, 11, 4, 5, 16691005, 'Margaret Porter', '1-367-664-47'),
(607, 11, 4, 2, 16811118, 'Iliana Branch', '1-589-783-65'),
(608, 10, 4, 8, 16890120, 'Holmes Walsh', '1-608-913-19'),
(609, 10, 4, 1, 16670919, 'Cade Mccullough', '1-869-776-37'),
(610, 10, 4, 7, 16470622, 'Serina Dale', '1-599-406-16'),
(611, 10, 4, 1, 16620406, 'Timothy Warren', '1-204-632-85'),
(612, 11, 4, 6, 16640806, 'Alexandra Perry', '1-669-997-02'),
(613, 10, 4, 6, 16210615, 'Lamar Levine', '1-750-152-12'),
(614, 12, 4, 8, 16391027, 'Sylvia Mcintosh', '1-242-822-46'),
(615, 12, 4, 4, 16210106, 'Kelly Gallegos', '1-969-167-52'),
(616, 12, 4, 6, 16840204, 'Sydney Wade', '1-234-735-12'),
(617, 11, 4, 3, 16890608, 'Colleen Lyons', '1-977-636-93'),
(618, 10, 4, 8, 16950714, 'Brock Yates', '1-881-655-89'),
(619, 10, 4, 7, 16601129, 'Raja Skinner', '1-159-878-40'),
(620, 11, 4, 3, 16620208, 'Rae Kane', '1-761-529-43'),
(621, 12, 4, 5, 16720930, 'Nicole Gould', '1-249-221-72'),
(622, 12, 4, 2, 16640523, 'Drew Wright', '1-320-734-20'),
(623, 11, 4, 5, 16531214, 'Samuel Whitley', '1-683-329-22'),
(624, 11, 4, 4, 16921222, 'Cruz Ashley', '1-712-810-04'),
(625, 12, 4, 2, 16990304, 'Sara Everett', '1-892-215-09'),
(626, 10, 4, 7, 16320621, 'Ila Schneider', '1-106-979-35'),
(627, 10, 4, 7, 16781116, 'Georgia Barrera', '1-304-504-27'),
(628, 11, 4, 3, 16290428, 'Fitzgerald Barrett', '1-534-570-06'),
(629, 14, 5, 6, 16310530, 'Sonya Casey', '1-739-979-83'),
(630, 15, 5, 6, 16140911, 'Dylan Becker', '1-108-675-08'),
(631, 14, 5, 5, 16040828, 'Frances Freeman', '1-190-421-53'),
(632, 14, 5, 5, 16530812, 'Callie Mcfarland', '1-145-568-57'),
(633, 13, 5, 8, 16300522, 'Mannix Price', '1-914-959-92'),
(634, 14, 5, 2, 16320916, 'Lisandra Murphy', '1-670-289-19'),
(635, 13, 5, 8, 16900817, 'Eric Rice', '1-193-575-25'),
(636, 13, 5, 3, 16400903, 'Kelly Gregory', '1-431-376-73'),
(637, 14, 5, 1, 16900216, 'Ryder Jenkins', '1-965-146-79'),
(638, 14, 5, 5, 16360823, 'Samson Finch', '1-455-103-54'),
(639, 15, 5, 5, 16951016, 'Charissa Delaney', '1-443-467-64'),
(640, 14, 5, 3, 16990125, 'Aileen Pittman', '1-741-854-12'),
(641, 13, 5, 4, 16570228, 'Deanna Shannon', '1-404-751-64'),
(642, 14, 5, 1, 16771012, 'Uriah Crawford', '1-863-259-30'),
(643, 14, 5, 1, 16710929, 'Brendan Farrell', '1-483-194-09'),
(644, 14, 5, 5, 16950821, 'Adele Palmer', '1-952-730-23'),
(645, 13, 5, 3, 16010620, 'Ferdinand May', '1-580-299-40'),
(646, 15, 5, 5, 16470327, 'Lara Robinson', '1-221-689-96'),
(647, 13, 5, 8, 16530217, 'Stacey Dalton', '1-934-853-98'),
(648, 13, 5, 3, 16890120, 'Taylor Dejesus', '1-688-525-40'),
(649, 13, 5, 8, 16910812, 'Gary Francis', '1-735-613-94'),
(650, 14, 5, 7, 16821028, 'Pearl Macdonald', '1-279-603-79'),
(651, 13, 5, 6, 16690208, 'Clark Strong', '1-664-615-36'),
(652, 14, 5, 8, 16601123, 'Sigourney Norris', '1-746-796-29'),
(653, 13, 5, 5, 16461011, 'Hayes Gonzales', '1-837-474-88'),
(654, 14, 5, 8, 16020730, 'Paki Chen', '1-162-432-51'),
(655, 13, 5, 3, 16181215, 'Ishmael Waters', '1-187-566-29'),
(656, 15, 5, 6, 16810817, 'Gil Rosario', '1-877-655-82'),
(657, 15, 5, 4, 16390719, 'Ethan Mendez', '1-934-988-40'),
(658, 14, 5, 6, 16311107, 'Lunea Pace', '1-706-433-78'),
(659, 15, 5, 1, 16900428, 'Kieran Golden', '1-218-954-45'),
(660, 14, 5, 1, 16471023, 'Xyla Kaufman', '1-588-245-33'),
(661, 15, 5, 4, 16480307, 'Steel Bishop', '1-435-306-19'),
(662, 15, 5, 5, 16240227, 'Geoffrey Garza', '1-871-579-23'),
(663, 13, 5, 4, 16451202, 'Connor Estrada', '1-780-851-67'),
(664, 14, 5, 4, 16630318, 'Briar Keith', '1-456-881-47'),
(665, 15, 5, 3, 16430904, 'Jena Jarvis', '1-348-482-15'),
(666, 13, 5, 7, 16210729, 'Nero Hall', '1-111-542-49'),
(667, 13, 5, 4, 16760810, 'Ezra Sosa', '1-582-996-06'),
(668, 15, 5, 6, 16820828, 'Fuller Morris', '1-211-688-63'),
(669, 15, 5, 6, 16341114, 'James Shannon', '1-554-367-23'),
(670, 14, 5, 5, 16590301, 'Zena Freeman', '1-488-753-73'),
(671, 14, 5, 5, 16180816, 'Winter Byers', '1-403-160-79'),
(672, 13, 5, 3, 16810213, 'Bevis Robertson', '1-833-430-23'),
(673, 14, 5, 6, 16720506, 'May Ayala', '1-602-188-32'),
(674, 15, 5, 6, 16250712, 'Malachi Sims', '1-804-660-70'),
(675, 15, 5, 7, 16121101, 'Ignacia Huff', '1-757-109-42'),
(676, 15, 5, 3, 16090507, 'Isaac Poole', '1-147-895-57'),
(677, 14, 5, 2, 16350123, 'Ferris Marshall', '1-927-445-35'),
(678, 13, 5, 7, 16991018, 'Gail Velazquez', '1-243-227-42'),
(679, 13, 5, 1, 16490111, 'Kiara Spencer', '1-485-669-67'),
(680, 15, 5, 7, 16850408, 'Marcia Vega', '1-898-935-67'),
(681, 14, 5, 4, 16181025, 'Mufutau Jones', '1-293-129-04'),
(682, 15, 5, 4, 16300206, 'Lois Case', '1-118-276-15'),
(683, 14, 5, 3, 16970530, 'Ariana Ashley', '1-529-455-95'),
(684, 13, 5, 5, 16691229, 'Cooper Nguyen', '1-354-252-70'),
(685, 13, 5, 4, 16790727, 'Urielle Bass', '1-567-302-23'),
(686, 14, 5, 2, 16740317, 'Rashad Rich', '1-832-504-60'),
(687, 13, 5, 4, 16990204, 'Kaden Randolph', '1-141-639-43'),
(688, 15, 5, 4, 16750421, 'Iona Nieves', '1-354-437-30'),
(689, 14, 5, 6, 16800930, 'Hoyt Downs', '1-642-618-62'),
(690, 15, 5, 6, 16300225, 'Jesse Hickman', '1-354-650-86'),
(691, 14, 5, 7, 16680730, 'Ima Colon', '1-838-310-52'),
(692, 14, 5, 2, 16081026, 'Claire Shepard', '1-223-915-19'),
(693, 14, 5, 6, 16380606, 'Vivian Hoover', '1-344-183-53'),
(694, 13, 5, 5, 16430906, 'Erica Mccormick', '1-689-172-21'),
(695, 13, 5, 2, 16630530, 'Kalia Stone', '1-717-856-52'),
(696, 13, 5, 7, 16730702, 'Price Stokes', '1-311-976-52'),
(697, 15, 5, 4, 16790605, 'Zelenia Bates', '1-758-880-55'),
(698, 13, 5, 7, 16860322, 'Lunea Ryan', '1-349-405-19'),
(699, 13, 5, 1, 16060307, 'Hilel Gutierrez', '1-920-733-83'),
(700, 14, 5, 1, 16051208, 'Breanna Sanford', '1-822-723-99'),
(701, 13, 5, 7, 16620911, 'Nathan Barry', '1-814-807-44'),
(702, 14, 5, 3, 16160107, 'Ella Mayer', '1-347-365-13'),
(703, 14, 5, 8, 16360616, 'Noelle Bradshaw', '1-786-649-49'),
(704, 13, 5, 8, 16420705, 'Xenos Guerrero', '1-267-856-31'),
(705, 14, 5, 8, 16030516, 'Erich Swanson', '1-913-686-92'),
(706, 15, 5, 3, 16130906, 'Emi Kramer', '1-768-989-13'),
(707, 13, 5, 6, 16331201, 'Darius Conway', '1-517-749-80'),
(708, 13, 5, 5, 16280520, 'Lila Cline', '1-236-286-92'),
(709, 14, 5, 1, 16310412, 'George Moss', '1-169-278-52'),
(710, 14, 5, 3, 16290924, 'Nelle Mercer', '1-840-967-41'),
(711, 15, 5, 8, 16580612, 'Willow Knapp', '1-593-995-12'),
(712, 15, 5, 6, 16450606, 'Asher Dickerson', '1-963-959-75'),
(713, 13, 5, 1, 16250721, 'Carson Weeks', '1-743-689-70'),
(714, 14, 5, 7, 16891009, 'Alice Ewing', '1-956-375-53'),
(715, 15, 5, 2, 16761118, 'Nola Walsh', '1-905-412-69'),
(716, 13, 5, 7, 16290527, 'Brennan Dixon', '1-539-928-11'),
(717, 13, 5, 8, 16860902, 'Ryan Cardenas', '1-199-208-28'),
(718, 15, 5, 4, 16101103, 'Phelan Rocha', '1-796-127-44'),
(719, 14, 5, 2, 16290215, 'Bert Phillips', '1-702-810-70'),
(720, 13, 5, 8, 16620302, 'Olympia Bond', '1-878-867-91'),
(721, 14, 5, 2, 16390912, 'Aileen Tyler', '1-825-731-82'),
(722, 14, 5, 4, 16371205, 'Chester Horton', '1-774-785-15'),
(723, 13, 5, 8, 16550327, 'Chanda Ray', '1-448-697-79'),
(724, 13, 5, 8, 16570906, 'Isadora Watson', '1-484-299-62'),
(725, 14, 5, 2, 16430124, 'Ashely Cook', '1-885-470-68'),
(726, 13, 5, 6, 16311013, 'Chancellor Fisher', '1-231-999-59'),
(727, 13, 5, 2, 16620417, 'Cameron Little', '1-495-991-26'),
(728, 14, 5, 8, 16720605, 'Margaret Jacobson', '1-901-428-75'),
(819, 15, 5, 4, 16130715, 'Chantale Bird', '1-844-103-35'),
(820, 13, 5, 7, 16351015, 'Melinda Kelley', '1-212-650-33'),
(821, 15, 5, 1, 16820519, 'Violet Cook', '1-865-288-92'),
(822, 15, 5, 3, 16910108, 'Stuart Maxwell', '1-934-492-32'),
(823, 15, 5, 8, 16680419, 'Murphy Stuart', '1-302-670-80'),
(824, 15, 5, 2, 16300713, 'Karen Stein', '1-458-210-30'),
(825, 14, 5, 6, 16700222, 'Quinlan Chen', '1-314-299-90'),
(826, 13, 5, 5, 16021129, 'Davis Wagner', '1-149-627-18'),
(827, 13, 5, 7, 16580111, 'Hayley Simpson', '1-673-401-40'),
(828, 15, 5, 4, 16461209, 'Brock Foley', '1-467-962-43'),
(829, 17, 6, 7, 16040514, 'Quynn Holland', '1-582-224-43'),
(830, 16, 6, 6, 16910522, 'Thane Donaldson', '1-736-180-96'),
(831, 18, 6, 5, 16340321, 'Yolanda Allison', '1-899-533-61'),
(832, 18, 6, 6, 16580108, 'Connor Freeman', '1-387-101-43'),
(833, 17, 6, 5, 16090606, 'Amethyst Leblanc', '1-794-770-51'),
(834, 16, 6, 5, 16520801, 'Arthur Lang', '1-596-273-41'),
(835, 17, 6, 2, 16780404, 'Darrel Adkins', '1-460-340-24'),
(836, 18, 6, 2, 16721003, 'Lisandra Griffith', '1-791-390-97'),
(837, 17, 6, 8, 16030227, 'Wendy Cruz', '1-717-960-45'),
(838, 18, 6, 7, 16660723, 'Maisie Bartlett', '1-685-102-74'),
(839, 17, 6, 2, 16220319, 'Charity Kirkland', '1-527-100-57'),
(840, 17, 6, 1, 16021002, 'Geoffrey Fitzgerald', '1-511-841-32'),
(841, 16, 6, 2, 16490518, 'Cedric Hale', '1-192-477-73'),
(842, 17, 6, 4, 16000415, 'Evelyn Juarez', '1-943-166-91'),
(843, 18, 6, 1, 16820313, 'Cullen Aguilar', '1-108-848-87'),
(844, 18, 6, 1, 16510621, 'Raymond Mayer', '1-675-201-59'),
(845, 17, 6, 2, 16270408, 'Dylan Nixon', '1-542-526-71'),
(846, 17, 6, 2, 16520315, 'Carl Erickson', '1-223-684-55'),
(847, 18, 6, 1, 16500628, 'Deacon Mccormick', '1-151-983-67'),
(848, 18, 6, 3, 16500513, 'Marvin Cruz', '1-194-789-33'),
(849, 18, 6, 6, 16620504, 'Riley Fry', '1-634-462-36'),
(850, 18, 6, 3, 16141002, 'Ashton Bruce', '1-420-305-18'),
(851, 16, 6, 2, 16160816, 'Byron Quinn', '1-649-256-87'),
(852, 17, 6, 4, 16320827, 'Quin Ramirez', '1-861-660-99'),
(853, 16, 6, 7, 16110217, 'Lisandra Salinas', '1-144-322-78'),
(854, 18, 6, 7, 16130618, 'Reese Mcguire', '1-446-100-87'),
(855, 18, 6, 2, 16780120, 'Sonya Osborne', '1-531-852-51'),
(856, 17, 6, 3, 16731023, 'Regina Jennings', '1-109-878-00'),
(857, 16, 6, 1, 16791208, 'Jessica Hodges', '1-216-433-57'),
(858, 17, 6, 7, 16070719, 'Kane Ryan', '1-613-198-78'),
(859, 17, 6, 3, 16330313, 'Hamilton Collier', '1-366-259-42'),
(860, 16, 6, 8, 16850708, 'Madeline Hawkins', '1-876-842-25'),
(861, 17, 6, 4, 16301219, 'Tatiana England', '1-373-259-43'),
(862, 17, 6, 7, 16470318, 'Jermaine Beasley', '1-314-600-72'),
(863, 16, 6, 7, 16490326, 'Rigel Duran', '1-452-803-24'),
(864, 18, 6, 8, 16991027, 'Carter Barber', '1-858-520-64'),
(865, 18, 6, 7, 16280208, 'Hilda Boyd', '1-539-741-76'),
(866, 16, 6, 3, 16250730, 'Zephania Hoffman', '1-494-919-29'),
(867, 18, 6, 8, 16710221, 'Wallace Garrison', '1-384-300-37'),
(868, 17, 6, 6, 16810109, 'Richard Poole', '1-294-663-88'),
(869, 16, 6, 7, 16700717, 'Fiona Jennings', '1-434-416-32'),
(870, 17, 6, 6, 16640811, 'Aretha Branch', '1-532-280-41'),
(871, 18, 6, 1, 16700511, 'Stacey Dillon', '1-335-358-07'),
(872, 18, 6, 8, 16110430, 'Samuel Boyer', '1-335-885-80'),
(873, 18, 6, 2, 16500807, 'Dawn Short', '1-163-962-13'),
(874, 16, 6, 6, 16760504, 'Xanthus Castaneda', '1-455-249-24'),
(875, 16, 6, 5, 16500623, 'Claire Simpson', '1-246-892-23'),
(876, 16, 6, 5, 16580820, 'Tara Rivera', '1-283-833-33'),
(877, 16, 6, 3, 16051206, 'Gregory Sampson', '1-515-591-05'),
(878, 17, 6, 6, 16230806, 'Otto Branch', '1-306-390-30'),
(879, 16, 6, 8, 16850202, 'Reese Colon', '1-627-867-05'),
(880, 17, 6, 6, 16000709, 'Victor Britt', '1-363-782-45'),
(881, 16, 6, 7, 16490204, 'Ayanna Sampson', '1-513-872-21'),
(882, 16, 6, 3, 16810726, 'Dieter Shepard', '1-250-920-84'),
(883, 18, 6, 5, 16411227, 'Grady Guthrie', '1-133-570-71'),
(884, 17, 6, 6, 16180605, 'Grace Waters', '1-558-702-01'),
(885, 16, 6, 6, 16110401, 'Amity Hooper', '1-420-831-33'),
(886, 17, 6, 4, 16620502, 'Ulla Leon', '1-524-473-12'),
(887, 18, 6, 4, 16830215, 'Hillary Garner', '1-158-369-84'),
(888, 17, 6, 4, 16150127, 'Bernard Riddle', '1-557-332-42'),
(889, 16, 6, 2, 16650312, 'Bradley Miles', '1-119-928-84'),
(890, 16, 6, 6, 16161004, 'Leroy Cervantes', '1-128-740-32'),
(891, 18, 6, 2, 16670412, 'Violet Miller', '1-583-895-93'),
(892, 17, 6, 3, 16500507, 'Jarrod Bowen', '1-610-227-56'),
(893, 18, 6, 3, 16021204, 'Solomon Carey', '1-702-693-99'),
(894, 17, 6, 5, 16380218, 'Quail Patterson', '1-191-961-21'),
(895, 16, 6, 7, 16510707, 'April Leach', '1-371-920-33'),
(896, 16, 6, 1, 16071210, 'Lev Blake', '1-728-933-22'),
(897, 16, 6, 7, 16420217, 'Josiah Arnold', '1-705-955-25'),
(898, 17, 6, 5, 16480405, 'Jameson Mckay', '1-460-216-55'),
(899, 16, 6, 3, 16400714, 'Trevor Curry', '1-625-959-82'),
(900, 16, 6, 4, 16940220, 'Latifah Mendoza', '1-684-813-21'),
(901, 18, 6, 7, 16480409, 'Stone Dodson', '1-261-484-20'),
(902, 16, 6, 2, 16330429, 'Kato Anderson', '1-959-133-07'),
(903, 16, 6, 2, 16850520, 'Dolan Wong', '1-551-974-80'),
(904, 18, 6, 6, 16010403, 'Lacota Cabrera', '1-111-878-43'),
(905, 18, 6, 6, 16681103, 'Benjamin Gilbert', '1-631-556-94'),
(906, 17, 6, 8, 16040922, 'Ursa Sanders', '1-259-870-08'),
(907, 17, 6, 7, 16120203, 'Jeremy Calderon', '1-635-743-44'),
(908, 16, 6, 2, 16321209, 'Lyle Joseph', '1-822-773-45'),
(909, 17, 6, 6, 16840730, 'Fulton Mccormick', '1-373-858-07');
INSERT INTO `aprendiz` (`idaprendiz`, `idficha`, `idprograma`, `idalternativa`, `identificacion`, `nombre`, `telefono`) VALUES
(910, 17, 6, 1, 16890502, 'Yasir Workman', '1-989-675-58'),
(911, 16, 6, 1, 16060915, 'Jescie Colon', '1-227-737-96'),
(912, 16, 6, 6, 16510428, 'Beverly Burks', '1-442-384-00'),
(913, 18, 6, 1, 16180130, 'Zeus Hatfield', '1-610-524-28'),
(914, 16, 6, 1, 16320128, 'Rudyard Albert', '1-414-854-71'),
(915, 16, 6, 7, 16831127, 'Kato Little', '1-394-509-83'),
(916, 16, 6, 2, 16040224, 'Pearl Forbes', '1-941-346-33'),
(917, 16, 6, 3, 16510623, 'Hasad Page', '1-338-890-69'),
(918, 17, 6, 2, 16400120, 'Geraldine Coffey', '1-584-621-47'),
(919, 17, 6, 7, 16031102, 'Uta Woods', '1-812-925-48'),
(920, 16, 6, 6, 16651115, 'Rhoda Wheeler', '1-543-601-30'),
(921, 16, 6, 8, 16790219, 'Kenneth Hull', '1-874-926-52'),
(922, 18, 6, 6, 16570510, 'Jade Goodwin', '1-695-690-07'),
(923, 17, 6, 8, 16291005, 'Geraldine Sykes', '1-770-900-64'),
(924, 16, 6, 8, 16970413, 'Yen Bernard', '1-674-496-19'),
(925, 16, 6, 7, 16320415, 'Chantale Chen', '1-259-316-07'),
(926, 16, 6, 1, 16451116, 'Nigel Durham', '1-790-954-10'),
(927, 17, 6, 4, 16620914, 'Lamar Hill', '1-879-249-33'),
(928, 16, 6, 1, 16820523, 'Roth Blackburn', '1-894-129-74'),
(929, 21, 7, 5, 16700623, 'Branden Rhodes', '1-579-824-64'),
(930, 21, 7, 3, 16450121, 'Hammett Mooney', '1-972-189-50'),
(931, 21, 7, 3, 16731118, 'Preston Dyer', '1-956-396-39'),
(932, 20, 7, 5, 16710918, 'Hall Nixon', '1-878-822-22'),
(933, 20, 7, 5, 16550419, 'Sage Morse', '1-785-151-29'),
(934, 20, 7, 2, 16240508, 'Kylan Villarreal', '1-178-330-27'),
(935, 20, 7, 8, 16600326, 'Beatrice Fleming', '1-131-791-32'),
(936, 21, 7, 8, 16770207, 'Tashya Harrison', '1-763-707-66'),
(937, 20, 7, 4, 16270504, 'Melyssa Wolf', '1-433-484-33'),
(938, 21, 7, 1, 16420201, 'Kaye Larson', '1-671-811-25'),
(939, 19, 7, 5, 16880816, 'Caryn Hoffman', '1-587-196-56'),
(940, 19, 7, 5, 16820815, 'Zephr Woodard', '1-513-651-97'),
(941, 19, 7, 6, 16820118, 'Britanney Simpson', '1-607-124-03'),
(942, 19, 7, 6, 16270313, 'Cora Stewart', '1-998-187-47'),
(943, 19, 7, 8, 16031111, 'Norman Cortez', '1-691-955-39'),
(944, 21, 7, 7, 16650905, 'Brielle Harris', '1-541-114-45'),
(945, 19, 7, 2, 16660506, 'Jerry Joyner', '1-252-496-62'),
(946, 21, 7, 1, 16031203, 'Palmer Coffey', '1-619-956-57'),
(947, 21, 7, 4, 16260701, 'Kirby Madden', '1-768-784-69'),
(948, 21, 7, 2, 16830129, 'Levi Hopkins', '1-690-785-39'),
(949, 21, 7, 5, 16891121, 'Alvin Molina', '1-908-612-45'),
(950, 21, 7, 1, 16191224, 'Cassandra Bishop', '1-953-838-43'),
(951, 19, 7, 6, 16070128, 'Julian Levine', '1-812-533-37'),
(952, 20, 7, 8, 16071123, 'Kieran Woodward', '1-651-945-98'),
(953, 20, 7, 7, 16650605, 'Francesca Hines', '1-183-219-68'),
(954, 19, 7, 3, 16220625, 'Kirsten Mullins', '1-952-792-33'),
(955, 20, 7, 5, 16650925, 'Gil Whitfield', '1-839-588-57'),
(956, 20, 7, 2, 16260127, 'Yvette Saunders', '1-368-262-62'),
(957, 19, 7, 5, 16160809, 'Cassidy Clark', '1-688-753-34'),
(958, 20, 7, 6, 16440915, 'Erica Williamson', '1-136-228-84'),
(959, 21, 7, 2, 16741126, 'Beatrice Gill', '1-652-173-16'),
(960, 21, 7, 3, 16050210, 'Aiko Case', '1-801-523-71'),
(961, 19, 7, 3, 16131017, 'Kareem Howard', '1-307-624-23'),
(962, 19, 7, 1, 16051026, 'Sharon Acevedo', '1-492-444-97'),
(963, 21, 7, 2, 16230716, 'Anthony Kemp', '1-759-467-95'),
(964, 19, 7, 3, 16950723, 'Lucy Harrington', '1-712-393-28'),
(965, 19, 7, 8, 16191221, 'Cain Robbins', '1-626-364-01'),
(966, 20, 7, 4, 16991130, 'Phoebe Frazier', '1-180-774-79'),
(967, 20, 7, 7, 16010512, 'Bryar Morrow', '1-388-160-59'),
(968, 20, 7, 4, 16690617, 'Yoshi Elliott', '1-494-689-22'),
(969, 21, 7, 6, 16040605, 'Jillian Wagner', '1-201-323-04'),
(970, 21, 7, 8, 16971114, 'Ulysses Horne', '1-875-867-92'),
(971, 21, 7, 5, 16311007, 'Rhea Burke', '1-559-670-76'),
(972, 20, 7, 2, 16020512, 'Finn Witt', '1-369-693-64'),
(973, 20, 7, 5, 16430719, 'Ferdinand Anthony', '1-465-890-67'),
(974, 21, 7, 8, 16640409, 'Adele Carrillo', '1-704-525-12'),
(975, 20, 7, 6, 16760523, 'Megan Hancock', '1-399-163-84'),
(976, 20, 7, 8, 16240724, 'Kirsten Fischer', '1-896-121-90'),
(977, 19, 7, 6, 16340814, 'Alice Love', '1-274-556-67'),
(978, 19, 7, 3, 16400920, 'Gannon Zimmerman', '1-295-961-44'),
(979, 19, 7, 7, 16530119, 'Germaine Holmes', '1-109-224-81'),
(980, 21, 7, 1, 16690410, 'Emery Kline', '1-898-304-21'),
(981, 20, 7, 1, 16090804, 'Moses Lambert', '1-854-894-02'),
(982, 21, 7, 7, 16571010, 'Cole Herrera', '1-558-211-41'),
(983, 20, 7, 2, 16220308, 'Michael Stevens', '1-451-476-78'),
(984, 21, 7, 6, 16860424, 'Priscilla Huber', '1-258-912-01'),
(985, 21, 7, 7, 16851014, 'Blaine Best', '1-885-337-73'),
(986, 20, 7, 4, 16681203, 'Aladdin Marsh', '1-122-643-82'),
(987, 21, 7, 2, 16830425, 'Alana Huber', '1-246-634-54'),
(988, 20, 7, 3, 16121210, 'Carly Richardson', '1-220-798-41'),
(989, 19, 7, 5, 16301219, 'Cassady Ruiz', '1-269-193-74'),
(990, 20, 7, 3, 16881030, 'Ursula Rowe', '1-415-699-69'),
(991, 21, 7, 7, 16440710, 'Orli Sutton', '1-784-883-30'),
(992, 21, 7, 4, 16261105, 'Katell James', '1-563-254-30'),
(993, 19, 7, 2, 16731129, 'Kevyn Gamble', '1-164-767-10'),
(994, 21, 7, 3, 16780225, 'Gareth Mendez', '1-853-958-18'),
(995, 21, 7, 4, 16060223, 'Uta Guerra', '1-933-872-69'),
(996, 21, 7, 2, 16871228, 'Lucius Mcpherson', '1-315-485-04'),
(997, 19, 7, 7, 16510808, 'Lucius Shaffer', '1-488-375-88'),
(998, 20, 7, 3, 16490318, 'Sean Ramsey', '1-681-730-92'),
(999, 21, 7, 2, 16241026, 'Wayne Adams', '1-100-698-55'),
(1000, 19, 7, 8, 16670709, 'Sandra Michael', '1-467-473-33'),
(1001, 19, 7, 2, 16930827, 'Ryder Diaz', '1-918-818-85'),
(1002, 20, 7, 8, 16190803, 'Carlos Hayden', '1-740-345-74'),
(1003, 21, 7, 3, 16500211, 'Diana Houston', '1-370-811-83'),
(1004, 21, 7, 2, 16171114, 'Plato Gallegos', '1-936-707-79'),
(1005, 19, 7, 7, 16020912, 'Emerald Carter', '1-120-448-95'),
(1006, 21, 7, 8, 16560503, 'Eleanor Weiss', '1-950-123-67'),
(1007, 21, 7, 4, 16890711, 'Melvin Camacho', '1-707-119-09'),
(1008, 20, 7, 3, 16090713, 'Victor Chambers', '1-731-354-93'),
(1009, 20, 7, 2, 16290806, 'Patrick Adkins', '1-997-496-16'),
(1010, 21, 7, 7, 16080122, 'Kelly Hatfield', '1-916-308-45'),
(1011, 20, 7, 5, 16090208, 'Rashad Trevino', '1-378-674-12'),
(1012, 19, 7, 7, 16531211, 'April Davenport', '1-574-244-07'),
(1013, 19, 7, 7, 16520512, 'Beau Wilder', '1-467-688-00'),
(1014, 21, 7, 3, 16060530, 'Kato Drake', '1-913-192-79'),
(1015, 20, 7, 1, 16610106, 'Craig Case', '1-457-756-74'),
(1016, 19, 7, 5, 16530221, 'Otto Parsons', '1-416-809-07'),
(1017, 20, 7, 1, 16820613, 'Gil Hammond', '1-900-175-37'),
(1018, 20, 7, 3, 16171018, 'Slade Grimes', '1-825-469-31'),
(1019, 20, 7, 5, 16470918, 'Chancellor Gonzales', '1-844-789-67'),
(1020, 19, 7, 3, 16650113, 'Brett Mcknight', '1-808-415-52'),
(1021, 21, 7, 2, 16860109, 'Evan Carr', '1-614-536-10'),
(1022, 19, 7, 7, 16940201, 'Tate Harrington', '1-313-747-16'),
(1023, 20, 7, 3, 16030404, 'Maia Meadows', '1-168-597-94'),
(1024, 21, 7, 5, 16691214, 'Garth Guy', '1-696-935-67'),
(1025, 21, 7, 2, 16100215, 'Hasad Clay', '1-336-742-70'),
(1026, 21, 7, 5, 16740414, 'Kevyn Watson', '1-376-946-48'),
(1027, 21, 7, 5, 16791021, 'Cody Wooten', '1-520-708-07'),
(1028, 19, 7, 2, 16810420, 'Yoshio Morrow', '1-323-967-63'),
(1029, 24, 8, 5, 16760429, 'Sara Trujillo', '1-880-765-78'),
(1030, 22, 8, 1, 16700321, 'Lance Rivera', '1-607-715-86'),
(1031, 22, 8, 2, 16051120, 'Gregory Donovan', '1-995-262-07'),
(1032, 24, 8, 3, 16900923, 'Leroy Gomez', '1-336-635-82'),
(1033, 22, 8, 7, 16590916, 'Malachi Tate', '1-449-638-46'),
(1034, 24, 8, 8, 16940422, 'Jonas Mclean', '1-286-821-27'),
(1035, 22, 8, 5, 16820803, 'Omar Graham', '1-285-939-78'),
(1036, 24, 8, 1, 16560912, 'Beverly Jacobson', '1-580-454-42'),
(1037, 24, 8, 7, 16950918, 'Olympia Hester', '1-927-252-91'),
(1038, 24, 8, 7, 16391017, 'Marvin Fleming', '1-103-424-10'),
(1039, 24, 8, 4, 16240912, 'Mariam Wade', '1-923-808-82'),
(1040, 22, 8, 8, 16950904, 'Jane Snow', '1-868-240-89'),
(1041, 23, 8, 5, 16751107, 'Beck Lancaster', '1-940-596-62'),
(1042, 22, 8, 5, 16690423, 'Abel Matthews', '1-524-850-55'),
(1043, 22, 8, 6, 16930907, 'Tobias Salinas', '1-518-886-73'),
(1044, 22, 8, 8, 16051015, 'Kim Gillespie', '1-845-577-63'),
(1045, 24, 8, 3, 16330818, 'Preston Daniels', '1-177-551-54'),
(1046, 22, 8, 6, 16420217, 'Aurelia Richmond', '1-901-727-99'),
(1047, 24, 8, 7, 16461129, 'Juliet Kelley', '1-127-888-96'),
(1048, 23, 8, 4, 16101210, 'Craig Glenn', '1-144-266-83'),
(1049, 22, 8, 3, 16660124, 'Hanna Roth', '1-970-114-66'),
(1050, 22, 8, 8, 16101227, 'Giacomo Mercer', '1-612-262-80'),
(1051, 23, 8, 7, 16440518, 'Eaton Page', '1-260-795-67'),
(1052, 23, 8, 3, 16660227, 'Cassandra Obrien', '1-293-363-33'),
(1053, 23, 8, 2, 16070112, 'Laith Daniel', '1-101-604-13'),
(1054, 22, 8, 4, 16931018, 'Tad Walls', '1-708-995-42'),
(1055, 23, 8, 4, 16140306, 'Patricia Jacobson', '1-217-574-82'),
(1056, 23, 8, 2, 16400320, 'Fiona Drake', '1-472-830-59'),
(1057, 22, 8, 4, 16350623, 'Hannah Cobb', '1-681-635-80'),
(1058, 23, 8, 2, 16540616, 'Vernon Hodge', '1-176-338-15'),
(1059, 22, 8, 8, 16030405, 'Ezekiel Sampson', '1-253-982-71'),
(1060, 22, 8, 2, 16351115, 'Colton Shannon', '1-979-745-31'),
(1061, 23, 8, 4, 16970519, 'Zena Williamson', '1-163-188-10'),
(1062, 24, 8, 6, 16830826, 'Ori Mccullough', '1-358-224-28'),
(1063, 23, 8, 7, 16771021, 'Lysandra Crane', '1-367-939-95'),
(1064, 22, 8, 5, 16420122, 'Tasha Henson', '1-935-425-01'),
(1065, 22, 8, 1, 16781027, 'MacKenzie Hammond', '1-146-294-98'),
(1066, 22, 8, 3, 16600225, 'Judah Hopkins', '1-229-176-24'),
(1067, 22, 8, 8, 16170918, 'Kimberley Shields', '1-168-833-49'),
(1068, 24, 8, 1, 16650322, 'Sydnee Leon', '1-359-742-06'),
(1069, 23, 8, 6, 16490416, 'Reed Dennis', '1-388-212-41'),
(1070, 23, 8, 7, 16710625, 'James Ellis', '1-764-901-69'),
(1071, 23, 8, 7, 16860426, 'Whoopi Warner', '1-772-300-17'),
(1072, 24, 8, 2, 16100315, 'Alan Ratliff', '1-534-476-19'),
(1073, 22, 8, 2, 16590215, 'Griffin Holloway', '1-192-726-97'),
(1074, 24, 8, 8, 16991003, 'Harlan Dominguez', '1-859-355-77'),
(1075, 22, 8, 7, 16610411, 'Echo Carey', '1-938-915-24'),
(1076, 24, 8, 5, 16860520, 'Denise Faulkner', '1-348-207-77'),
(1077, 24, 8, 4, 16630301, 'Brittany Dorsey', '1-877-866-21'),
(1078, 24, 8, 4, 16180804, 'Florence Lindsey', '1-434-217-53'),
(1079, 22, 8, 8, 16100306, 'Hayley Irwin', '1-807-518-08'),
(1080, 23, 8, 6, 16200221, 'Derek Mendez', '1-228-970-85'),
(1081, 22, 8, 1, 16350114, 'John Knowles', '1-809-119-54'),
(1082, 22, 8, 3, 16990901, 'Herman Workman', '1-744-456-52'),
(1083, 22, 8, 8, 16440408, 'Maite Cleveland', '1-884-180-49'),
(1084, 22, 8, 2, 16770612, 'Brynne Roy', '1-740-708-55'),
(1085, 24, 8, 8, 16530617, 'Norman Murray', '1-747-402-14'),
(1086, 24, 8, 3, 16120109, 'Reece Santos', '1-346-221-51'),
(1087, 23, 8, 5, 16520928, 'Herrod Cooke', '1-540-368-65'),
(1088, 24, 8, 7, 16500307, 'Vincent Gibbs', '1-560-737-52'),
(1089, 22, 8, 2, 16890420, 'Mark Mitchell', '1-493-828-82'),
(1090, 24, 8, 2, 16010628, 'Keelie Combs', '1-894-870-40'),
(1091, 22, 8, 3, 16050415, 'Tallulah Mullins', '1-640-844-68'),
(1091, 26, 9, 2, 16980221, 'Julie Lowe', '1-629-876-37'),
(1092, 24, 8, 5, 16911220, 'Morgan Lindsey', '1-665-218-34'),
(1092, 26, 9, 7, 16480821, 'Mia Bennett', '1-956-828-92'),
(1093, 24, 8, 5, 16990723, 'Fallon Shaffer', '1-609-257-08'),
(1093, 27, 9, 7, 16531106, 'Brianna Leblanc', '1-599-194-94'),
(1094, 23, 8, 2, 16041214, 'Shellie Jackson', '1-157-636-44'),
(1094, 26, 9, 6, 16171229, 'Armando Lambert', '1-536-185-48'),
(1095, 23, 8, 1, 16990629, 'Aimee Richards', '1-237-263-82'),
(1095, 25, 9, 2, 16721208, 'Celeste Cherry', '1-899-870-50'),
(1096, 23, 8, 5, 16970711, 'Orlando Douglas', '1-622-912-88'),
(1096, 26, 9, 1, 16850412, 'Ross Carver', '1-588-290-61'),
(1097, 22, 8, 6, 16030325, 'Norman Jimenez', '1-208-744-94'),
(1097, 25, 9, 7, 16541209, 'Davis Vang', '1-297-574-86'),
(1098, 24, 8, 7, 16061113, 'Kasimir Cruz', '1-280-490-62'),
(1098, 26, 9, 7, 16140417, 'Jemima Decker', '1-366-236-16'),
(1099, 24, 8, 7, 16951027, 'Raymond Britt', '1-467-861-74'),
(1099, 27, 9, 5, 16480717, 'Colleen Johnston', '1-725-813-75'),
(1100, 23, 8, 4, 16411228, 'Reuben Tyler', '1-793-719-06'),
(1100, 26, 9, 6, 16770907, 'Richard Valdez', '1-244-608-51'),
(1101, 24, 8, 7, 16050601, 'Pascale Delaney', '1-505-887-59'),
(1101, 26, 9, 1, 16830520, 'Lacey Baxter', '1-839-264-47'),
(1102, 24, 8, 5, 16580623, 'Ori Bullock', '1-238-984-73'),
(1102, 25, 9, 5, 16290907, 'Beau Ratliff', '1-884-549-46'),
(1103, 24, 8, 1, 16350319, 'Jared Elliott', '1-605-351-24'),
(1103, 26, 9, 8, 16850406, 'Jamal Vega', '1-112-678-97'),
(1104, 24, 8, 7, 16650612, 'Diana Dale', '1-392-156-12'),
(1104, 27, 9, 8, 16740906, 'Ursa Kirkland', '1-725-518-00'),
(1105, 24, 8, 3, 16720617, 'Erasmus Cantrell', '1-542-934-46'),
(1105, 25, 9, 8, 16940202, 'Colby Guy', '1-877-812-29'),
(1106, 23, 8, 2, 16830824, 'Martena Compton', '1-893-327-35'),
(1106, 25, 9, 5, 16410304, 'Warren Espinoza', '1-839-814-15'),
(1107, 22, 8, 7, 16961016, 'Hakeem Blevins', '1-511-307-04'),
(1107, 26, 9, 3, 16410526, 'Demetria Campos', '1-141-637-28'),
(1108, 24, 8, 4, 16371209, 'Tarik Calhoun', '1-398-343-84'),
(1108, 25, 9, 1, 16280913, 'Colton Hensley', '1-464-346-31'),
(1109, 22, 8, 8, 16580507, 'Eliana Morales', '1-177-967-50'),
(1109, 25, 9, 2, 16510425, 'Troy Bullock', '1-182-471-28'),
(1110, 23, 8, 7, 16990217, 'Frances Spencer', '1-939-771-46'),
(1110, 27, 9, 2, 16760103, 'Abbot Sampson', '1-172-864-36'),
(1111, 22, 8, 1, 16620721, 'Fatima Petty', '1-632-126-27'),
(1111, 26, 9, 7, 16390402, 'Miriam Rollins', '1-702-270-88'),
(1112, 22, 8, 7, 16340716, 'Idona Clarke', '1-744-122-62'),
(1112, 25, 9, 8, 16050927, 'Brody Ayers', '1-554-182-74'),
(1113, 22, 8, 7, 16651226, 'Alika Carpenter', '1-319-251-19'),
(1113, 27, 9, 6, 16170426, 'Malachi Meadows', '1-964-844-38'),
(1114, 22, 8, 6, 16900330, 'Orla Lowery', '1-745-316-64'),
(1114, 25, 9, 3, 16161013, 'Idona Garza', '1-219-323-13'),
(1115, 22, 8, 6, 16091121, 'Reese Cameron', '1-148-431-31'),
(1115, 27, 9, 6, 16440416, 'Jane Padilla', '1-172-854-27'),
(1116, 22, 8, 5, 16041116, 'Price Castro', '1-128-869-36'),
(1116, 27, 9, 5, 16130812, 'Galena Baldwin', '1-449-330-07'),
(1117, 24, 8, 3, 16830729, 'Kareem Burks', '1-151-792-37'),
(1117, 25, 9, 7, 16020809, 'Damian Sutton', '1-121-716-42'),
(1118, 22, 8, 5, 16791124, 'Tamekah James', '1-589-601-18'),
(1118, 25, 9, 6, 16081230, 'Kasimir Deleon', '1-221-775-16'),
(1119, 22, 8, 7, 16910302, 'Bruce Powell', '1-283-490-79'),
(1119, 25, 9, 5, 16551101, 'Chastity Alford', '1-849-480-90'),
(1120, 24, 8, 7, 16900723, 'Lila Britt', '1-277-149-12'),
(1120, 27, 9, 4, 16861120, 'Alec Mccormick', '1-447-835-90'),
(1121, 23, 8, 3, 16490514, 'Devin Hanson', '1-149-754-59'),
(1121, 25, 9, 2, 16851229, 'Tarik Sparks', '1-913-272-23'),
(1122, 24, 8, 8, 16200307, 'Blaze Kent', '1-731-978-95'),
(1122, 26, 9, 6, 16551112, 'Philip Summers', '1-782-280-14'),
(1123, 23, 8, 8, 16500925, 'Carlos Melendez', '1-149-812-14'),
(1123, 25, 9, 2, 16520824, 'Lydia Bowen', '1-583-694-47'),
(1124, 23, 8, 7, 16500309, 'Shay Fletcher', '1-595-883-75'),
(1124, 27, 9, 7, 16790605, 'Hedley Lamb', '1-900-316-59'),
(1125, 24, 8, 1, 16630315, 'Martin Wilkins', '1-539-686-60'),
(1125, 27, 9, 3, 16051021, 'Lev Lee', '1-204-738-21'),
(1126, 23, 8, 2, 16530211, 'Larissa Rowland', '1-181-579-09'),
(1126, 26, 9, 5, 16120206, 'Reed Vasquez', '1-461-284-59'),
(1127, 23, 8, 7, 16130115, 'Vaughan Briggs', '1-111-219-58'),
(1127, 26, 9, 4, 16490802, 'Abel Stafford', '1-153-838-54'),
(1128, 22, 8, 8, 16280517, 'Basia Wolfe', '1-521-739-61'),
(1128, 25, 9, 5, 16371008, 'Jakeem Small', '1-896-324-04'),
(1129, 25, 9, 5, 16330427, 'Keelie Keller', '1-601-488-91'),
(1130, 26, 9, 7, 16640718, 'Nyssa Soto', '1-700-251-13'),
(1131, 26, 9, 6, 16580110, 'Kiayada Weiss', '1-299-279-16'),
(1132, 25, 9, 8, 16071107, 'Brody Christian', '1-333-406-84'),
(1133, 27, 9, 7, 16080815, 'Rhea Mack', '1-191-534-08'),
(1134, 26, 9, 5, 16820515, 'Coby Anthony', '1-217-337-20'),
(1135, 27, 9, 4, 16130801, 'Lamar Berry', '1-296-532-44'),
(1136, 27, 9, 8, 16621003, 'Britanni Head', '1-158-830-52'),
(1137, 26, 9, 7, 16230610, 'Ronan Hodge', '1-559-827-74'),
(1138, 26, 9, 8, 16920710, 'Karly Wolf', '1-475-795-29'),
(1139, 27, 9, 3, 16530811, 'Ariana Gill', '1-831-551-09'),
(1140, 27, 9, 4, 16420624, 'Genevieve Malone', '1-176-507-38'),
(1141, 25, 9, 5, 16040813, 'Ifeoma Head', '1-296-874-62'),
(1142, 27, 9, 5, 16930312, 'Caesar Moon', '1-898-272-21'),
(1143, 27, 9, 2, 16280724, 'Valentine Whitehead', '1-772-942-15'),
(1144, 27, 9, 4, 16661028, 'Dieter Wolf', '1-717-323-02'),
(1145, 25, 9, 5, 16380419, 'Neve Keller', '1-593-592-47'),
(1146, 25, 9, 3, 16060519, 'Connor Lucas', '1-990-126-83'),
(1147, 27, 9, 4, 16540803, 'Justina Miller', '1-252-434-56'),
(1148, 27, 9, 6, 16140105, 'India Walker', '1-840-250-05'),
(1149, 26, 9, 2, 16960101, 'Ocean Thomas', '1-796-465-15'),
(1150, 27, 9, 3, 16780523, 'Emi Keith', '1-399-908-40'),
(1151, 25, 9, 5, 16730824, 'Tate Nash', '1-531-853-80'),
(1152, 26, 9, 6, 16620816, 'Gretchen Ford', '1-187-419-59'),
(1153, 27, 9, 2, 16831211, 'Avram Sexton', '1-330-437-40'),
(1154, 26, 9, 5, 16391114, 'Quinlan Glover', '1-892-393-52'),
(1155, 25, 9, 5, 16250606, 'Wilma Duran', '1-470-220-22'),
(1156, 25, 9, 7, 16570617, 'Hedda Shaffer', '1-581-123-43'),
(1157, 26, 9, 7, 16320820, 'Amy Macdonald', '1-701-270-34'),
(1158, 25, 9, 1, 16240906, 'Lawrence Fowler', '1-333-390-80'),
(1159, 25, 9, 5, 16490724, 'MacKensie Richard', '1-224-327-48'),
(1160, 26, 9, 6, 16070813, 'Montana Lawson', '1-929-478-03'),
(1161, 27, 9, 2, 16680410, 'Hayfa Little', '1-164-382-28'),
(1162, 26, 9, 2, 16261220, 'Karen Rutledge', '1-726-826-34'),
(1163, 25, 9, 1, 16921228, 'Nicole Alvarado', '1-731-952-63'),
(1164, 26, 9, 7, 16840114, 'Uma Branch', '1-913-122-51'),
(1165, 27, 9, 8, 16091029, 'August Duncan', '1-639-488-23'),
(1166, 27, 9, 1, 16820219, 'Eugenia Kennedy', '1-609-615-85'),
(1167, 27, 9, 7, 16580405, 'Theodore Sosa', '1-840-708-26'),
(1168, 27, 9, 2, 16450305, 'Xantha Weaver', '1-176-929-03'),
(1169, 25, 9, 4, 16790408, 'Uta Zimmerman', '1-676-787-76'),
(1170, 25, 9, 8, 16120624, 'Hedley Macias', '1-169-272-01'),
(1171, 27, 9, 2, 16540315, 'Gray Mckay', '1-587-550-17'),
(1172, 27, 9, 6, 16281206, 'Cathleen Mathis', '1-104-342-68'),
(1173, 26, 9, 6, 16621230, 'Quinlan Black', '1-769-834-45'),
(1174, 26, 9, 3, 16411010, 'Maxwell Hensley', '1-454-938-08'),
(1175, 25, 9, 8, 16830426, 'Nigel Salazar', '1-680-849-02'),
(1176, 25, 9, 8, 16120618, 'Xena Hyde', '1-529-979-91'),
(1177, 25, 9, 2, 16491212, 'Caldwell Best', '1-868-423-73'),
(1178, 26, 9, 3, 16581222, 'Haviva Talley', '1-860-540-79'),
(1179, 26, 9, 5, 16401019, 'Renee Lowe', '1-193-392-45'),
(1180, 25, 9, 3, 16060606, 'Rudyard Sanchez', '1-401-570-76'),
(1181, 25, 9, 1, 16820111, 'Reese Rice', '1-158-333-42'),
(1182, 27, 9, 7, 16240622, 'Rahim Rodgers', '1-216-574-57'),
(1183, 27, 9, 7, 16700320, 'Mariam Bruce', '1-552-296-89'),
(1184, 26, 9, 2, 16780322, 'Bertha Douglas', '1-631-122-41'),
(1185, 27, 9, 4, 16880704, 'Hiroko Benton', '1-545-170-65'),
(1186, 27, 9, 7, 16530203, 'Axel Cobb', '1-225-945-73'),
(1187, 27, 9, 3, 16810505, 'Armand Cochran', '1-647-540-67'),
(1188, 26, 9, 3, 16151113, 'Urielle Graham', '1-789-838-08'),
(1189, 26, 9, 4, 16270508, 'Ross Gibbs', '1-995-492-17'),
(1190, 25, 9, 8, 16130618, 'Levi Keller', '1-991-897-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cadena`
--

CREATE TABLE `cadena` (
  `idcadena` int(11) NOT NULL,
  `nombreCadena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cadena`
--

INSERT INTO `cadena` (`idcadena`, `nombreCadena`) VALUES
(1, 'Tics'),
(2, 'Manufactura'),
(3, 'Electricidad'),
(4, 'Automotriz'),
(5, 'Automatización');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE `ficha` (
  `idficha` int(11) NOT NULL,
  `idprograma` int(11) NOT NULL,
  `numficha` int(11) NOT NULL,
  `trimestre` int(11) NOT NULL,
  `inicioetapalectiva` date NOT NULL,
  `finetapalectiva` date NOT NULL,
  `inicioetapaproductiva` date NOT NULL,
  `finetapaproductiva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ficha`
--

INSERT INTO `ficha` (`idficha`, `idprograma`, `numficha`, `trimestre`, `inicioetapalectiva`, `finetapalectiva`, `inicioetapaproductiva`, `finetapaproductiva`) VALUES
(1, 1, 4353453, 2, '2019-12-17', '2021-06-27', '2021-06-29', '2021-12-28'),
(2, 1, 3423424, 2, '2020-01-27', '2021-07-27', '2021-07-28', '2022-01-26'),
(3, 1, 4234342, 2, '2020-01-27', '2021-07-27', '2021-07-28', '2022-01-26'),
(4, 2, 1964456, 3, '2019-10-07', '2021-04-07', '2021-04-08', '2021-10-06'),
(5, 2, 1964457, 5, '2019-01-28', '2020-07-28', '2020-07-29', '2021-01-28'),
(6, 2, 1964458, 5, '2019-01-28', '2020-07-28', '2020-07-29', '2021-01-28'),
(7, 3, 1964422, 3, '2019-10-07', '2021-04-07', '2021-04-08', '2021-10-06'),
(8, 3, 1964423, 3, '2019-07-22', '2021-01-18', '2021-01-19', '2021-07-18'),
(9, 3, 1964424, 4, '2019-04-22', '2020-10-22', '2020-10-23', '2021-04-22'),
(10, 4, 2026535, 1, '2020-01-27', '2021-01-27', '2021-01-28', '2021-07-26'),
(11, 4, 1933343, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(12, 4, 1343434, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(13, 5, 1964225, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(14, 5, 1905760, 3, '2019-07-22', '2020-07-22', '2020-07-23', '2021-01-21'),
(15, 5, 1834762, 4, '2019-04-22', '2020-04-22', '2020-04-23', '2020-10-21'),
(16, 6, 1245455, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(17, 6, 1832229, 4, '2019-04-22', '2020-04-27', '2020-04-28', '2020-10-27'),
(18, 6, 5345345, 4, '2019-04-22', '2020-04-27', '2020-04-28', '2020-10-27'),
(19, 7, 7578889, 3, '2019-10-07', '2020-10-22', '2020-10-23', '2021-04-22'),
(20, 7, 8787669, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(21, 7, 9877867, 3, '2019-07-22', '2020-07-22', '2020-07-23', '2021-01-22'),
(22, 8, 6463464, 3, '2019-10-07', '2021-04-22', '2021-04-23', '2021-10-22'),
(23, 8, 3464363, 3, '2019-10-07', '2021-04-07', '2021-04-08', '2021-10-06'),
(24, 8, 3434633, 3, '2019-07-22', '2021-01-22', '2021-01-23', '2021-07-22'),
(25, 9, 4464646, 3, '2019-10-07', '2020-10-22', '2020-10-23', '2021-04-22'),
(26, 9, 3223243, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(27, 9, 7686786, 3, '2019-07-22', '2020-07-22', '2020-07-23', '2021-01-22'),
(28, 10, 5663423, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(29, 10, 4567832, 3, '2019-10-07', '2020-10-11', '2020-10-13', '2021-04-14'),
(30, 10, 4589034, 3, '2019-07-22', '2020-07-22', '2020-07-23', '2021-01-21'),
(31, 11, 4545675, 3, '2019-10-07', '2020-10-07', '2020-10-08', '2021-04-06'),
(32, 11, 4564564, 3, '2019-10-07', '2020-10-11', '2020-10-13', '2021-04-14'),
(33, 11, 7657555, 3, '2019-07-22', '2020-07-22', '2020-07-23', '2021-01-21'),
(34, 12, 6346436, 3, '2019-07-22', '2020-07-12', '2020-07-14', '2021-01-13'),
(35, 12, 6343454, 4, '2019-04-22', '2020-04-26', '2020-04-28', '2020-10-27'),
(36, 12, 8766866, 0, '2019-01-28', '2020-01-28', '2020-01-29', '2020-07-28'),
(37, 13, 3568249, 4, '2019-04-22', '2020-04-22', '2020-04-23', '2020-10-22'),
(38, 13, 5689245, 4, '2019-04-22', '2020-04-22', '2020-04-23', '2020-10-22'),
(39, 13, 8965427, 0, '2019-01-28', '2020-01-28', '2020-01-29', '2020-07-28'),
(40, 14, 5673492, 1, '2020-01-27', '2021-06-27', '2021-06-28', '2021-12-27'),
(41, 14, 4693208, 3, '2019-10-07', '2021-04-07', '2021-04-08', '2021-10-06'),
(42, 14, 4237891, 3, '2019-07-22', '2020-12-19', '2020-12-20', '2021-06-19'),
(43, 15, 5673456, 1, '2020-01-27', '2021-07-27', '2021-07-28', '2022-01-26'),
(44, 15, 2340967, 1, '2020-01-27', '2021-06-27', '2021-06-28', '2021-12-27'),
(45, 15, 4647756, 3, '2019-10-07', '2021-04-07', '2021-04-08', '2021-10-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programasdeformacion`
--

CREATE TABLE `programasdeformacion` (
  `idprograma` int(11) NOT NULL,
  `idcadena` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `programasdeformacion`
--

INSERT INTO `programasdeformacion` (`idprograma`, `idcadena`, `nombre`) VALUES
(1, 1, 'Tecnología Analisis y Desarrollo de Sistemas de Información'),
(2, 1, 'Tecnología Producción de Multimedia'),
(3, 1, 'Tecnología Animación 3D'),
(4, 2, 'Técnico Mecanizado Convencional de Productos Metalmetanicos'),
(5, 2, 'Técnico Maquinas y Herramientas'),
(6, 2, 'Técnico Operador de Torno y Fresadora'),
(7, 3, 'Técnico Construcción y Montaje de Instalaciones Electricas'),
(8, 3, 'Tecnología Electricidad Industrial'),
(9, 3, 'Técnico en Instalaciones Electrica y Residenciales'),
(10, 4, 'Técnico Mantenimiento de Motores Diesel'),
(11, 4, 'Técnico Mantenimiento de Motores de Gasolina y Gas'),
(12, 4, 'Técnico Mantenimiento y Reparación de Motocicletas'),
(13, 5, 'Técnico Instrumentación Industrial'),
(14, 5, 'Tecnología Diseño e Integración de Automatismos Mecatronicos'),
(15, 5, 'Tecnología Automatización Industrial');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reporte`
--

CREATE TABLE `reporte` (
  `idReporte` int(11) NOT NULL,
  `idaprendiz` int(11) NOT NULL,
  `idficha` int(11) NOT NULL,
  `InicioContrato` date NOT NULL,
  `FinalContrato` date NOT NULL,
  `EstadoContrato` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL COMMENT 'Número que identifica al usuario registrado',
  `nombre` varchar(100) NOT NULL COMMENT 'Nombre completo de el usuario',
  `clave` text NOT NULL COMMENT 'Clave que utilizará el usuario para ingresar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `clave`) VALUES
(1, 'LAURA VANESSA AGUDELO ARIAS', '968bfadd7c1fb565e8cb8eca3a2d938f');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarioaprendiz`
--

CREATE TABLE `usuarioaprendiz` (
  `idUsuarioAprendiz` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idaprendiz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `verficha`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `verficha` (
`identificacion` int(11)
,`nombreUsuario` varchar(255)
,`telefono` varchar(12)
,`numficha` int(11)
,`nombre` varchar(255)
,`tipoalternativa` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `verprograma`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `verprograma` (
`idficha` int(11)
,`nombre` varchar(255)
,`numficha` int(11)
,`trimestre` int(11)
,`inicioetapalectiva` date
,`finetapalectiva` date
,`inicioetapaproductiva` date
,`finetapaproductiva` date
);

-- --------------------------------------------------------

--
-- Estructura para la vista `verficha`
--
DROP TABLE IF EXISTS `verficha`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `verficha`  AS  select `a`.`identificacion` AS `identificacion`,`a`.`nombre` AS `nombreUsuario`,`a`.`telefono` AS `telefono`,`f`.`numficha` AS `numficha`,`p`.`nombre` AS `nombre`,`al`.`tipoalternativa` AS `tipoalternativa` from (((`aprendiz` `a` join `ficha` `f` on((`a`.`idficha` = `f`.`idficha`))) join `programasdeformacion` `p` on((`a`.`idprograma` = `p`.`idprograma`))) join `alternativa` `al` on((`a`.`idalternativa` = `al`.`idalternativa`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `verprograma`
--
DROP TABLE IF EXISTS `verprograma`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `verprograma`  AS  select `f`.`idficha` AS `idficha`,`p`.`nombre` AS `nombre`,`f`.`numficha` AS `numficha`,`f`.`trimestre` AS `trimestre`,`f`.`inicioetapalectiva` AS `inicioetapalectiva`,`f`.`finetapalectiva` AS `finetapalectiva`,`f`.`inicioetapaproductiva` AS `inicioetapaproductiva`,`f`.`finetapaproductiva` AS `finetapaproductiva` from (`ficha` `f` join `programasdeformacion` `p` on((`f`.`idprograma` = `p`.`idprograma`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alternativa`
--
ALTER TABLE `alternativa`
  ADD PRIMARY KEY (`idalternativa`);

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`idaprendiz`,`idficha`,`idprograma`,`idalternativa`),
  ADD KEY `fk_aprendiz_ficha1_idx` (`idprograma`,`idficha`),
  ADD KEY `fk_aprendiz_alternativa1_idx` (`idalternativa`);

--
-- Indices de la tabla `cadena`
--
ALTER TABLE `cadena`
  ADD PRIMARY KEY (`idcadena`);

--
-- Indices de la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD PRIMARY KEY (`idficha`,`idprograma`),
  ADD KEY `fk_ficha_programasdeformacion1_idx` (`idprograma`);

--
-- Indices de la tabla `programasdeformacion`
--
ALTER TABLE `programasdeformacion`
  ADD PRIMARY KEY (`idprograma`,`idcadena`),
  ADD KEY `fk_programasdeformacion_cadena1_idx` (`idcadena`);

--
-- Indices de la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`idReporte`,`idaprendiz`,`idficha`),
  ADD KEY `fk_Reporte_aprendiz1_idx` (`idaprendiz`,`idficha`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `usuarioaprendiz`
--
ALTER TABLE `usuarioaprendiz`
  ADD PRIMARY KEY (`idUsuarioAprendiz`,`idusuario`,`idaprendiz`),
  ADD KEY `fk_usuario_has_aprendiz_aprendiz1_idx` (`idaprendiz`),
  ADD KEY `fk_usuario_has_aprendiz_usuario_idx` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alternativa`
--
ALTER TABLE `alternativa`
  MODIFY `idalternativa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  MODIFY `idaprendiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1191;

--
-- AUTO_INCREMENT de la tabla `cadena`
--
ALTER TABLE `cadena`
  MODIFY `idcadena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ficha`
--
ALTER TABLE `ficha`
  MODIFY `idficha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `programasdeformacion`
--
ALTER TABLE `programasdeformacion`
  MODIFY `idprograma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Número que identifica al usuario registrado', AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD CONSTRAINT `fk_aprendiz_alternativa1` FOREIGN KEY (`idalternativa`) REFERENCES `alternativa` (`idalternativa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_aprendiz_ficha1` FOREIGN KEY (`idprograma`,`idficha`) REFERENCES `ficha` (`idprograma`, `idficha`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ficha`
--
ALTER TABLE `ficha`
  ADD CONSTRAINT `fk_ficha_programasdeformacion1` FOREIGN KEY (`idprograma`) REFERENCES `programasdeformacion` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programasdeformacion`
--
ALTER TABLE `programasdeformacion`
  ADD CONSTRAINT `fk_programasdeformacion_cadena1` FOREIGN KEY (`idcadena`) REFERENCES `cadena` (`idcadena`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `fk_Reporte_aprendiz1` FOREIGN KEY (`idaprendiz`,`idficha`) REFERENCES `aprendiz` (`idaprendiz`, `idficha`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarioaprendiz`
--
ALTER TABLE `usuarioaprendiz`
  ADD CONSTRAINT `fk_usuario_has_aprendiz_aprendiz1` FOREIGN KEY (`idaprendiz`) REFERENCES `aprendiz` (`idaprendiz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_has_aprendiz_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
