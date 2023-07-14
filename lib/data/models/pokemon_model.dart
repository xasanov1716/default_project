class PokemonModel{
  final int id;
  final String num;
  final String img;

  PokemonModel({required this.id,required this.num,required this.img});


  factory PokemonModel.fromJson(Map<String , dynamic> json){
    return PokemonModel(id: json['id'], num: json['num'], img: json['img']);
  }


}