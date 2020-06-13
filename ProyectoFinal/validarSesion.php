<?php
session_start();
if($_SESSION["usuario"]==NULL){
    header("location:login.php");
}
  
