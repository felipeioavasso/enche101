import 'package:enche_versao_101/telas_gerais/telaprincipal.dart';
import 'package:enche_versao_101/telas_user_comum/telacatalago.dart';
import 'package:enche_versao_101/telas_user_comum/telaperfil.dart';
import 'package:enche_versao_101/telas_user_posto/telacadastroposto.dart';
import 'package:enche_versao_101/telas_user_posto/telaperfilposto.dart';
import 'package:enche_versao_101/telas_user_posto/telapostos.dart';
import 'package:enche_versao_101/telas_user_posto/telaquerovender.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'telas_gerais/cadastro_inicial.dart';
import 'telas_gerais/login.dart';
import 'telas_gerais/menu_principal.dart';
import 'telas_user_posto/telacadastrocomb.dart';
import 'telas_user_posto/telaprincipalposto.dart';


Future<void> main() async {

  // Inicializar o Firestore
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enche',

      //
      // TEMA
      //
      theme: ThemeData(
        primaryColor: Color(0xFF3D5AFE),
        backgroundColor: Colors.brown[50],
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 18,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),


      //
      // ROTAS  DO  APP
      //
      initialRoute: '/telalogin',
      routes: {
        //Geral
        '/telalogin'            : (context) => Login(),
        '/cadastroInicial'      : (context) => CadastroInicial(),
        '/menuprincipal'        : (context) => MenuPrincipal(),        
        '/telaprincipal'        : (context) => TelaPrincipal(),

        //Usuario Comum
        '/telacatalogo'         : (context) => TelaCatalago(),
        '/telaperfil'           : (context) => TelaPerfilUsuario(),

        //Posto 
        '/telaprincipalPosto'   : (context) => TelaPrincipalPosto(),     
        '/telapostos'           : (context) => TelaPostos(),
        '/telaperfilposto'      : (context) => TelaPerfilPosto(),
        '/telacadastroposto'    : (context) => TelaCadastrarPosto(),
        '/telacadastrocomb'     : (context) => TelacadastroComb(),
        '/telaquerovender'      : (context) => TelaQueroVender(),        

      },
    )
  );  
}