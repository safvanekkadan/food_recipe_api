
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe/service/get_recipe.dart';
import 'package:food_recipe/views/home/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../controller/recipe_provider.dart';


class RecipeView extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  directionsUrl;
   const RecipeView({super.key,this.directionsUrl});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<RecipeProvider>(context,listen: false).getFoodRecipes();
    // getRecipe();
  }
  @override
  Widget build(BuildContext context) {
    print("122sfg");
    final Completer<WebViewController>_completer =Completer<WebViewController>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(MaterialPageRoute(
                builder: (context) =>  const HomeScreen(),
              ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text("Food Recipe",
          style: TextStyle(
            color: Colors.orange,
            fontWeight: FontWeight.w900

          ),),
          
      
        ],
      ),
        actions: const [
          Opacity(
            opacity: 0,
            child: SizedBox(
              child:  Icon(Icons.abc),
            ),
          )
        ],
        elevation: 0,
      ),
      
      body: SafeArea(
        child:
        
      WebView(
        
        initialUrl: widget.directionsUrl,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }
      ),
      ),
    ));
  }
}