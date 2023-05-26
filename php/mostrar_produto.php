<?php
include_once("classes/produto.php");
$pro_01 = new produto("localhost:3306","root","","tde_web");
$retorno = $pro_01->listar();

$JSretorno = json_encode($retorno);
echo $JSretorno;

?>