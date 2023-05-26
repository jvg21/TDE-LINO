function camisas(id){
    fetch("../php/mostrar_produto.php", { 
        method: "GET",

    }).then(async function (resposta) {
        var objeto = await resposta.json();
        if(objeto[0].confirmacao == "Dados encontrados"){
            listarProdutos(objeto,id);
        }
        else{
            alert("Erro na página");
        }
        
    });
}
function listarProdutos(produtos,idx){
    for(var i = 0;i<produtos.length;i++){
        // console.log(produtos[i].categoria+" "+produtos[i].nome_produto);
        if(produtos[i].categoria == idx){
            conteudo = "";
            conteudo+= '<div class="card"  width: 18rem;>';
            if(produtos[i].imagem == "erro"){
                conteudo+='<img src="../imagens/blank.png" class="card-img-top"  height="300" alt="...">';
            }else{

                conteudo+='<img src="../imagens/'+produtos[i].imagem+'" class="card-img-top" height="300" alt="...">';

            }
            
            conteudo+='<div class="card-body">';
            conteudo+='<h5 class="card-title">'+produtos[i].nome_produto+'</h5>'
            conteudo+='<p class="card-text">R$ '+produtos[i].preco+'</p>';
            conteudo+='<p class="card-text">Quantidade</p>';
            conteudo+='<form id="carrinho-valores">';
            conteudo+='<input type="number" name="qtde-carrinho" id="quantidade'+produtos[i].id_produto+'" value="1" placeholder="quantidade" min="1" max="4" size="3"><br/><br/>';
            conteudo+='<input type="hidden" name="id_h" id="id_h" value="'+produtos[i].id+'" >';
            conteudo+='<input type="hidden" id="nome_h'+produtos[i].id_produto+'" value="'+produtos[i].nome_produto+'" ></form>';
            conteudo+='<a  class="btn btn-primary" onclick="carrinho('+produtos[i].id_produto+')">Adicionar carrinho</a></div></div>';
            document.getElementById("divcamisa").innerHTML +=conteudo;
        
        }
        
      
    }
}
function carrinho(id){
    var quantidade = document.getElementById("quantidade"+id).value
    var idnome = "nome_h";
    idnome = idnome.concat(id);
    var vnome = document.getElementById(idnome).value

    valores = {qtde:quantidade, id_produto:id,nome:vnome}
    console.log(valores);

    var fd = new FormData();

    for(var i in valores){
        fd.append(i,valores[i]);
    }


    if(quantidade<1 || quantidade>4){
        alert("Quantidade de produtos inválida");
        document.getElementById("quantidade"+id).value = 1;
        
    }
    else{
        
        fetch("../php/cad_carrinho.php",{
            method:"Post",
            body:fd
        }).then(async function(response){
            var resposta = await response.json();
            console.log(resposta);
        })

       alert("Produto "+vnome+" adcionado ao carrinho\n("+quantidade+" unidades)");

    }
    
}
function muda_campos(){
    var opcao = document.getElementById("pgto").value;

    if(opcao=="Credito"){
        var conteudo = "<br/>";
        conteudo +='<label>Número cartão: </label><input type="number" id="nc"size="16" maxlength="16"><br/>';
        conteudo +='<label>Mês validade: </label><input type="number" id="mv"size="16" min="1" max="12"  maxlength="2"><br/>';
        conteudo +='<label>Ano validade: </label><input type="number" id="av"size="16" min="2022" max="2040" maxlength="4"><br/>';
        conteudo +='<label>CVV: </label><input type="number" size="16"min="100" max="999" id="cvv"maxlength="3"><br/>';
        conteudo +='<button type="button" onclick="fcompra()">Finalizar compra</button>';
        document.getElementById("campos").innerHTML= conteudo;

    }else if(opcao=="Pix"){
        var conteudo = "<br/>";
        conteudo +='<img src="imagens/qr.png"><br/>';
        conteudo +='<button type="button" onclick="fcompra()">Finalizar compra</button>';
        document.getElementById("campos").innerHTML= conteudo;
    }else{
        document.getElementById("campos").innerHTML= "";
    }
}
function fcompra(){
    var user = document.getElementById("user").value;
    var end = document.getElementById("endereco").value;
    var opcao = document.getElementById("pgto").value;
    var ccpf = document.getElementById("cpf").value;

    var valores = {usuario:user,cpf:ccpf,endereco:end,fpgto:opcao} 

    if (opcao=="nulo"){
        alert("Opção inválida de pagamento");
    }else if(opcao=="Pix"){
        var form = new FormData();
        var x = 0;
        for(var i in valores){
            if(valores[i]==""){
                alert("Algum campo não foi preenchido");
                x=1;
                break;
            }else{
                form.append(i,valores[i]);
            }
            
        }
        if(x==0){
            fetch("./php/fazer_pagamento.php",{
                method:"Post",
                body:form
            }).then( async function(response){
                var resposta = await response.json();
                console.log(resposta);
                alert(resposta);
                
            })
            alert("A entrega só será realizada após a validação do pagamento");
            window.location.assign("PgInicial.html");
        }

        

    }else if(opcao=="Credito"){
        var nc = document.getElementById("nc").value;
        var mv = document.getElementById("mv").value;
        var av = document.getElementById("av").value;
        var cvv = document.getElementById("cvv").value;

        mv = mv.concat("/");
        var val = mv.concat(av);
        console.log(val);
        var cartao ={num:nc,validade:val,cod:cvv};
        var form = new FormData();
        var x = 0;
        for(var i in valores){
            if(valores[i]==""){
                x=1;
                break;
            }else{
                form.append(i,valores[i]);
            }
            
        }
        // for(var i in cartao){
        //     if(cartao[i]==""){
        //         x=1;
        //         break;
        //     }else{
        //         form.append(i,cartao[i]);
        //     }   
        // }
        if(x==0){
            fetch("./php/fazer_pagamento.php",{
                method:"Post",
                body:form
            }).then( async function(response){
                var resposta = await response.json();
                console.log(resposta);
                alert(resposta);
                
            })
            alert("Compra Executada");
            window.location.assign("PgInicial.html");
        }else{
            alert("Algum campo não foi preenchido");
        }
    }

}