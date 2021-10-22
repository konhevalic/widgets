import 'package:flutter/material.dart';

class Combustivel extends StatefulWidget {
  const Combustivel({ Key? key }) : super(key: key);

  @override
  _CombustivelState createState() => _CombustivelState();
}

class _CombustivelState extends State<Combustivel> {

  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();

  var _resultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = "Ops, algum valor não foi inserido";
      });
    } else if(0.7*precoGasolina >= precoAlcool) {
      setState(() {
        _resultado = "Melhor abastecer com alcool";
      });
     // _limparCampos();
    } else if (precoAlcool>=0.7*precoGasolina) {
      setState(() {
        _resultado = "Melhor abastecer com gasolina";
      });
      //_limparCampos();
    }
  }

  // void _limparCampos() {
  //   _controllerGasolina.text = "";
  //   _controllerAlcool.text = "";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Qual combustível colocar?"),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Image.asset('images/logo.png'),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecer seu carro!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87
                  )
                ),
              ),
              TextField(
                keyboardType: TextInputType.number, 
                decoration: const InputDecoration(
                  labelText: "Preço do álcool, ex: 4.99"
                ),
                style: const TextStyle(
                  fontSize: 18
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number, 
                decoration: const InputDecoration(
                  labelText: "Preço da gasolina, ex: 5.99"
                ),
                style: const TextStyle(
                  fontSize: 18
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: ElevatedButton (
                  child: const Text(
                    "Calcular",
                    style: TextStyle(fontSize: 16)
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    padding: const EdgeInsets.all(16)
                  ),
                  onPressed: _calcular,
                )
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    _resultado,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}