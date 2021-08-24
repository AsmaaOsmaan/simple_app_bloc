
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocc/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_blocc/constants/my_colors.dart';
import 'package:flutter_blocc/data/models/characters_model.dart';
class CharactersDetails extends StatelessWidget {
  final Character character;

  const CharactersDetails({Key? key,required this.character}) : super(key: key);
Widget buildSliverAppBar(){
  return SliverAppBar(
    expandedHeight: 300,
    pinned: true,
    stretch: true,
    backgroundColor: MyColors.myGrey,
    flexibleSpace: FlexibleSpaceBar(
      title: Text(character.nickName,style: TextStyle(color: MyColors.myWhite),
      ),
      background: Hero(
        tag: character.charId,
        child: Image.network(character.image,fit: BoxFit.cover,),
      ),
    ),
    
  );
}
Widget characterInfo(String title,String value){
  return RichText(
      maxLines:1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
    children: [
      TextSpan(text:title,style:TextStyle(color: MyColors.myWhite,fontWeight: FontWeight.bold,fontSize: 18) ),
      TextSpan(text:value,style:TextStyle(color: MyColors.myWhite,fontWeight: FontWeight.bold,fontSize: 18) ),
    ]
  ));
}
Widget buildDivder(double endIndent){

  return Divider(
    color: MyColors.myYellow,
    endIndent:endIndent ,
    thickness: 2,
    height: 30,
  );
}
Widget checkIfQoutesLoaded(CharactersState state){
  print('state${state}');
  if(state is QouetsLoaded){
print("testdone");

 return   displayRandomQoutesOrEmptySpace(state);
  }
  else{
    return showProgreesIndcator();
  }
}
Widget showProgreesIndcator(){
  return CircularProgressIndicator(
    color:  MyColors.myYellow,
  );
}
Widget displayRandomQoutesOrEmptySpace(state){
  var Qoutes=(state).Qoutes;
 print("Qoutes.length${Qoutes.length}");
  if(Qoutes.length!=0){
    int randomQouteIndex=Random().nextInt(Qoutes.length-1);
    return Center (
      child: DefaultTextStyle(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            RotateAnimatedText(Qoutes[randomQouteIndex].quote),

          ],
        ),
        style: TextStyle(
          color: MyColors.myWhite,
            fontSize: 18 ,
        shadows: [
          Shadow(
            blurRadius: 7,
            color: MyColors.myYellow,
            offset: Offset(0,0)

          )
        ]
        ),
        textAlign: TextAlign.center,

      ),
    );
  }
  else{
    return Container();
  }
}
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context).getQouets(character.name);

    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(slivers: [
        buildSliverAppBar(),
        SliverList(delegate: SliverChildListDelegate(
          [
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  characterInfo('Job :',character.jobs.join(' / ')),
                  buildDivder(315),
                  characterInfo('Appeared In :',character.categoryForTwoSeries),
                  buildDivder(250),
                  characterInfo('Seasons :',character.apperanceOfSeasons.join(' / ')),
                  buildDivder(280),
                  characterInfo('Statues :',character.statuesIfDeadOrLive),
                  buildDivder(315),
                  character.betterCallSaulApperance.isEmpty?Container():Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                    characterInfo('betterCallSaulApperance :',character.betterCallSaulApperance.join(' / ')),
                    buildDivder(150),
                        SizedBox(height: 5000,)
                  ],),
        BlocBuilder<CharactersCubit,CharactersState>(builder: (context,state){
            return  checkIfQoutesLoaded(state);
}
)
                ],
              ),
            )
          ]
        ))
      ],),
    );
  }
}
