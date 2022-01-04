import 'package:breaking_bad_movie_using_bloc/constants/strings.dart';
import 'package:dio/dio.dart';


/*
* WebServices for get data from internet
* */
class CharactersWebServices{

  late Dio dio;

  CharactersWebServices(){
    BaseOptions options= BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true, //get information for error
      connectTimeout: 20 * 1000,//20 second
      receiveTimeout: 20 * 1000,//20 second
    );

    dio =Dio(options);
  }


  Future<List<dynamic>> getAllCharacters()async{
    //characters IS ENDPOINT

    try{
     Response response =await dio.get('characters');
     print(response.data);

     return response.data;
   }catch(e){
     print(e.toString());
     return [];
   }

  }


}