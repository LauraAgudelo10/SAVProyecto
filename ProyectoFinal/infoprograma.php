<?php 
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");

	$sql = "SELECT * FROM ficha";

	if(isset($_POST['info'])){
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT * FROM ficha WHERE numficha and trimestre LIKE  '%".$info."%'";
	}

	$exe = $consulta->query($sql);

	if($exe->num_rows>0){
		while($res = $exe->fetch_row()){
			echo '<tr>
					<td>'.$res[2].'</td>
				  	<td>'.$res[3].'</td>
				  	<td>'.$res[4].'</td>
				  	<td>'.$res[5].'</td>
				  	<td>'.$res[6].'</td>
				  	<td>'.$res[7].'</td>
				  </tr>';
		}
	}else{
			echo "No se encontraron datos con los criterios de búsqueda";
		}
?>