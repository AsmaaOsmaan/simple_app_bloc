import 'package:bloc/bloc.dart';
import 'package:flutter_blocc/data/models/characters_model.dart';
import 'package:flutter_blocc/data/models/quotes.dart';
import 'package:flutter_blocc/data/repositeryies/character_repository.dart';
import 'package:meta/meta.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
 final CharacterRepository characterRepository;
List<Character>characters=[];
  CharactersCubit(this.characterRepository) : super(CharactersInitial());
    List<Character>getAllCharacters(){
      characterRepository.getAllCharcters().then((character) {
        print("ooooooooo");
        emit(CharactersLoaded(character));
        print("asmaaaaa");
       characters=character;
       //print(this.characters);
      });
      print("testtttttt");
      print("testtttttt${this.characters}");
      return characters;
    }
    
    
    //
 void getQouets(String charName){
   characterRepository.getCharcterQoutes(charName).then((qouets) {
     print("qouets${qouets}");
print("loaded");
     emit(QouetsLoaded(qouets));
print("loaded22");
     //print(this.characters);
   });

 }
}
