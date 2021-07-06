import 'package:enche_versao_101/telas_user_posto/telaperfilposto.dart';
import 'package:enche_versao_101/telas_user_posto/telapostos.dart';
import 'package:enche_versao_101/telas_user_posto/telaprincipalposto.dart';
import 'package:enche_versao_101/telas_user_posto/telaquerovender.dart';
import 'package:flutter/material.dart';

class BarraNavegacaoPosto extends StatefulWidget {
  @override
  _BarraNavegacaoPostoState createState() => _BarraNavegacaoPostoState();
}

class _BarraNavegacaoPostoState extends State<BarraNavegacaoPosto> {
  get hoverColor => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color(0xFF73AEF5),
        child: ListView(
          children: <Widget> [

            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Perfil',
              icon: Icons.account_circle,
              oncClicked: () => selectedItem(context, 0),
            ),

            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Inicial',
              icon: Icons.home,
              oncClicked: () => selectedItem(context, 1),
            ),

            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Qrcode',
              icon: Icons.qr_code,
              oncClicked: () => selectedItem(context, 2),
            ),

            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Quero vender',
              icon: Icons.local_gas_station_outlined,
              oncClicked: () => selectedItem(context, 3),
            ),

            /* const SizedBox(height: 20),
            buildMenuItem(
              text: 'Conveniência',
              icon: Icons.local_drink,
              oncClicked: () => selectedItem(context, 4),
            ),

            const SizedBox(height: 20),
            buildMenuItem(
              text: 'Serviços',
              icon: Icons.car_repair,
              oncClicked: () => selectedItem(context, 5),
            ), */
            
            const SizedBox(height: 24),
            Divider(color: Colors.grey),
            const SizedBox(height: 24),

            buildMenuItem(
              text: 'Postos',
              icon: Icons.store,
              oncClicked: () => selectedItem(context, 4),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? oncClicked,
  }){
    final color = Colors.black;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: oncClicked,
    );
  }

  void selectedItem(BuildContext context, int index){
    switch(index){

      case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TelaPerfilPosto(),
      ));
      break;

      case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TelaPrincipalPosto(),
      ));
      break;

       case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TelaPrincipalPosto(),
      ));
      break;

       //TelaQueroVender
       case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TelaQueroVender(),
      ));
      break;

       /* case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TelaPrincipalPosto(),
      ));
      break;

       case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TelaPrincipalPosto(),
      ));
      break; */

       case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TelaPostos(),
      ));
      break;
    }
  }
}
