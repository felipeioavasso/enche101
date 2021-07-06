import 'package:enche_versao_101/telas_user_posto/barranavegacaoposto.dart';
import 'package:flutter/material.dart';

class TelaPerfilPosto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      drawer: BarraNavegacaoPosto(),

      appBar: AppBar(
        title: Text('Enche'),
        backgroundColor: Color(0xFF73AEF5),
      ),

      

      
      
      
    );
  }
}