<?php

function guardarUsuario() {
    $nombre = $_POST['usuario'];
    $clave = $_POST['clave'];
    $mensaje = "";
    if (trim($nombre) == "") {
        $mensaje = "Ingrese nombre de usuario  <br>";
    }
    if (trim($clave) == "") {
        $mensaje = "Ingrese clave  <br>";
    }

    if ($mensaje == "") {
        require 'conexion.php';
        $con = new Conexion();
        $consulta = $con->conectar();
        $consulta->set_charset("utf8");
        $sql = "INSERT INTO tb_usuario(`id`,`nombre`,`clave`) VALUES (null,'$nombre',MD5('$clave'))";
        if ($consulta->query($sql) == 1) {
            session_start();
            $_SESSION["logueado"] = TRUE;
            $_SESSION["nombre"] = $nombre;
            header("location:index.php");
        }else {
            session_start();
            $mensaje = "Ya existe un usuario con el mismo nombre:" .$_SESSION["nombre"];
            header("location:index.php?error=1.php");
        }
    }
}

if ($_POST['accion'] == "REGISTRAR") {
    guardarUsuario();
}


