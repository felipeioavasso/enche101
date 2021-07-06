import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
              //
              // FIGURA 
              //
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/bomba.jpg")),
                ),
              ),
              //
              // BOTÃO LOGIN
              //
              Column(
                children: <Widget>[
                  MaterialButton(
                    //minWidth: double.infinity,
                    minWidth: 350,
                    height: 50,
                    onPressed: (){Navigator.pushNamed(context, '/login'); },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),

                    child: Text('Login',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  //
                  // BOTÃO Cadastrar
                  //
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: 350,
                    height: 50,
                    onPressed: (){   
                      Navigator.pushNamed(context, '/cadastroInicial');            
                    },
                    color: Color(0xFF3D5AFE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ), 
      ),
    );
  }
}