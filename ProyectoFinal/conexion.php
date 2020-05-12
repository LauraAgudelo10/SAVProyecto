
<?php
class Conexion {
   public function conectar(){
    return new mysqli("localhost", "root", "", "epractica", 3306); 
    }
}

