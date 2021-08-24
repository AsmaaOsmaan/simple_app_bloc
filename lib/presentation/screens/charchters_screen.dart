import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocc/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_blocc/constants/my_colors.dart';
import 'package:flutter_blocc/data/models/characters_model.dart';
import 'package:flutter_blocc/presentation/widgets/character_item.dart';
class  CharactersScreen extends StatefulWidget {
  @override
  _CharactersScreenState createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character>allCharacters;
 List<Character>searchedForCharacters=[];
  bool isSearching=false;
  final searchTextController=TextEditingController();
  Widget BuildSearchedField(){
    return TextField(
      controller: searchTextController,
      cursorColor: MyColors.myGrey,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle:TextStyle(color: MyColors.myGrey,fontSize: 18),

      ),
      onChanged: (searchedCharcter){
      addSearchedForItemsToSearchedList(searchedCharcter);
      },
      style:TextStyle(color: MyColors.myGrey,fontSize: 18) ,
    );
  }
  void addSearchedForItemsToSearchedList(String searchedCharcter){
    searchedForCharacters=allCharacters.where((character) => character.name.toLowerCase().startsWith(searchedCharcter)).toList();
    setState(() {

    });
  }
  List<Widget>buildAppbarAction(){
    if(isSearching){
      return [
        IconButton(onPressed: (){
          clearSearch();
          Navigator.pop(context);


        }, icon: Icon(Icons.cancel,color: MyColors.myGrey,))
      ];
    }
    else{
      return [
        IconButton(onPressed: startSearch, icon: Icon(Icons.search,color: MyColors.myGrey,))
      ];
    }
  }
  void startSearch(){
ModalRoute.of(context)!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
// to controll in Icons and textFormField in appBar
setState(() {
  isSearching=true;
});
  }
  stopSearch(){
    clearSearch();
    setState(() {
      isSearching=false;
    });
  }
  clearSearch(){

setState(() {
  searchTextController.clear();

});  }
Widget buildAppbarTitle(){
    return Text("Characters");
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();

  }
  Widget buildBlocWidget(){
    return BlocBuilder<CharactersCubit,CharactersState>(builder: (context,state){
      if(state is CharactersLoaded){
allCharacters=(state).characters;
return buildLoadedListWidget();
      }
      else{
return showLoadingIndecator();
      }

    });
  }

  Widget  showLoadingIndecator(){
    return Center(child: CircularProgressIndicator(),);
  }
  Widget buildLoadedListWidget(){
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,


        child: Column(
        children: [
          buildCharatersList()
        ],
      ),),
    );
  }
  Widget buildCharatersList(){
    return GridView.builder(
      itemCount:(searchTextController.text.isEmpty)? allCharacters.length:searchedForCharacters.length,
padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),

        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

      crossAxisCount: 2,
      childAspectRatio: 2/3,
        crossAxisSpacing: 1,
      mainAxisSpacing: 1

    ), itemBuilder: (ctx,index){
      return CharacterItem(character: (searchTextController.text.isEmpty)? allCharacters[index]:searchedForCharacters[index]);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title:isSearching?BuildSearchedField():buildAppbarTitle(),
        actions: buildAppbarAction(),
        leading: isSearching?BackButton(color: MyColors.myGrey,):Container()
      ),

      body: buildBlocWidget(),
    );
  }
}
