<?php

include_once('conexao.php');

class carrinho extends conexao{

    public function listar_carrinho(){
        //$senha = md5($senha);
        $SQL = "SELECT c.quantidade,p.nome_produto,p.preco,c.id_produto FROM carrinho c 
        INNER JOIN produto p ON c.id_produto=p.id_produto;" ;

        try{
            $SLC = $this->Select($SQL);
            $Dados[0]["confirmacao"] = "";
            $Dados[0]["quantidade"] = "";
            $Dados[0]["nome_produto"] = "";
            $Dados[0]["preco"] = "";
            $i = 1;
            while($registro = mysqli_fetch_assoc($SLC)){
                $Dados[$i]["id"] = $registro["id_produto"];
                $Dados[$i]["quantidade"] = $registro["quantidade"];
                $Dados[$i]["nome_produto"] = $registro["nome_produto"];
                $Dados[$i]["preco"] = $registro["preco"];
                $i++;
                $Dados[0]["tamanho"] = $i;
            }
            $Dados[0]["confirmacao"] = "Dados encontrados";
            
        }
        catch(Exception $e){
            if($e->getMessage()){
                $Dados[0]["confirmacao"] = $e->getMessage();
                //echo 'Erro: ',  $e->getMessage(), "\n";
            }else{
                $Dados[0]["confirmacao"] = "Carrinho Vazio";
            }
            //echo 'Exceção capturada: ',  $e->getMessage(), "\n";
        }
        return $Dados;

    }

    public function limpar_carrinho(){
        $Dados["confirmacao"] = "Erro";
        $SQL = "DELETE FROM carrinho WHERE id_produto IS NOT NULL";
        try{
            $DEL = $this->Banco_query($SQL);
            $Dados["confirmacao"] = "Carrinho Limpo corretamente";
        }catch(Exception $e){
            $Dados["confirmacao"] = "Algo deu errado";
        }
        return $Dados;
    }
}

// $teste = new login("localhost:3306","root","","tde_web");
// $select = $teste->logar('gio@21.com','123456');
?>