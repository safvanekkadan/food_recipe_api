import 'package:flutter/material.dart';
import 'package:food_recipe/controller/recipe_provider.dart';
import 'package:food_recipe/models/recipe.dart';
import 'package:food_recipe/service/recipe_api.dart';
import 'package:food_recipe/widgets/recipe_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScrrenState();
}

class _HomeScrrenState extends State<HomeScreen> {
  //  List<Recipe> _recipes=[];
  // bool _isLoading =true;
  

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<RecipeProvider>(context,listen: false).getFoodRecipes();
    // getRecipe();
  }
// Future<void> getRecipe() async {
//   _recipes= await  RecipeApi.getRecipe();
//    setState(() {
//     _isLoading =false;
//    });
//    print(_recipes);

// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text("Food Recipe",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w900
            ),)
          ],
        ),
      ),
       body: 
      
       Consumer<RecipeProvider>(
           builder: (context, value, child) {
                 if(value.isLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
             return   ListView.builder(
          itemCount:value.recipes.length,
          itemBuilder: (context, index) {
            return RecipeCard(title:value.recipes[index].name,
             cookTime: value.recipes[index].totalTime, 
             rating:value.recipes[index].rating.toString(), 
             thumbnailUrl:value.recipes[index].images,
            
             );
          },
          
           );
           },
       
       )
    );
  }
}

