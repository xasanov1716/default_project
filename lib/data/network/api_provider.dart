import 'dart:convert';

import 'package:api_default_project/data/models/pokemon_model.dart';
import 'package:http/http.dart';


class ApiProvider {
  Future getPokemon() async {
    Response response = await get(Uri.parse(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"));
    if (response.statusCode == 200) {
      //print( (jsonDecode(response.body)["pokemon"] as List?)?.map((e) => Pokemon.fromJson(e)));
      return (jsonDecode(response.body)["pokemon"] as List?)
          ?.map((e) => PokemonModel.fromJson(e))
          .toList() ??
          [];
    }
    throw response.body;
  }
}