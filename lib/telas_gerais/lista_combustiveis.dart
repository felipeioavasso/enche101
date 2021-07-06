import 'package:flutter/material.dart';

class ListaCombustiveis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            _buildSectiontitle('Etanol', (){}),
            //SizedBox(height: 10),
            //EtanolItem(),
                                                                      
            _buildSectiontitle('Gasolina Comum', (){}),
            //SizedBox(height: 10),
            //GasolinaComumItem(),
                                                              
            _buildSectiontitle('Gasolina Aditivada', (){}),
            //SizedBox(height: 2),
            //GasolinaAditivadaItem(),
                                              
            _buildSectiontitle('Diesel S500', (){}),
            //SizedBox(height: 2),
            //DieselS500Item(),
                                      
            _buildSectiontitle('Diesel S 10', (){}),
            //SizedBox(height: 2),
            //DieselS10Item(),
            
            _buildSectiontitle('GNV', (){}),
            //SizedBox(height: 2),
            //GNVItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectiontitle(String title, [Function? onTap]){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children:[
          Text(title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18),
          ),
        ],
      ),
    );
  }
}