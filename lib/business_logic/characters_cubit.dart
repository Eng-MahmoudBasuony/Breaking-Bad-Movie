import 'package:bloc/bloc.dart';
import 'package:breaking_bad_movie_using_bloc/data/models/characters.dart';
import 'package:breaking_bad_movie_using_bloc/data/repositories/characters_repositories.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

   List<Character> characters=[];


  List<Character> getAllCharacters(){

     charactersRepository.getAllCharacters().then((characters)
     {
       //push data to UI from repositories layer
       // send characters to character in loaded
       emit(CharactersLoaded(characters));
       this.characters=characters;

    });
       return characters;
  }

}
