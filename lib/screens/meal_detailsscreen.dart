import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class Meal_detailsscreen extends StatefulWidget {
  static const routenames = "/Meal_detailsscreen";
  Function addfavourite;

  Function checkfav;
  Meal_detailsscreen(this.addfavourite, this.checkfav);

  @override
  State<Meal_detailsscreen> createState() => _Meal_detailsscreenState();
}

class _Meal_detailsscreenState extends State<Meal_detailsscreen> {
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectmeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealid);

    bool check = widget.checkfav(mealid) as bool;
    return Scaffold(
        appBar: AppBar(
          title: Text(selectmeal.title),
        ),
        drawer: Main_drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                height: 300,
                width: double.infinity,
                child: Image.network(selectmeal.imageUrl, fit: BoxFit.cover),
              ),
              Text('Ingrediants',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      elevation: 5,
                      color: Theme.of(context).backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(selectmeal.ingredients[index]),
                      ),
                    ),
                    itemCount: selectmeal.ingredients.length,
                  )),
              Text('Steps',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                '# ${index + 1}',
                              ),
                            ),
                            title: Text(selectmeal.steps[index])),
                        Divider()
                      ],
                    ),
                    itemCount: selectmeal.steps.length,
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: check
                ? Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              this.widget.addfavourite(mealid);
              setState(() {
                check = this.widget.checkfav(mealid);
              });
            }));
  }
}

/*class Meal_detailsscreen extends StatefulWidget {
  static const routenames = "/Meal_detailsscreen";
  Function addfavourite;

  Function checkfav;

  Meal_detailsscreen(this.addfavourite, this.checkfav);

  @override
  State<Meal_detailsscreen> createState() => _Meal_detailsscreenState();
}

class _Meal_detailsscreenState extends State<Meal_detailsscreen> {
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;
    final selectmeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealid);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectmeal.title),
        ),
        drawer: Main_drawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                height: 300,
                width: double.infinity,
                child: Image.network(selectmeal.imageUrl, fit: BoxFit.cover),
              ),
              Text('Ingrediants',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Card(
                      elevation: 5,
                      color: Theme.of(context).backgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(selectmeal.ingredients[index]),
                      ),
                    ),
                    itemCount: selectmeal.ingredients.length,
                  )),
              Text('Steps',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(
                      children: [
                        ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                '# ${index + 1}',
                              ),
                            ),
                            title: Text(selectmeal.steps[index])),
                        Divider()
                      ],
                    ),
                    itemCount: selectmeal.steps.length,
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:
              checkfav(mealid) ? Colors.yellow : Colors.white,
          child: Icon(
            Icons.favorite,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => this.widget.addfavourite(mealid),
        ));
  }
}*/
