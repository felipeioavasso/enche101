import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'barranavegacaoposto.dart';

class TelacadastroComb extends StatefulWidget {
  @override
  _TelacadastroCombState createState() => _TelacadastroCombState();
}


class _TelacadastroCombState extends State<TelacadastroComb> {
  
  var txtgasolinaComum = TextEditingController();
  var txtgasolinaAd = TextEditingController();
  var txtetanol = TextEditingController();
  var txtdieselS500 = TextEditingController();
  var txtdieselS10 = TextEditingController();
  var txtgnv = TextEditingController();
  var txthorarioFunc = TextEditingController();  

  void getDocumentById(String id) async{
    await FirebaseFirestore.instance.collection('combustiveis').doc(id).get().then((resultado){
      txtgasolinaComum = resultado.get('gasolinaComum');
      txtgasolinaAd = resultado.get('gasolinaAd');
      txtetanol = resultado.get('etanol');
      txtdieselS500 = resultado.get('diesels500');
      txtdieselS10 = resultado.get('diesels10');
      txtgnv = resultado.get('gnv');
      //txthorarioFunc = TextEditingController();  
    });
  }

  @override
  Widget build(BuildContext context) {

    var id = ModalRoute.of(context)?.settings.arguments;

    if ( id != null){
      if (txtgasolinaComum.text == '' && txtgasolinaAd.text == '' && txtetanol.text == '' && txtdieselS500.text == '' && txtdieselS10.text == '' && txtgnv.text == ''){
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
          padding: EdgeInsets.all(40),
          child: Column(
            children:[
              Column(
                children: <Widget>[
                  Text("Por quanto você quer vender?",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  SizedBox(height: 20),                
                ],
              ),

              Column(
                children: [

                  // Textfield GASOLINA COMUM
                  TextField(
                    controller: txtgasolinaComum,
                      decoration: InputDecoration(
                      labelText: 'Preço Gasolina Comum',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Textfield GASOLINA ADITIVADA
                  TextField(
                    controller: txtgasolinaAd,
                    decoration: InputDecoration(
                      labelText: 'Preço Gasolina Aditivada',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Textfield ETANOL
                  TextField(
                    controller: txtetanol,
                    decoration: InputDecoration(
                      labelText: 'Preço Etanol',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Textfield DIESEL S 500
                  TextField(
                    controller: txtdieselS500,
                    decoration: InputDecoration(
                      labelText: 'Preço Diesel S 500',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Textfield DIESEL S10
                  TextField(
                    controller: txtdieselS10,
                    decoration: InputDecoration(
                      labelText: 'Preço Diesel S 10',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Textfield GNV
                  TextField(
                    controller: txtgnv,
                    decoration: InputDecoration(
                      labelText: 'Preço GNV',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),

                  // Textfield Horario de funcionamento
                  /* TextField(
                    controller: txthorarioFunc,
                    decoration: InputDecoration(
                      labelText: 'Horário de Funcionamento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10), */

                  ElevatedButton(
                    child: Text('Salvar'),
                    onPressed: (){
                      
                      var db = FirebaseFirestore.instance;

                        if (id == null){
                          db.collection('combustiveis').add(
                            {
                            'gasolinaComum' : txtgasolinaComum.text,
                            'gasolinaAd'    : txtgasolinaAd.text,
                            'etanol'        : txtetanol.text,
                            'diesels500'    : txtdieselS500.text,
                            'diesels10'     : txtdieselS10.text,
                            'gnv'           : txtgnv.text,
                            }
                          );
                        }else{
                          db.collection('combustiveis').doc(id.toString()).update(
                            {
                              'gasolinaComum' : txtgasolinaComum.text,
                              'gasolinaAd'    : txtgasolinaAd.text,
                              'etanol'        : txtetanol.text,
                              'diesels500'    : txtdieselS500.text,
                              'diesels10'     : txtdieselS10.text,
                              'gnv'           : txtgnv.text,
                            }
                          );
                        }
                        Navigator.pushNamed(context,'/telapostos');                      
                    },
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