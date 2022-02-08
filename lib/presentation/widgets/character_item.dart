import 'package:breaking_bad_movie_using_bloc/constants/my_colors.dart';
import 'package:breaking_bad_movie_using_bloc/data/models/characters.dart';
import 'package:flutter/material.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
          color: MyColors.myWhite, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        //--------- image -----//
        child: Container(
          color: MyColors.myGray,
          child: character.image.isNotEmpty?FadeInImage.assetNetwork(
             width: double.infinity,
             height: double.infinity,
              placeholder: 'assets/images/loading.gif',
              image: character.image,
              fit: BoxFit.fill,
          ):Image.asset('assets/images/placeholder.png'),
        ),
        //---------- name -----//
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(character.name,style: const TextStyle(
            height: 1.3,
            fontSize: 16,
            color: MyColors.myWhite,
            fontWeight: FontWeight.bold
          ),
          overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ) ,
      ),
    );
  }
}
