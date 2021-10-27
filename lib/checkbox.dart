import 'package:flutter/material.dart';

class EntradaCheckbox extends StatefulWidget {
  const EntradaCheckbox({ Key? key }) : super(key: key);

  @override
  _EntradaCheckboxState createState() => _EntradaCheckboxState();
}

class _EntradaCheckboxState extends State<EntradaCheckbox> {

  bool? _comidaBrasileira = false;
  bool? _comidaMexicana = false;

  String? _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Checkbox e RadioButtons"),),
      body: Container(
        child: Column(
          children: [
            CheckboxListTile(
              title: const Text("Comida brasileira"),
              subtitle: const Text("A melhor comida"),
              //selected: true,
              secondary: const Icon(Icons.add_box),
              activeColor: Colors.red,
              value: _comidaBrasileira, 
              onChanged: (bool? valor) {
                setState(() {
                  _comidaBrasileira = valor;
                });
              }
            ),
            CheckboxListTile(
              title: const Text("Comida brasileira"),
              subtitle: const Text("A melhor comida"),
              //selected: true,
              secondary: const Icon(Icons.add_box),
              activeColor: Colors.red,
              value: _comidaMexicana, 
              onChanged: (bool? valor) {
                setState(() {
                  _comidaMexicana = valor;
                });
              }
            ),
            Column(
              children: [
                RadioListTile(
                  title: const Text("Masculino"),
                  value:"m",
                  groupValue: _escolhaUsuario,
                  onChanged: (String? escolha) {
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                  },
                ),
                RadioListTile(
                  title: const Text("Feminino"),
                  value:"f",
                  groupValue: _escolhaUsuario,
                  onChanged: (String? escolha) {
                    setState(() {
                      _escolhaUsuario = escolha;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                print("comida brasileira:" + _comidaBrasileira.toString());
                print("comida mexicana:" + _comidaMexicana.toString());
                print("a pessoa que escolheu é do sexo: " + _escolhaUsuario!);
              }, 
              child: const Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}