import 'package:enche_versao_101/telas_gerais/barradenagevacao.dart';
import 'package:flutter/material.dart';

class TelaQueroVender extends StatefulWidget {
  @override
  _TelaQueroVenderState createState() => _TelaQueroVenderState();
}

class _TelaQueroVenderState extends State<TelaQueroVender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: BarradeNavegacao(),
      appBar: AppBar(
        title: Text('Enche'),
        backgroundColor: Color(0xFF73AEF5),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Center(child: Text('Escolha o seu plano', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
            ],
          ),
        ),
      ),


    );
  }
}