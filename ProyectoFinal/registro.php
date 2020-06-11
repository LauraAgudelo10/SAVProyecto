<?php

include("conexion.php");

if(ISSET($_POST['register'])){
    if(strlen ($_POST['usuario']) >=1 && strlen ($_POST['clave']) >=1 ){
    $nombre = trim($_POST['usuario']);
    $clave = trim($_POST['clave']);
    $con = new Conexion();
    $consulta = $con->conectar();
    $consulta->set_charset("utf8");
    $sql = "INSERT INTO usuario(`nombre`,`clave`) VALUES ('$nombre',MD5('$clave'))";
    $resultado = mysqli_query($consulta, $sql);
        if($resultado){
            ?>
            <h3 class="ok">Registrado correctamente</h3>
            <?php
        }else{
            ?>
            <h3 class="bad">Ha ocurrido un error</h3>
            <?php
        }
    }else{
            ?>
            <h3 class="bad">Completa los campos</h3>
            <?php
        }
}