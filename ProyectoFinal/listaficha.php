<?php 
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");

	$sql = "SELECT * FROM ficha";

	if (isset($_POST['dato'])){
		$dato = $consulta->real_escape_string($_POST['dato']);
		$sql = "SELECT * FROM ficha WHERE numficha LIKE '%".$dato."%'";
	}

	$exe = $consulta->query($sql);

	if ($exe->num_rows>0) {
		while($res = $exe->fetch_row()){
			echo '<tr>
					<td><a href="ficha.php?numeroficha='.$res[2].'"title="ficha">'.$res[2].'</a></td>
				  </tr>';
		}
	}else{
		echo "No se encontraron datos con los criterios de búsqueda";
	}



 ?>