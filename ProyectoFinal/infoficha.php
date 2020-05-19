<?php
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
	
	$sql = "SELECT aprendiz.idaprendiz, ficha.numficha, aprendiz.idprograma, aprendiz.idalternativa, aprendiz.identificacion, aprendiz.nombre, aprendiz.telefono FROM aprendiz INNER JOIN ficha ON ficha.idficha=aprendiz.idficha ORDER BY ficha.numficha";

	if(isset($_POST['info'])){
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT * FROM aprendiz WHERE identificacion LIKE '%".$info."%'";
	}

	$exe = $consulta->query($sql);

	if($exe->num_rows>0){
		while($res = $exe->fetch_row()){
			echo '<tr>
					<td>'.$res[1].'</td>
				  	<td>'.$res[2].'</td>
				  	<td>'.$res[3].'</td>
				  	<td>'.$res[4].'</td>
				  	<td>'.$res[5].'</td>
				  	<td>'.$res[6].'</td>
				  </tr>';
		}
	}else{
			echo "No se encontraron datos con los criterios de búsqueda";
		}
?>
