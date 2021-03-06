<?php 
require_once 'validarSesion.php'; 
require_once 'conexion.php';
$con = new Conexion();
$consulta = $con->conectar();
$consulta->set_charset("utf8");
if (isset($_GET['id'])&& !empty($_GET['id'])) {
$exe = $consulta->query("select nombre from aprendiz where identificacion =". $_GET['id']);
$con =$consulta->query("select * from alternativa order by tipoalternativa");   
$res = $exe->fetch_object();
    if($res->nombre !="" ) {
    $sql="call epractica.consulta(".$_GET['id'].", 'a');"; 
    $exe = $consulta->query($sql);
    $res = $exe->fetch_object();
    }else{
        header('location:ficha.php');
}  
}else{
    header('location:ficha.php');
}  
?>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>SAV</title>
    <link rel="stylesheet" href="assets/css/style6.css">
    <link rel="stylesheet" href="assets/icon/style.css">

</head>
    <body>
        <header>
                <span class="lnr lnr-menu show"></span>
                <nav class="navegacion">
                    <ul class="menu">
                        <li><a href=""><?php echo $_SESSION["nombre"];?></a>
                            <ul class="submenu">
                                <li><a href="logout.php">Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
        </header>
        <main>
            
            <div class="content-menu">
                <a href="index.php"><li><span><img src="assets/img/4.png" width="40" height="40" alt=""><h4 class="text1">Inicio</h4></span></li></a>
                <a href="aprendiz.php"><li><span><img src="assets/img/3.png" width="50" height="38" alt=""><h4 class="text5">Aprendiz</h4></span></li></a>
            </div>

             
            <section class="content-form">

                <h2 class="sub-title">DATOS GENERALES</h2>

                <form action="ficha.php?numeroficha=<?php echo $res->numficha;?>" method="post" id="registrar-form" >
                  
                    <div class="form-group width-12">
                         <div class="width-6">
                          <h4>Ficha</h4>
                          <input type="text" placeholder="<?php echo $res->numficha;?>" class="form-control" name="ficha" id="numficha" disabled/> <hr>
                         </div> 
                         <div class="width-6">
                          <h4>Nombre</h4>
                          <input type="text" placeholder="<?php echo $res->nombreUsuario;?>" class="form-control" name="programa" id="prog" disabled /> <hr>
                         </div>  
                    </div>

                    <div class="form-group">
                         <div class="width-12" id="pro">
                          <h4>Programa de Formación</h4>
                            <input type="text" placeholder="<?php echo $res->nombre;?>" class="form-control" name="nombre" id="nombre" disabled /> <hr>
                         </div>
                    </div>
                      
                     <div class="form-group width-12">
                         <div class="width-6">
                           <h4>Identificación</h4>
                          <input type="text" placeholder="<?php echo $res->identificacion;?>" class="form-control" name="identificaciónf" id="identificaciónf" disabled />
                          <input type="hidden" value="<?php echo $res->identificacion;?>" class="form-control" name="identificación" id="identificación" /><hr>
                         </div> 
                         <div class="width-6">
                          <h4>Contacto</h4>
                          <input type="text" placeholder="<?php echo $res->telefono;?>" class="form-control" name="telefono" id="telefono" disabled /> <hr>
                         </div>  
                     </div>
                        
                    <div class="alt form-group width-6"> 
                        <h4>Alternativa</h4>
                        <select name="alternativa" id="alternativa">
                            <option class="opcion1" value="<?php echo $res->idalternativa ?>" required><?php echo $res->tipoalternativa ?></option>
                            <?php while ($res2 = $con->fetch_object()){ ?>
                             <option value="<?php echo  $res2->idalternativa ;?>" required><?php echo $res2->tipoalternativa ?></option>
                        <?php } ?>
                        </select> 
                    </div>          
                     <br>
                     <div class="form-group width-12">
                           <input type="submit" name="submit" value="Guardar" class="form-control btn btn-principal" id="btn-registrar"/>
                     </div>
              
                </form>

            </section>

        </main>
        <footer class="footer">
            <div class="contenedor-footer">
                <h4>&copy; SENA 2020 </h4>
            </div>
            <h2 class="titulo-final">&copy; Denisse Alejandra Alzate Meneses | Sergio León Saldarriaga Dávila | Laura Vanessa Agudelo Arias</h2>
        </footer>
        <script src="assets/js/jquery.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/script.js"></script>
        <script src="assets/js/funcionesInfoPrograma.js"></script>
    </body>
</html>