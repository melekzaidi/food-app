import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/models/meal.dart';

import '../widgets/meal_item.dart';

class Favouritesscreen extends StatelessWidget {
  static const routename = "favscreen";
  final List<Meal> fav;
  Favouritesscreen(this.fav);
  @override
  Widget build(BuildContext context) {
    print(fav);
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Meal_item(
            id: fav[index].id,
            title: fav[index].title,
            imageUrl: fav[index].imageUrl,
            duration: fav[index].duration,
            affordability: fav[index].affordability,
            complexity: fav[index].complexity,
          );
        },
        itemCount: fav.length,
      ),
    );
    ;
  }
}
