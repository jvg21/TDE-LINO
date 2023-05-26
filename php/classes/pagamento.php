<?php

include_once('conexao.php');

class pagamento extends conexao{
    protected ?string $nome;
    protected ?string $endereco;
    protected ?string $cpf;

    public function atribuir(?string $user,?string $endereco,?string $cpf)
    {
        $this->nome = $user;
        $this->endereco = $endereco;  
        $this->cpf = $cpf;  
    }
    public function buscar(){
        try {
            $SQL = "SELECT id_usuario from usuario where cpf='$this->cpf' and nome_usuario='$this->nome'";
            $SLC = $this->Select($SQL);

            while ($row = mysqli_fetch_assoc($SLC)) {
                $Id = $row["id_usuario"];
            }
        } catch (Exception $e) {
            $Id = "Usuário não encontrado";
        }
        return $Id;
        
    }
    public function cadastrar_venda(int $id,?string $opcao,?string $endereco){
        include_once('carrinho.php');
        $pro_01 = new carrinho("localhost:3306","root","","tde_web");
        $retorno = $pro_01->listar_carrinho();

        echo $retorno[0]["tamanho"];
        $tam = $retorno[0]["tamanho"];

        $hoje = date('Y/m/d');
        for($i = 1;$i<$tam;$i++){
            $idp = $retorno[$i]["id"];
            $valor = $retorno[$i]["preco"];
            $qtde = $retorno[$i]["quantidade"];

            $SQL = "INSERT INTO venda (id_produto,id_usuario,valor,quantidade,datap,forma_pagamento,endereco)
            VALUES ('$idp','$id','$valor','$qtde','$hoje','$opcao','$endereco')";
            $this->Banco_query($SQL);
        }
        $pro_01->limpar_carrinho();

    }




}