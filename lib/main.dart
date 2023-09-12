import 'package:flutter/material.dart';
import 'package:food_recipe/controller/recipe_provider.dart';
import 'package:food_recipe/views/home/homescreen.dart';
import 'package:provider/provider.dart';

void main() {
      WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title: 'Food Recipe',
        theme: ThemeData( 
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}

