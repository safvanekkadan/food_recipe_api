import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/service/recipe_api.dart';

class GetRecipe{
List<Recipe> recipes=[];
  // bool _isLoading =true;

  Future  getRecipe() async {
  recipes= await  RecipeApi.getRecipe();
   
    // _isLoading =false;
  return recipes;
  //  print(_recipes);

}
}