import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enche_versao_101/model/dadosusuarios.dart';
import 'package:enche_versao_101/telas_gerais/barradenagevacao.dart';
import 'package:flutter/material.dart';

class TelaPerfilUsuario extends StatefulWidget {
  @override
  _TelaPerfilUsuarioState createState() => _TelaPerfilUsuarioState();
}

class _TelaPerfilUsuarioState extends State<TelaPerfilUsuario> {
  late CollectionReference usuarios;

  @override
  void initState(){
    super.initState();
    usuarios = FirebaseFirestore.instance.collection("usuarios");
  }

  Widget exibirDocumento(item){
    DadosUsuarios user = DadosUsuarios.fromJson(item.data(), item.id);
  
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      width: MediaQuery.of(context).size.width * 0.4,
      child: Column(
        children: [
          Text(user.nome, textAlign: TextAlign.left , style: TextStyle(fontSize: 26,)),
          Text(user.email, textAlign: TextAlign.left , style: TextStyle(fontSize: 26,)),
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
          stream: usuarios.snapshots(),
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