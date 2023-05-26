<?php

include_once("classes/carrinho.php");

$carrinho = new carrinho("localhost:3306","root","","tde_web");
$retorno = $carrinho ->listar_carrinho();

$JSretorno = json_encode($retorno);
echo $JSretorno;
?>