

import 'package:breaking_bad_movie_using_bloc/data/models/characters.dart';
import 'package:breaking_bad_movie_using_bloc/data/web_services/characters_web_services.dart';
import 'package:flutter/cupertino.dart';
/*
* Repository for :
* 1- get request from Bloc and to webservice
* 2- get response from webservice and to Bloc
* */

class CharactersRepository{
  CharactersWebServices charactersWebServices ;

  CharactersRepository(this.charactersWebServices);


  Future<List<dynamic>> getAllCharacters()async{

     final character =await charactersWebServices.getAllCharacters();

     return character.map(
             (characterElement)=>Character.fromJson(characterElement)
     ).toList();
  }
}