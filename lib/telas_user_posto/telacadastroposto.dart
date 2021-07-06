import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'barranavegacaoposto.dart';

//
//  Colocar um condicional: Se o cadastro do posto já estiver feito
//  ir para a tela de colocar o preço
//

class TelaCadastrarPosto extends StatefulWidget {
  @override
  _TelaCadastrarPostoState createState() => _TelaCadastrarPostoState();
}

class _TelaCadastrarPostoState extends State<TelaCadastrarPosto> {
  
  var txtnomeposto = TextEditingController();
  var txtcnpj = TextEditingController();
  var txtestado = TextEditingController();
  var txtcidade = TextEditingController();
  var txtendereco = TextEditingController();
  var txthorariofunc = TextEditingController();

  //
  // RECUPERAR UM DOCUMENTO a partir do ID
  //
  void getDocumentById(String id) async{
    await FirebaseFirestore.instance
      .collection('posto').doc(id).get()
      .then((resultado) {
        txtnomeposto.text = resultado.get('nome do posto');
        txtcnpj.text = resultado.get('cnpj');
        txtestado.text = resultado.get('estado');
        txtcidade.text = resultado.get('cidade');
        txtendereco.text = resultado.get('endereco');
      });
  }
 
  
  @override
  Widget build(BuildContext context) {

    //
    // RECUPERAR o ID do docmento que foi passado como argumento
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if ( id != null){
      if (txtnomeposto.text == '' && txtcnpj.text == '' && txtestado.text == '' && txtcidade.text == '' && txtendereco.text == ''){
        getDocumentById(id.toString());
      }
    }


    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: BarraNavegacaoPosto(),
      appBar: AppBar(
        title: Text('Enche'),
        backgroundColor: Color(0xFF73AEF5),
      ),
      
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 40,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Cadastre o seu Posto",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),                 
                ],
              ),

              TextField(
              controller: txtnomeposto,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
              decoration: InputDecoration(labelText: 'Nome do posto'),
              ),
              SizedBox(height: 10),

              TextField(
                controller: txtcnpj,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(labelText: 'Cnpj'),
              ),
              SizedBox(height: 8),

              TextField(
                controller: txtestado,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  labelText: 'Estado'),
              ),
              SizedBox(height: 8),

              TextField(
                controller: txtcidade,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  labelText: 'Cidade'),
              ),
              SizedBox(height: 8),

              TextField(
                controller: txtendereco,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  labelText: 'Endereço'),
              ),
              SizedBox(height: 8),      

              //
              // Botão Próximo
              //
              Container(                
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: (){ 

                    var db = FirebaseFirestore.instance;

                    if (id == null){
                      db.collection('posto').add({
                        'nome do posto' : txtnomeposto.text,
                        'cnpj'          : txtcnpj.text,
                        'estado'        : txtestado.text,
                        'cidade'        : txtcidade.text,
                        'endereco'      : txtendereco.text,
                      });
                    }else{
                      db.collection('posto').doc(id.toString()).update(
                        {
                        'nome do posto' : txtnomeposto.text,
                        'cnpj'          : txtcnpj.text,
                        'estado'        : txtestado.text,
                        'cidade'        : txtcidade.text,
                        'endereco'      : txtendereco.text,
                        }
                      );
                    }

                    Navigator.pushNamed(context, '/telapostos');
                  },
                  color: Color(0xFF3D5AFE),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  
                  child: Text(
                    "Próximo",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}