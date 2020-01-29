import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/date_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _dataNascimentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  maxLength: 100,
                  maxLengthEnforced: false,
                  obscureText: false,
                  style: TextStyle(
                    color: Colors.black87
                  ),
                  decoration: InputDecoration(
                    labelText: "Informe seu nome completo",
                    hintText: "Informe seu nome",
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 3,
                maxLengthEnforced: true,
                obscureText: false,
                style: TextStyle(
                    color: Colors.black87
                ),
                decoration: InputDecoration(
                  labelText: "Informe sua idade",
                  hintText: "Ex.: 39",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: TextFormField(
                keyboardType: TextInputType.datetime,
                readOnly: true,
                onTap: () async {
                  await _selecionarData();
                },
                controller: _dataNascimentoController,
                decoration: InputDecoration(
                    labelText: "Data de nascimento"
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future _selecionarData() async {
    int anoAtual = DateTime.now().year;

    DateTime dataSelecionada = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(anoAtual - 120),
      lastDate: new DateTime.now(),

    );

    if(dataSelecionada != null)
      _dataNascimentoController.text = _formatarData(dataSelecionada);
  }

  String _formatarData(DateTime data){
    initializeDateFormatting('pt_BR');
    var formatador = DateFormat.yMMMMd("pt_BR");
    String dataFormatada = formatador.format(data);
    return dataFormatada;
  }

}
