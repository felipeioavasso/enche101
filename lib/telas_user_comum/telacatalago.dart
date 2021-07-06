import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enche_versao_101/model/cadastrocomb.dart';
import 'package:enche_versao_101/model/cadastroposto.dart';
import 'package:enche_versao_101/telas_gerais/barradenagevacao.dart';
import 'package:flutter/material.dart';



class TelaCatalago extends StatefulWidget {
  @override
  _TelaCatalagoState createState() => _TelaCatalagoState();
}

class _TelaCatalagoState extends State<TelaCatalago> {
  //Referenciando a coleção 'posto' no firebase
  late CollectionReference posto, combustiveis;  

  @override
  void initState(){
    super.initState();
    posto = FirebaseFirestore.instance.collection("posto");
    combustiveis = FirebaseFirestore.instance.collection("posto").doc("0ieqrPgDzFiKdwpOhnm3").collection("combustivel");
  }

  Widget exibirDocumento(item){
    CadastroPosto posto = CadastroPosto.fromJson(item.data(), item.id);
    Combustivel comb = Combustivel.fromJson(item.data(), item.id);

    //------->  Versão: 2
    return Container(
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
              Text(posto.nomeposto, textAlign: TextAlign.left , style: TextStyle(fontSize: 26)),
              Text('Etanol: ${comb.etanol}', textAlign: TextAlign.right , style: TextStyle(fontSize: 26))
            ],
          ),  
          Text(posto.endereco, textAlign: TextAlign.left, style: TextStyle(fontSize: 16)),
        ],
      ),
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
    );
  }
}

class BarraNavegacao {
}