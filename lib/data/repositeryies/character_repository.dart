import 'package:flutter_blocc/data/models/characters_model.dart';
import 'package:flutter_blocc/data/models/quotes.dart';
import 'package:flutter_blocc/data/web_services/characters_web_service.dart';

class CharacterRepository{
final  CharactersWebServices charactersWebServices;
CharacterRepository(this.charactersWebServices);
Future <List<Character>>getAllCharcters()async{
  print("ooook1");

  final charachters=await charactersWebServices.getAllCharcters();
  print(charachters);
print("ooook2");

return charachters.map((character)=>Character.fromJson(character)).toList();
}
Future <List<Quotes>>getCharcterQoutes(String charName)async{
  print("ooook1");

  final quotes=await charactersWebServices.getCharcterQoutes(charName);
  print(quotes);
  print("ooook2");

  return quotes.map((quote)=>Quotes.fromJson(quote)).toList();
}
}