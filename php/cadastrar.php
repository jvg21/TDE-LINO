<?php
include_once("classes/pessoa.php");

$user = $_POST["usuario"];
$email = $_POST["email"];
$cpf = $_POST["cpf"];
$senha = $_POST["senha"];


$cadastro = new usuario("localhost:3306","root","","tde_web");
try{
    $cadastro->atribuir($user,$email,$cpf,$senha);
    $cadastro->inserir();
    $retorno = "Gravado com sucesso";
}
catch (Exception $e) {
    $retorno = "erro, tente mais tarde";
}



$JSretorno = json_encode($retorno);
echo $JSretorno;
?>