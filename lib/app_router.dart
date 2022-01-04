import 'package:breaking_bad_movie_using_bloc/constants/strings.dart';
import 'package:flutter/material.dart';

import 'presentation/screens/characters_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      //---------------- first screen -----------//
      case characterScreen:
        return MaterialPageRoute(builder: (_)=>const CharactersScreen());

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_)=>const CharactersDetailsScreen());
    }
  }

}