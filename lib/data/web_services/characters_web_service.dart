import 'package:dio/dio.dart';
import 'package:flutter_blocc/constants/strings.dart';

class CharactersWebServices{
  late Dio dio;


  CharactersWebServices(){
    BaseOptions options=BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20*1000,
      receiveDataWhenStatusError: true,
      receiveTimeout: 20*1000,

    );
    dio=Dio(options);
  }


Future <List<dynamic>>getAllCharcters()async{
    print("test");
try{
  print("asmaa");
  Response response=await dio.get('characters');
  print("asmaa");
  print(response.data.toString());
  return response.data;
}
catch(e){
  print('e.toString()${e.toString()}');
  return [];
}
}
  Future <List<dynamic>>getCharcterQoutes(String charName)async{
    print("asmaaQoutes1");
    try{
      print("asmaaQoutes0");
      Response response=await dio.get('quote',queryParameters: {
        'author':charName
      });
      print("asmaa");
      print(response.data.toString());
      return response.data;
    }
    catch(e){
      print('e.toString()${e.toString()}');
      return [];
    }
  }
}