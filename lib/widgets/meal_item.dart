import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/meal_detailsscreen.dart';

class Meal_item extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const Meal_item({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexe {
    switch (complexity) {
      case Complexity.Simple:
        return "simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return 'unknown';
        break;
    }
  }

  String get money {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      default:
        return 'unknown';
        break;
    }
  }

  void selectmeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(Meal_detailsscreen.routenames, arguments: this.id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexe)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(money)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
