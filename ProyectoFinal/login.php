<?php
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
$resultado=$consulta->query("SELECT * FROM usuario");

$usu="";
$cla="";
$mensaje="";
if(isset($_POST['usuario'])){
    $usu= htmlspecialchars($_POST['usuario'], ENT_NOQUOTES);
    $cla= htmlspecialchars($_POST['clave'], ENT_NOQUOTES);
    if($cla=="" && $usu==0){
        $mensaje= "Debe seleccionar un usuario e ingresar la contraseña";
    }else if($usu==0) {
        $mensaje= "Debe seleccionar un usuario";
    }else if($cla==""){
        $mensaje= "Debe ingresar la contraseña";
    }else{
        $resultado=$consulta->query("SELECT * FROM usuario where idusuario=$usu and clave=md5('$cla');");
        if($resultado->num_rows==1){
            $campos = $resultado->fetch_object();
            session_start();
            $_SESSION["usuario"]=$campos->idusuario;
            $_SESSION["nombre"]=$campos->nombre;
            header("location:index.php");
        }
    }
    
}

?>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAV</title>
    <link rel="stylesheet" href="assets/css/style1.css">
</head>
    
<body>
    <header>
        <nav>
            <section class="contenedor nav">
                <div class="logo">
                    <img src="assets/img/SAV1.png" width="300" height="100" alt="">
                </div>
                <div class="enlaces-header">
                    <a href="https://www.facebook.com/SENAColombiaOficial/"><img src="assets/img/fb.png" width="30" height="30" alt=""></a>
                    <a href="https://twitter.com/SENAComunica"><img src="assets/img/twitter.png" width="30" height="30" alt=""></a>
                    <a href="https://www.instagram.com/senacomunica/"><img src="assets/img/instagram.png"width="30" height="30" alt=""></a>
                    <a href="https://www.youtube.com/user/SENATV"><img src="assets/img/youtube.png" width="30" height="30" alt=""></a>
                </div>
            </section>
        </nav>
        
        <div class="contenedor">
            <section class="contenido-header">
                <section class="formulario-header">
                    <div class="login-contenedor">
                        <h1>Sistema de Información Virtual de Aprendices</h1>
                        <div class="login-form">
                            <form action="" method="post">
                                <div class="form">
                                	<label>Usuario</label>
                                        <select name="usuario">
		                                    <option value="0">Seleccionar un usuario</option>
		                                    <?php
		                                    while ($campos = $resultado->fetch_object()) {
		                                        ?>
		                                    <option <?php if ($campos->idusuario==$usu) echo 'selected'; ?> value="<?php echo $campos->idusuario;?>"><?php echo $campos->nombre;?></option>
		                                    <?php
		                                    }
		                                    ?>
                                		</select>  
                                        <label>Contraseña</label>
                                    <input name="clave" type="password" placeholder="Contraseña"> 
                                </div>
                                <button type="submit" class="btn">Iniciar Sesión</button>
                                <?php
		                        if($mensaje!=""){
		                         
		                        ?>
		                        <div class="form-group" style="text-align: center;width: 100%;padding: 12px;background-color:rgba(254, 205, 153);font-size: 12px;">
		                            <label style="color: red;"><?php echo $mensaje;?></label>
		                        </div>
		                      <?php
		                       }
		                      ?>
                            </form>                         
                        </div>
                    </div>
                </section>
                <img src="assets/img/img.png"  alt="">
            </section>
        </div>
    </header>
        <footer class="footer">
            <div class="contenedor-footer">
                <h4>&copy; SENA 2020 </h4>
            </div>
            <h2 class="titulo-final">&copy; Denisse Alejandra Alzate Meneses | Sergio León Saldarriaga Dávila | Laura Vanessa Agudelo Arias</h2>
        </footer>
</body>
</html>