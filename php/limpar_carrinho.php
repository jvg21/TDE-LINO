<?php
include_once("classes/carrinho.php");

$apagar = new carrinho("localhost:3306","root","","tde_web");
$retorno = $apagar ->limpar_carrinho();

$JSretorno = json_encode($retorno);
echo $JSretorno;

?>