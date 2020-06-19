<?php
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
$fichas = $consulta->real_escape_string($_POST['fichas']);
	if (isset($_POST['fichas']) && $_POST['fichas'] !=0){
		$sql = "SELECT * FROM epractica.verficha where numficha =".$fichas.";";
	}else{
		$sql="SELECT * FROM epractica.verficha";
	}if(isset($_POST['info'])&& $_POST['fichas'] !=0){
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT * FROM epractica.verficha where numficha =".$fichas." and identificacion like '%".$info."%';";
	}elseif (isset($_POST['info'])&& $_POST['fichas'] == 0) {
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT * FROM epractica.verficha where identificacion like '%".$info."%';";
	}
	$exe = $consulta->query($sql);
	if($exe->num_rows>0){
		while($res = $exe->fetch_object()){
			echo '<tr>
                      <td style="width:90px;">'.$res->numficha.'</td>
                      <td>'.$res->nombre.'</td>
                     <td>'.$res->tipoalternativa.'</td>
                     <td>'.$res->identificacion.'</td>
                     <td>'.$res->nombreUsuario.'</td>
                    <td style="width:110px;">'.$res->telefono.'</td>
                    <td style="background: rgb(189, 226, 170); width:100px; height:30px;"><a href="aprendiz.php?id='.$res->identificacion.'" style="text-decoration:none;"><img src="assets/img/edit.png" width="20" height="20" alt=""></a></td>
                   </tr>';
		}
	}else{
			echo "No se encontraron datos con los criterios de búsqueda";
		}
?>