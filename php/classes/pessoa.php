<?php
include_once('conexao.php');

class usuario extends conexao{

public ?string $nome;
private ?string $email;
private ?string $cpf;
public ?string $senha;
 

    public function atribuir(?string $nome,?string $email,?string $cpf,?string $senha){
        $this->nome = $nome;
        $this->email = $email;
        $this->cpf = $cpf;
        $this->senha = $senha;
    }

    public function inserir(){
        $SQL = "INSERT INTO usuario (nome_usuario,email,cpf,senha) 
        VALUES ('$this->nome','$this->email','$this->cpf','$this->senha')";
   
        $this->Banco_query($SQL);
    }
    }

?>