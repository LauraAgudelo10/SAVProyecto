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
		$ficha = $_POST['ficha'];
		$sql = "SELECT a.identificacion,a.nombre as nombreUsuario,a.telefono,f.numficha,p.nombre,al.tipoalternativa FROM epractica.aprendiz a 
inner join ficha f on a.idficha = f.idficha 
inner join programasdeformacion p on a.idprograma = p.idprograma 
inner join alternativa al on a.idalternativa = al.idalternativa WHERE identificacion LIKE '%".$info."%' AND f.idficha = '".$ficha."'";
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
                    <td style="background: rgb(189, 226, 170); width:100px; height:30px;"><a href="aprendiz.php?id='.$res->identificacion.'" style="text-decoration:none;"><img src="assets/img/edit.png" width="20" height="20" alt=""></a></td>
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