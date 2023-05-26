<?php
class conexao
{ 
    public ?string $porta;
    private ?string $usuario;
    private ?string $pass;
    public ?string $banco;

    public function __construct(?string $porta,?string $usuario,?string $senha,?string $banco)
    {
        $this->porta = $porta;
        $this->usuario = $usuario;
        $this->pass = $senha;
        $this->banco = $banco;
    }

    
    public function Banco_query(?string $SQL){
        $Conexao = mysqli_connect($this->porta,$this->usuario,$this->pass,$this->banco);
        $Result = mysqli_query($Conexao,$SQL);
        

    }

    public function Select(?string $SQL){
        $Conexao = mysqli_connect($this->porta,$this->usuario,$this->pass,$this->banco);
        if($Count = mysqli_query($Conexao,$SQL)){
                $i = 0;
                while($row = mysqli_fetch_assoc($Count)){
                    $i += 1;
                    $Result = mysqli_query($Conexao,$SQL);
                }

                if($i==0){
                    throw new Exception("Nenhum registro encontrado");
                }
            
                return $Result;
        }else{
            throw new Exception("Algo deu Errado");
        }
        
       

    }
   
}

// $teste = new conexao("localhost:3306","root","","tde_web");
// $SQL = "INSERT INTO usuario (nome_usuario,email,cpf,senha) 
//         VALUES ('Jorge','Teste@teste08.com','12345641911','abcd')";
// $teste->Banco_query($SQL);
//$teste->Select("SELECT * FROM produto");
?>
