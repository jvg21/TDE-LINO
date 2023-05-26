<?php
include_once("classes/pagamento.php");
// $user = "GIO";
// $cpf = "17733584151";
// $endereco = "Rua das Flores";
// $opcao = "Pix";
$user = $_POST["usuario"];
$cpf = $_POST["cpf"];
$endereco = $_POST["endereco"];
$opcao = $_POST["fpgto"];
$pagamento = new pagamento("localhost:3306","root","","tde_web");
$pagamento->atribuir($user,$endereco,$cpf);
$id = $pagamento->buscar();
$pagamento->cadastrar_venda($id,$opcao,$endereco);

$retorno = "Gravado com sucesso";

$JSretorno = json_encode($retorno);
echo $JSretorno;
?>