import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:poke_dex_projesi/model/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokeApi{
  Future<List<PokemonModely>?> pokemonlist() async{

    try {

    var response = await Dio().get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
     List<PokemonModely> pokelist = [];

    if (response.statusCode == 200){
      //debugPrint(response.data);

      var jsonarray = jsonDecode(response.data);

      List pokemlist = jsonarray["pokemon"];

      pokelist = (pokemlist as List).map((e) => PokemonModely.fromMap(e)).toList();


      return pokelist;
    }
    }on DioError catch (e) {
      return Future.error(e.message);
    }






  }
}