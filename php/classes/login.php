<?php

include_once('conexao.php');

class login extends conexao{

    public function logar(?string $usuario){
        //$senha = md5($senha);
        $SQL = "SELECT * FROM produto WHERE nome_produto = '$usuario'";
       
        try{
            $SLC = $this->Select($SQL);
            $Dados["confirmacao"] = "";
            $Dados["nome"] = "";
            $Dados["preco"] = "";
            while($registro = mysqli_fetch_assoc($SLC)){
                $Dados["nome"] = $registro["nome_produto"];
                $Dados["preco"] = $registro["preco"];
            }
            $Dados["confirmacao"] = "produto Existe";
            
        }
        catch(Exception $e){
            if($e->getMessage()){
                $Dados["confirmacao"] = $e->getMessage();
                //echo 'Erro: ',  $e->getMessage(), "\n";
            }else{
                $Dados["confirmacao"] = "Algo deu errado";
            }
            //echo 'Exceção capturada: ',  $e->getMessage(), "\n";
        }
        return $Dados;

    }
}

// $teste = new login("localhost:3306","root","","tde_web");
// $select = $teste->logar('gio@21.com','123456');
?>