class CadastroPosto{
  late String id;
  late String nomeposto;
  late String cnpj;
  late String estado;
  late String cidade;
  late String endereco;
  late String horfunc;

  // Construtor
  CadastroPosto(this.id, this.nomeposto, this.cnpj, this.estado, this.cidade, this.endereco, this.horfunc);

  //Converter um documento em um objeto
  CadastroPosto.fromJson(Map<String,dynamic>mapa,String id){
    this.id         = id;
    this.nomeposto  = mapa['nome do posto'];
    this.cnpj       = mapa['cnpj'];
    this.estado     = mapa['estado'];
    this.cidade     = mapa['cidade'];
    this.endereco   = mapa['endereco'];
    this.horfunc    = mapa['horariofunc'];
  }

  //Converter um objeto em um documento
  Map<String,dynamic> toJSon(){
    return{
      'id'              : this.id,
      'nome do posto'   : this.nomeposto,
      'cnpj'            : this.cnpj,
      'estado'          : this.estado,
      'cidade'          : this.cidade,
      'endereco'        : this.endereco,
      'horariofunc'     : this.horfunc,
    };
  }
}