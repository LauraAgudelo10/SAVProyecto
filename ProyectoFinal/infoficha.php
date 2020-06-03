<?php
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
	
$sql = "SELECT a.identificacion,a.nombre as nombreUsuario,a.telefono,f.numficha,p.nombre,al.tipoalternativa FROM epractica.aprendiz a 
inner join ficha f on a.idficha = f.idficha 
inner join programasdeformacion p on a.idprograma = p.idprograma 
inner join alternativa al on a.idalternativa = al.idalternativa ";

	if(isset($_POST['info'])){
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT a.identificacion,a.nombre as nombreUsuario,a.telefono,f.numficha,p.nombre,al.tipoalternativa FROM epractica.aprendiz a 
inner join ficha f on a.idficha = f.idficha 
inner join programasdeformacion p on a.idprograma = p.idprograma 
inner join alternativa al on a.idalternativa = al.idalternativa WHERE identificacion LIKE '%".$info."%'";
	}

	$exe = $consulta->query($sql);

	if($exe->num_rows>0){
		while($res = $exe->fetch_object()){
			echo '<tr>
                      <td>'.$res->numficha.'</td>
                      <td>'.$res->nombre.'</td>
                     <td>'.$res->tipoalternativa.'</td>
                     <td>'.$res->identificacion.'</td>
                     <td>'.$res->nombreUsuario.'</td>
                    <td>'.$res->telefono.'</td>
                    <td><a href="aprendices?id=">B</a><td>
                   </tr>';
		}
	}else{
			echo "No se encontraron datos con los criterios de búsqueda";
		}
?>
<!-- 
	use epractica;
select * from aprendiz;
SELECT a.identificacion,a.nombre,a.telefono,f.numficha,p.nombre,al.tipoalternativa FROM epractica.aprendiz a 
inner join ficha f on a.idficha = f.idficha 
inner join programasdeformacion p on a.idprograma = p.idprograma 
inner join alternativa al on a.idalternativa = al.idalternativa 
where numficha = 4353453 ; 