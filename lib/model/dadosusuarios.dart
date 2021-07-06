class DadosUsuarios{
  late String id;
  late String nome;
  late String email;

  // Construtor
  DadosUsuarios(this.id, this.nome, this.email);

  //Converter um documento em um objeto
  DadosUsuarios.fromJson(Map<String,dynamic>mapa,String id){
    this.id     = id;
    this.nome   = mapa['nome'];
    this.email  = mapa['email'];
  }

  //Converter um objeto em um documento
  Map<String,dynamic> toJSon(){
    return{
      'id'     : this.id,
      'nome'   : this.nome,
      'email'  : this.email,
    };
  }
}