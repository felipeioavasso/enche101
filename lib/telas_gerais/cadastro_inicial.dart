import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroInicial extends StatefulWidget {
  @override
  _CadastroInicial createState() => _CadastroInicial();
}

class _CadastroInicial extends State<CadastroInicial> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          
          child: ListView(
            children: [

              TextField(
                controller: txtNome,
                style: TextStyle(
                  color: Color(0xFF3D5AFE), fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: 'Nome'),
              ),
              SizedBox(height: 20),

              TextField(
                controller: txtEmail,
                style: TextStyle(
                  color: Color(0xFF3D5AFE), fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person), labelText: 'E-mail'),
              ),
              SizedBox(height: 20),

              TextField(
                obscureText: true,
                controller: txtSenha,
                style: TextStyle(
                  color: Color(0xFF3D5AFE), fontWeight: FontWeight.w300),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock), labelText: 'Senha'),
              ),
              SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: OutlinedButton(
                      child: Text('Criar'),
                      onPressed: () {
                        criarConta(txtNome.text, txtEmail.text, txtSenha.text);
                      },
                    ),
                  ),

                  Container(
                    width: 150,
                    child: OutlinedButton(
                      child: Text('Cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }


  //
  // CRIAR CONTA no Firebase Auth
  //
  void criarConta(nome, email, senha){

    FirebaseAuth fa = FirebaseAuth.instance;

    fa.createUserWithEmailAndPassword(email: email, password: senha).then((resultado){
      //armazenar dados adicionais no Firestore

      var db = FirebaseFirestore.instance;
      db.collection('usuarios').doc(resultado.user!.uid).set(
        {
          'nome': nome,
          'email': email
        }
      ).then((valor){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Usuário criado com sucesso'),
            duration: Duration(seconds:2),
          )
        );
      });
      Navigator.pushNamed(context, '/telaprincipal');     
    }).catchError((erro){
      if(erro.code == 'email-already-in-use'){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro: ${erro.message}'),
            duration: Duration(seconds: 2),
          )
        );
      }
    });
  }
}