import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/categoriemeals_screen.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
      ),
      home: CategoriesScreen(),
      routes: {
        Categoriemeals_screen.routeName: (ctx) => Categoriemeals_screen(),
      },
    );
  }
}
