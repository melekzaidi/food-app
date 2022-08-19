import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/Favouritescreen.dart';
import 'package:flutter_complete_guide/screens/filterscreen.dart';

class Main_drawer extends StatelessWidget {
  Widget buildtile(String title, IconData i, Function f) {
    return ListTile(
      leading: Icon(
        i,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondenced'),
      ),
      onTap: f,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          color: Colors.yellow,
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          alignment: Alignment.centerLeft,
          child: Text(
            "Cooking up!",
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.w900,
                fontFamily: 'RobotoCondenced'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildtile('Meals', Icons.restaurant, () {
          Navigator.pushReplacementNamed(context, '/');
        }),
        SizedBox(
          height: 20,
        ),
        buildtile('Filters', Icons.settings, () {
          Navigator.pushReplacementNamed(context, Filterscreen.routename);
        })
      ]),
    );
  }
}
