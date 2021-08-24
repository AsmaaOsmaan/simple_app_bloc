import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocc/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_blocc/data/repositeryies/character_repository.dart';
import 'package:flutter_blocc/data/web_services/characters_web_service.dart';
import 'package:flutter_blocc/presentation/screens/characters_details.dart';
import 'package:flutter_blocc/presentation/screens/charchters_screen.dart';

import 'constants/strings.dart';
import 'data/models/characters_model.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    characterRepository = CharacterRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_)=> BlocProvider(
                  create: (BuildContext contxt) => charactersCubit,
                  child: CharactersScreen(),
                ));
      case charactersDetailsScreen:
        final character=settings.arguments as Character;
        return MaterialPageRoute(builder: (_) => BlocProvider(
            create: (BuildContext context)=>CharactersCubit(characterRepository),
            child: CharactersDetails(character: character,)));
    }
  }
}
