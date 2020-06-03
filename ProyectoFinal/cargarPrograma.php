<?php
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");

$res = $consulta->query("SELECT * FROM programasdeformacion where idcadena={$_GET['idcadena']} order by nombre");

$campos = $res->fetch_object()
?>


<select id="programasdeformacion">
    
    <option value="<?php if($_GET['idcadena']!=0){ echo $campos->idcadena; }else{ echo "0";}?>">

    <?php if($_GET['idcadena']!=0){ echo $campos->nombre; 

    }else{ echo "Seleccione una cadena de formación";}?></option>


    <?php if ($_GET['idcadena']!=0) {
     while ($campos = $res->fetch_object()) 
    {?>
     <option value="<?php echo $campos->idcadena; ?>"><?php echo $campos->nombre; ?></option>

    <?php

	}?>

	</select><button type="submit" class="btn2">Buscar</button><?php }else {
	?>
		<option value="0">Seleccione una cadena para continuar</option>
		</select>
		<button type="submit" class="btn2" disabled>Buscar</button>

		<?php } ?>  