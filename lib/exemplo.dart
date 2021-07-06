import 'package:enche_versao_101/classes.dart';
import 'package:flutter/material.dart';

class Exemplo extends StatelessWidget {
  Exemplo({
    required Key key,
  }) : super(key: key);

  final List<Combustivel> _items = [
    Combustivel(
       endereco: '', 
       foto: '', 
       nome: '', 
       preco: '',
    ),
  ]; 
    

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,

      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (_, i) => Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1.5),
          ),
        ),
      ),
      
    );
  }
}