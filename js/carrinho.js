function camisas(){
    fetch("php/mostrar_carrinho.php", { 
        method: "GET",

    }).then(async function (resposta) {
        var objeto = await resposta.json();
        //console.log(objeto[1]);
        if(objeto[0].confirmacao == "Dados encontrados"){
            listarProdutos(objeto);
            // console.log(objeto[1].nome_produto);
        }
        else{
            console.log("oi");
            alert(objeto[0].confirmacao);
        }
        
    });
}
function limpar_carrinho(){
    fetch("php/limpar_carrinho.php", { 
        method: "GET",

    }).then(async function (resposta) {
        var objeto = await resposta.json();
        if(objeto.confirmacao == "Carrinho Limpo corretamente"){
            alert(objeto.confirmacao);
            location.reload();
            // console.log(objeto[1].nome_produto);
        }
        else{
            alert(objeto.confirmacao);
        }
        
    });
}
function listarProdutos(produto){
    var total = 0;
    var conteudo = "";
    for(var i = 1;i<produto.length;i++){
        produto[i].preco = parseFloat(produto[i].preco);
        total += (produto[i].preco*produto[i].quantidade);


        conteudo = "";
        conteudo+='<tr>';
        conteudo+='<th>'+produto[i].nome_produto+'</th>';
        conteudo+='<th>'+produto[i].preco+'</th>';
        conteudo+='<th>'+produto[i].quantidade+'</th></tr>';
        document.getElementById("Tabela").innerHTML +=conteudo;
      
    }
    console.log(total);
    document.getElementById("Total").innerHTML='Total R$: '+total;
    document.getElementById("total_compra").value = total;
}
function btn_pagamento(){
    var total = document.getElementById("total_compra").value;
    if(total == 0){
        alert("Não Há nada no carrinho");

    }else{
        window.location.assign("pagamento.html");
    }
    
}