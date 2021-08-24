class Character{
 late var charId;
 late String image;
 late String name;
late  String nickName;
 late List<dynamic>jobs;
 late List<dynamic>apperanceOfSeasons;
late List<dynamic>betterCallSaulApperance;
late String statuesIfDeadOrLive;
late String actorName;
late String categoryForTwoSeries;
Character.fromJson(Map<String,dynamic>json){
  charId=json['char_id'];
  name=json['name'];
  image=json['img'];
  statuesIfDeadOrLive=json['status'];
  actorName=json['name'];
  nickName=json['nickname'];
  jobs=json['occupation'];
  apperanceOfSeasons=json['appearance'];
  actorName=json['portrayed'];
  categoryForTwoSeries=json['category'];
  betterCallSaulApperance=json['better_call_saul_appearance'];


}
}