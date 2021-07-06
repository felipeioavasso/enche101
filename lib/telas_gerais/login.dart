import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF73AEF5),
              Color(0xFF61A4F1),
              Color(0xFF47BDE0),
              Color(0xFF39BAE5),
            ],
            stops: [0.1,0.4,0.7,0.9],
          ),
        ),
        padding: EdgeInsets.only(top:50, bottom: 50, left: 50, right: 50),
        child: ListView(
           children:[
             Column(
                children: <Widget> [
                  Text('Enche',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text('Seja bem-vindo(a) ao Enche.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),



            TextField(
              controller: txtEmail,
              style:
              TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email), labelText: 'Email', filled: true, fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            TextField(
              obscureText: true,
              controller: txtSenha,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock), labelText: 'Senha', filled: true, fillColor: Colors.white,),
            ),
            SizedBox(height: 70),

            Container(
              width: 100,
              height: 30,
              child: OutlinedButton(
                child: Text('Entrar', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
                onPressed: (){ 
                //Navigator.pushNamed(context, '/telaprincipal');
                  setState(() {
                    isLoading = true;
                  });
                  login(txtEmail.text, txtSenha.text);
                },
              ),
            ),
            SizedBox(height: 20),

            Container(
              width: 100,
              child: TextButton(
                child: Text('Criar conta', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
                onPressed: (){
                  Navigator.pushNamed(context, '/cadastroInicial');
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //
  // LOGIN com Firebase Auth
  //
  void login(email, senha) {

    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: senha).then((resultado) {

      isLoading = false;
      Navigator.pushReplacementNamed(context, /*'/telapostos'*/ '/telaprincipal');

    }).catchError((erro){
      var mensagem = '';
      if (erro.code == 'user-not-found'){
        mensagem = 'ERRO: Usuário ou senha inválidos';
      }else if (erro.code == 'wrong-password'){
        mensagem = 'ERRO: Usuário ou senha inválidos';
      }else if ( erro.code == 'invalid-email'){
        mensagem = 'ERRO: Usuário ou senha inválidos';
      }else{
        mensagem = erro.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$mensagem'),
          duration: Duration(seconds:2)
        )
      );
    });
  }
}