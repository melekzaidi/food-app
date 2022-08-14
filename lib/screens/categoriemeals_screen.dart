import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class Categoriemeals_screen extends StatelessWidget {
  static const routeName = 'category-meals';
  /* final String id;
  final String title;
  const Categoriemeals_screen(this.id, this.title);*/

  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeargs['title'];
    final id = routeargs['id'];
    final category_meals = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Meal_item(
              title,
              category_meals[index].imageUrl,
              category_meals[index].duration,
              category_meals[index].complexity,
              category_meals[index].affordability);
        }),
        itemCount: category_meals.length,
      ),
    );
  }
}
