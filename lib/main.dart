import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/Favouritescreen.dart';
import 'package:flutter_complete_guide/screens/categoriemeals_screen.dart';
import 'package:flutter_complete_guide/screens/filterscreen.dart';
import 'package:flutter_complete_guide/screens/meal_detailsscreen.dart';
import 'package:flutter_complete_guide/screens/tabscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _avaiblemeals = DUMMY_MEALS;

  List<Meal> _favourite = [];
  void _setfilters(Map<String, bool> filterdata) {
    setState(() {
      _filters = filterdata;
      _avaiblemeals = DUMMY_MEALS.where((element) {
        if (_filters['glutten'] && !element.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !element.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _tooglefavourite(String id) {
    final exist = _favourite.indexWhere(((element) => element.id == id));
    if (exist >= 0) {
      print(exist);
      _favourite.removeAt(exist);
    } else {
      setState(() {
        _favourite.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool checkfav(String id) {
    if (_favourite.any((element) => element.id == id)) {
      return true;
    } else {
      return false;
    }
  }

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
        home: Tabsccreen(_favourite),
        routes: {
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_avaiblemeals),
          Meal_detailsscreen.routenames: (ctx) =>
              Meal_detailsscreen(_tooglefavourite, checkfav),
          Favouritesscreen.routename: (ctx) => Favouritesscreen(_favourite),
          Filterscreen.routename: (ctx) => Filterscreen(_filters, _setfilters),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => Tabsccreen(_favourite));
        });
  }
}
