import 'dart:math';
import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolharUsuario){

    var opcoes =  ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case 'pedra':
        setState(() {
          this._imagemApp = AssetImage("imagens/pedra.png");
        });
        break;

      case 'papel':
        setState(() {
          this._imagemApp = AssetImage("imagens/papel.png");
        });
        break;

      case 'tesoura':
        setState(() {
          this._imagemApp = AssetImage("imagens/tesoura.png");
        });

        break;
    }

    if((escolharUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolharUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolharUsuario == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._mensagem = "Você venceu!";
      });
    }else if(
        (escolhaApp == "pedra" && escolharUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolharUsuario == "papel") ||
        (escolhaApp == "papel" && escolharUsuario == "pedra")
    ){
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    }else{
      setState(() {
        this._mensagem = "Empate!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(top:32, bottom: 16),
            child: Text(
                "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),

          ),
          Image(image: this._imagemApp),
          Padding(
            padding: EdgeInsets.only(top:32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),

          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 95),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("papel"),
                child: Image.asset("imagens/papel.png", height: 95),
              ),
              GestureDetector(
                onTap: ()=> _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 95),
              ),

              /*
              Image.asset("imagens/pedra.png", height: 95),
              Image.asset("imagens/papel.png", height: 95),
              Image.asset("imagens/tesoura.png", height: 95),
               */
            ],
          )
        ],
      ),

    );
  }
}
