import 'package:breaking_bad_movie_using_bloc/business_logic/characters_cubit.dart';
import 'package:breaking_bad_movie_using_bloc/constants/strings.dart';
import 'package:breaking_bad_movie_using_bloc/data/repositories/characters_repositories.dart';
import 'package:breaking_bad_movie_using_bloc/data/web_services/characters_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/characters_details_screen.dart';
import 'presentation/screens/characters_screen.dart';

class AppRouter {

 late CharactersRepository charactersRepository;
 late CharactersCubit charactersCubit;

 AppRouter(){
   charactersRepository = CharactersRepository(CharactersWebServices());
   charactersCubit = CharactersCubit(charactersRepository);
 }

  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      //---------------- first screen -----------//
      case characterScreen:
        return MaterialPageRoute(builder: (_)=>BlocProvider(
          create:(BuildContext context)=> charactersCubit,
          child: const CharactersScreen(),
        ));

      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_)=>const CharactersDetailsScreen());
    }
  }

}