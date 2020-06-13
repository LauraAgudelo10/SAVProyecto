<?php 
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
$pro = $consulta->real_escape_string($_POST['programas']);
	if (isset($_POST['fichas']) && $_POST['fichas'] !=0){
		$sql = "SELECT * FROM epractica.verficha where idficha =".$pro.";";
	}else{
		$sql="SELECT * FROM epractica.verprograma";
	}if(isset($_POST['info']) && $_POST['programas'] !=0){
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT * FROM epractica.verprograma WHERE idficha = ".$pro." and numficha LIKE  '%".$info."%'";
	}elseif (isset($_POST['info'])&& $_POST['programas'] == 0) {
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT * FROM epractica.verprograma where numficha like '%".$info."%';";
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
				  	 <td style="background: rgb(189, 226, 170); width:100px; height:30px;"><a href="ficha.php?numeroficha='.$res[2].'" style="text-decoration:none;"><img src="assets/img/ver.png" width="20" height="20" alt=""></a></td>
				  </tr>';
		}
	}else{
			echo "No se encontraron datos con los criterios de búsqueda";
		}
?>