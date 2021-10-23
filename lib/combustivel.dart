import 'package:flutter/material.dart';
import 'package:extended_masked_text/extended_masked_text.dart';

class Combustivel extends StatefulWidget {
  const Combustivel({ Key? key }) : super(key: key);

  @override
  _CombustivelState createState() => _CombustivelState();
}

class _CombustivelState extends State<Combustivel> {

  final TextEditingController _controllerAlcool = MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');
  final TextEditingController _controllerGasolina = MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: '.');

  var _resultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text.replaceAll(',', '.'));
    double? precoGasolina = double.tryParse(_controllerGasolina.text.replaceAll(',', '.'));

    if(precoAlcool == null || precoGasolina == null) {
      setState(() {
        _resultado = "Ops, algum valor não foi inserido";
      });
    } else if(0.7*precoGasolina >= precoAlcool) {
      setState(() {
        _resultado = "Melhor abastecer com alcool";
      });
    } else if (precoAlcool>=0.7*precoGasolina) {
      setState(() {
        _resultado = "Melhor abastecer com gasolina";
      });
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

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
                  icon: Icon(Icons.monetization_on),
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
                  icon: Icon(Icons.monetization_on),
                  labelText: "Preço da gasolina, ex: 5.99"
                ),
                style: const TextStyle(
                  fontSize: 18
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton (
                      child: const Text(
                        "Limpar campos",
                        style: TextStyle(fontSize: 16)
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red[900],
                        padding: const EdgeInsets.all(16)
                      ),
                      onPressed: _limparCampos,
                    ),
                    ElevatedButton (
                      child: const Text(
                        "Calcular",
                        style: TextStyle(fontSize: 16)
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue[900],
                        padding: const EdgeInsets.all(16)
                      ),
                      onPressed: _calcular,
                    ),
                  ],
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