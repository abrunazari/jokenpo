import 'package:flutter/material.dart';
import 'dart:math';
class Jogo extends StatefulWidget {

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  
  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";


  void _opcaoSelecionada (String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes [numero];


    print("Escolha do Usuario: " + escolhaUsuario);
    print("Escolha do App: " + escolhaApp);

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.jpg");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.jpg");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.jpg");
        });
        break;
    }
    //Validação do resultado
    //Usuario Ganhador
    if (
        (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Parabéns! Você ganhou :)";
      });

    //App Ganhador
    } else if (

        (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "pedra" && escolhaApp == "papel")
    ){
      setState(() {
        this._mensagem = "Que pena! Você perdeu :(";
      });

    } else {
      setState(() {
        this._mensagem = "Houve um empate!";
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
          Container(
            padding: EdgeInsets.only(top:32,bottom: 16),
            child:
            Text (
                "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left:120, right: 120, top:16, bottom: 16),
            child:  Image (
                image: this._imagemApp,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left:120, right: 120, top:16, bottom: 16),
            child: Text(
               this._mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>
            [
              GestureDetector(
                onTap: () => _opcaoSelecionada ("papel"),
                child:  Image.asset(
                  "imagens/papel.jpg", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada ("pedra"),
                child:  Image.asset(
                  "imagens/pedra.jpg", height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada ("tesoura"),
                child:  Image.asset(
                  "imagens/tesoura.jpg", height: 100,)
                ,)
            ],
          )
        ],
      ),
    );
  }
}
