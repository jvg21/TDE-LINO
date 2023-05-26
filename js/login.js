function confcampos(){
    document.getElementById("Usuario").value = document.getElementById("usuario").value;
   

    // var form = document.getElementById("formulario").children;
    var cform = document.getElementById("form-login").children;
    var aux = 0;
    for (var i = 2; i<cform.length; i++){
        if(cform[i].value == ''){
            //alert("ola00");
            console.log(cform[i].name+" vazio");
            aux = aux + 1;
        }
    }
    if(aux == 0){
        login();
    }
    else{
        alert("Existem campos não preenchidos");
    }
}
function btn_cadastro(){
    window.location.assign("cadastro.html");
}
function login(){
    var form = document.getElementById("form-login");
    var dados = new FormData(form);

    fetch("./php/logar.php",{
        method:'Post',
        body:dados
    }).then(async function(response){
        var resposta = await response.json();
        conf_login(resposta);
        // alert("sucesso");
    });

}
function conf_login(retornologin){
    if(retornologin.confirmacao == "produto Existe"){
        alert(retornologin.nome+", Login Efetuado com sucesso");
        window.location.assign("cadastro.html");

    }else{
        alert(retornologin.confirmacao);
    }
}