function btn_login(){
    window.location.assign("index.html");
}
function confcampos(){
    if(document.getElementById("csenha").value != document.getElementById("senha").value){
        alert("Senhas não conferem");
      
    }else{
        document.getElementById("Usuario").value = document.getElementById("usuario").value;
        document.getElementById("Email").value = document.getElementById("email").value;
        document.getElementById("Cpf").value = document.getElementById("cpf").value;
        document.getElementById("Senha").value = document.getElementById("senha").value;
        document.getElementById("CSenha").value = document.getElementById("csenha").value;

        // var form = document.getElementById("formulario").children;
        var cform = document.getElementById("form-cadastro").children;
        var aux = 0;
        for (var i = 6; i<cform.length; i++){
            if(cform[i].value == ''){
                //alert("ola00");
                console.log(cform[i].name+" vazio");
                aux = aux + 1;
            }
        }
        if(aux == 0){
            cadastro();
        }
        else{
            alert("Existem campos não preenchidos");
        }
    }
}
function csenha(){
    var senha = document.getElementById("senha");
    var csenha = document.getElementById("csenha");
    if(((senha != "") && (csenha != "")) && (senha==csenha) ){
        confcampos();
        
    }else{
        alert("Senha inválida");
    }
}
function cadastro(){
    var form = document.getElementById("form-cadastro");
    var dados = new FormData(form);

    fetch("./php/cadastrar.php",{
        method:"Post",
        body:dados
    }).then( async function(response){
        var resposta = await response.json();
        console.log(resposta);
        alert(resposta);
        if(resposta=="Gravado com sucesso"){
            window.location.assign("index.html");
        }
        
    })
}