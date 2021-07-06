import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'barradenagevacao.dart';
//
// TELA PRINCIPAL
//
class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  
  //Referenciar a coleção nomeada "cafes"
  late CollectionReference cafes;

  @override
  void initState(){
    super.initState();
    cafes = FirebaseFirestore.instance.collection("cafes");
  }
  
  //
  // Definir a aparência de como cada documento deve ser exibido
  //
  Widget exibirDocumento(item){

    //Converter um DOCUMENTO em um OBJETO
    //Cafe cafe = Cafe.fromJson(item.data(), item.id);

    return ListTile(
     /*  title: Text(cafe.nome, style: TextStyle(fontSize: 26)),
      subtitle: Text('R\$ ${cafe.preco}', style: TextStyle(fontSize: 22, fontStyle: FontStyle.italic)),

      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: (){
          //
          // Apagar um documento da coleção "cafes"
          //
          cafes.doc(cafe.id).delete();
        },
      ),

      onTap: (){
        Navigator.pushNamed(context, '/cadastro', arguments: cafe.id);
      } */

    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      drawer: BarradeNavegacao(),

      appBar: AppBar(
        title: Text('Enche'),
        backgroundColor: Color(0xFF73AEF5),
      ),

      

      //
      // Exibir os documentos
      //
      body: Container(
        padding: EdgeInsets.all(30),
        child: StreamBuilder<QuerySnapshot>(

          //fonte de dados
          stream: cafes.snapshots(),

          //aparência
          builder: (context, snapshot){

            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Center(child: Text('Erro ao conectar ao Firestore'));

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
                //dados recebidos do Firestore
                final dados = snapshot.requireData;

                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context,index){
                    return exibirDocumento(dados.docs[index]);
                  }
                );
            }
          }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF73AEF5),
        child: Icon(Icons.search),
        onPressed: (){
            Navigator.pushNamed(context, '');
        }
      ),
    );
  }
}