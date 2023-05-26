<?php

include_once("classes/login.php");

$lg_01 = new login("localhost:3306","root","","tde_web");
$retorno = $lg_01->logar($_POST["produto"]);

// var_dump($retorno);
$JSretorno = json_encode($retorno);
echo $JSretorno;


?> 