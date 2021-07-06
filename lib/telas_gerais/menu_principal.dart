import 'package:enche_versao_101/telas_gerais/telaqrcode.dart';
import 'package:flutter/material.dart';


class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    TelaQrCode(),
    /* ShopScreen(),
    ContaUsuario(),
    TelaloginPosto(),
    TelaQrcode(),
    TelaAlterardados(), */
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        items: [

          BottomNavigationBarItem(                                
            icon: Icon(Icons.home),
            label: 'Inicial',
            backgroundColor: Color(0xFF3D5AFE),
          ),

          BottomNavigationBarItem(                                 
            icon: Icon(Icons.search),                  
            label: 'Pesquisar',
            backgroundColor: Color(0xFF3D5AFE),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station_outlined),
            label: 'Quero Vender',
            backgroundColor: Color(0xFF3D5AFE),
          ),  
          
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Qr-Code_2',
            backgroundColor: Color(0xFF3D5AFE),
          ),       

          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Perfil',
            backgroundColor: Color(0xFF3D5AFE),
          ),    
            
          
        ],
        onTap: onTabTapped,
        selectedItemColor: Colors.black,       
      ),    
    );   
  }
  void onTabTapped(int index){
    setState(() {
    _indiceAtual = index;
    });
  }
}