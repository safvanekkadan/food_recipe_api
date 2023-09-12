import 'dart:convert';
import 'package:food_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi{

  static Future<List<Recipe>> getRecipe() async{
  var uri =Uri.https('yummly2.p.rapidapi.com','/feeds/list',
  {' limit': '24','start': '0', 'tag':'list.recipe.popular'});
  final  response = await http.get(uri,headers:{
  	'X-RapidAPI-Key': '9d8c8e6e95msh169af5ae6db2e31p16f8c1jsn009d92663edf',
	'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
   'UseQueryString' : 'true'
   });
   Map data =jsonDecode(response.body);
   List _temp=[];
    for (var i in data['feed']){
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
 }




 
}