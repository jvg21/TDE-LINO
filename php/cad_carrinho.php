<?php
include_once("classes/conexao.php");

$produto = $_POST["id_produto"];
$quantidade = $_POST["qtde"]; 
//echo $produto;
// $txt = "qtde-carrinho".$produto;

$addcart = new conexao("localhost:3306","root","","tde_web");
$SQL = "INSERT INTO carrinho values('$produto','$quantidade')";

$addcart->Banco_query($SQL);
$Resposta = "Produto gravado no carrinho";


$JSretorno = json_encode($Resposta);
echo $JSretorno;

?>