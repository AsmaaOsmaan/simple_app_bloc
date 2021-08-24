class Quotes{
  late String quote;
  Quotes.fromJson(Map<String,dynamic>jsonData){
    quote=jsonData['quote'];
  }
}