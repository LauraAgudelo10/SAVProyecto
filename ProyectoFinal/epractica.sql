-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2020 a las 19:07:51
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
(1, 1, 1, 8, 1045586453, 'DANIEL JAIME SEPULVEDA GOMEZ', '3117234335'),
(2, 1, 1, 8, 1045586454, 'DABIER GEOVANNY JIMENEZ GIRALDO', '3147229503'),
(3, 1, 1, 8, 1045586455, 'DANIELA ORTIZ SANCHEZ', '3157895234'),
(4, 1, 1, 8, 1045586456, 'CRISTIAN GUSTAVO PARRA RONDON', '3123456735'),
(5, 1, 1, 8, 1045586457, 'DEIVIS ALEJANDRO GARCIA FLOREZ', '3145879095'),
(6, 2, 1, 8, 1000206079, 'JUAN PABLO AREIZA AGUDELO', '4903635'),
(7, 2, 1, 8, 1000206070, 'MARIA CAMILA VELASQUEZ GOMEZ', '3233540191'),
(8, 2, 1, 8, 1000206071, 'LEIDY LAVERDE MERCADO', '3002560741'),
(9, 2, 1, 8, 1000206072, 'JOSE MANUEL ZAPATA VELEZ', '1453336735'),
(10, 2, 1, 7, 1000206073, 'KEVIN DAVID CARDONA ROJAS', '3193331957'),
(11, 3, 1, 8, 1035783854, 'JUAN PABLO HERNANDEZ ORTIZ', '3113760982'),
(12, 3, 1, 8, 103578385, 'DIEGO ALEJANDRO CASTRILLON TORRES', '3135799574'),
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
(225, 45, 15, 8, 1037544328, 'JULIAN ESTEBAN ARANGO DUQUE', '5714679678');

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
  MODIFY `idaprendiz` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT de la tabla `cadena`
--
ALTER TABLE `cadena`
  MODIFY `idcadena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
