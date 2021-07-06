class Combustivel{
  late String id;
  late String gasolinacomum;
  late String gasolinaad;
  late String etanol;
  late String dieselS500;
  late String diesels10;
  late String gnv;


  //Construtor
  Combustivel(this.id, this.gasolinacomum, this.gasolinaad, this.etanol, this.dieselS500, this.diesels10, this.gnv);

  //Converter um documento em um objeto
  Combustivel.fromJson(Map<String,dynamic>mapa,String id){
    this.id =id;
    this.gasolinacomum = mapa['gasolinacomum'];
    this.gasolinaad = mapa['gasolinaad'];
    this.etanol = mapa['etanol'];
    this.dieselS500 = mapa['diesels500'];
    this.diesels10 = mapa['diesels10'];
    this.gnv = mapa['gnv'];
  }
  
  //Converter um objeto em um documento
   Map<String,dynamic> toJSon(){
    return{
      'id'            : this.id,
      'gasolinaComum' : this.gasolinacomum,
      'gasolinaAd'    : this.gasolinaad,
      'etanol'        : this.etanol,
      'dieselS500'    : this.dieselS500,
      'diesels10'     : this.diesels10,
      'gnv'           : this.gnv,
    };
  }

}