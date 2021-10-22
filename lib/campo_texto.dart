import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({ Key? key }) : super(key: key);

  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrada de dados"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite um valor"
              ),
              //enabled: false,
              maxLength: 5,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
              obscureText: true,
              // onChanged: (String texto){
              //   print('Valor digiado: ' + texto);
              // },
              onSubmitted: (String texto){
                print('Valor digiado: ' + texto);
              },
              controller: _textEditingController,
            ),
          ),
          ElevatedButton (
              child: const Text('Salvar'),
              onPressed: () {
                print('Valor: ' + _textEditingController.text);
              },
            )
        ],
      ),
    );
  }
}