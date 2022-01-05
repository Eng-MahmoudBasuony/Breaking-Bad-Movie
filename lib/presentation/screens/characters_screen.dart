import 'package:breaking_bad_movie_using_bloc/business_logic/characters_cubit.dart';
import 'package:breaking_bad_movie_using_bloc/constants/my_colors.dart';
import 'package:breaking_bad_movie_using_bloc/data/models/characters.dart';
import 'package:breaking_bad_movie_using_bloc/presentation/widgets/character_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacters;

  @override
  void initState() {
    super.initState();
        BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(color: MyColors.myGray),
        ),
      ),
      body: buildBlocWidget(),
    );
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
        builder: (context, state) {
          if (state is CharactersLoaded) {
            allCharacters = (state).character;
            return buildLoadedListWidgets();
          } else {
            return showLoadingIndicator();
          }
        });
  }

  Widget showLoadingIndicator(){
    return const Center(child: CircularProgressIndicator(color: MyColors.myYellow,),);
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(children: [
          buildCharactersList()
        ],),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacters.length,
        itemBuilder: (ctx,index){

          return   CharacterItem(character: allCharacters[index],);
        });
  }

}
