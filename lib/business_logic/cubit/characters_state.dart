part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
class CharactersLoaded extends CharactersState{
  final List<Character>characters;
  CharactersLoaded(this.characters);
}
class QouetsLoaded extends CharactersState{
  final List<Quotes>Qoutes;
  QouetsLoaded(this.Qoutes);
}