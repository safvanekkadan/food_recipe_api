import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/service/get_recipe.dart';

class RecipeProvider extends ChangeNotifier{
  List<Recipe> recipes=[];
  bool isLoading =true;
  
  Future  getFoodRecipes() async {
  recipes= await GetRecipe().getRecipe();
  isLoading =false;
  notifyListeners();
  //  print(_recipes);

}
} 