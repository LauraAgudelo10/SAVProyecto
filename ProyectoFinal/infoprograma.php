<?php 
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");

	$sql = $sql="SELECT f.idficha,p.nombre, f.numficha,f.trimestre,f.inicioetapalectiva,f.finetapalectiva, f.inicioetapaproductiva, f.finetapaproductiva FROM epractica.ficha f 
                inner join programasdeformacion p on f.idprograma = p.idprograma";

	if(isset($_POST['info'])){
		$info = $consulta->real_escape_string($_POST['info']);
		$sql = "SELECT f.idficha,p.nombre, f.numficha,f.trimestre,f.inicioetapalectiva,f.finetapalectiva, f.inicioetapaproductiva, f.finetapaproductiva FROM epractica.ficha f 
                inner join programasdeformacion p on f.idprograma = p.idprograma WHERE numficha LIKE  '%".$info."%'";
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
				  	<td style="background: rgb(189, 226, 170); width:100px; height:30px;><a href="ficha?id=" style="text-decoration:none;><img src="assets/img/ver.png" width="20" height="20" alt=""></a><td>
				  </tr>';
		}
	}else{
			echo "No se encontraron datos con los criterios de búsqueda";
		}
?>