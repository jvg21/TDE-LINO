<?php
include_once("conexao.php");
class produto extends conexao{
    public function listar(){

        try{
            $SQL = "SELECT * FROM produto";
            $SLC = $this->Select($SQL);
            $Dados[0]["confirmacao"] = "";
            $Dados[0]["id_produto"] = "";
            $Dados[0]["nome_produto"] = "";
            $Dados[0]["preco"] = "";
            $Dados[0]["imagem"] = "";
            $Dados[0]["categoria"] = "";
            $i = 0;

            while($registro = mysqli_fetch_assoc($SLC)){
                $Dados[$i]["confirmacao"] = "ok";
                $Dados[$i]["id_produto"] = $registro["id_produto"];
                $Dados[$i]["nome_produto"] = $registro["nome_produto"];
                $Dados[$i]["preco"] = $registro["preco"];
                $Dados[$i]["imagem"] = $registro["imagem"];
                $Dados[$i]["categoria"] = $registro["id_categoria"];
                $i = $i+1;
                
            }
            $Dados[0]["confirmacao"] = "Dados encontrados";

        }catch(Exception $e){
            if($e->getMessage()){
                $Dados[0]["confirmacao"] = $e->getMessage();
                //echo 'Erro: ',  $e->getMessage(), "\n";
            }else{
                $Dados[0]["confirmacao"] = "Algo deu errado";
            }
        }
        return $Dados;
    }
}
?>