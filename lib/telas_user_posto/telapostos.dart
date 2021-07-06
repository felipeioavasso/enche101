import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enche_versao_101/model/cadastroposto.dart';
import 'package:enche_versao_101/telas_user_posto/barranavegacaoposto.dart';
import 'package:flutter/material.dart';

class TelaPostos extends StatefulWidget {
  @override
  _TelaPostosState createState() => _TelaPostosState();
}

class _TelaPostosState extends State<TelaPostos> {
  //Referenciando a coleção 'posto' no firebase
  late CollectionReference posto;

  @override
  void initState(){
    super.initState();
    posto = FirebaseFirestore.instance.collection("posto");
  }

  Widget exibirDocumento(item){
    CadastroPosto posto = CadastroPosto.fromJson(item.data(), item.id);

    //------->  Versão: 2
    return InkWell(
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(posto.nomeposto, textAlign: TextAlign.left , style: TextStyle(fontSize: 26,)),
              ],
            ),  
            Text(posto.endereco, textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      onTap: () {Navigator.pushNamed(context, '/telacadastrocomb');},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      drawer: BarraNavegacaoPosto(),

      appBar: AppBar(
        title: Text('Enche'),
        backgroundColor: Color(0xFF73AEF5),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        
        child: StreamBuilder<QuerySnapshot>(

          stream: posto.snapshots(),
          builder: (context, snapshot){
            
            switch(snapshot.connectionState){

              case ConnectionState.none:
                return Center(child: Text('Erro ao conectar a internet'));

              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());

              default:
              final dados = snapshot.requireData;

              return ListView.builder(
                itemCount: dados.size,
                itemBuilder: (context, index){
                  return exibirDocumento(dados.docs[index]);
                },
              );
            }
          },

        ),
      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF73AEF5),
        child: Icon(Icons.add),
        onPressed: (){
            Navigator.pushNamed(context, '/telacadastroposto' );
        }
      ),
    );
  }
}


//------->   Versão: 1
    /* return InkWell(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(posto.nomeposto, textAlign: TextAlign.left , style: TextStyle(fontSize: 26,)),
              ],
            ),  
            //Text(posto.nomeposto, textAlign: TextAlign.left , style: TextStyle(fontSize: 26,)),
            Text(posto.endereco, textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      onTap: () {},
    ); */
    //------->  Versão: 1