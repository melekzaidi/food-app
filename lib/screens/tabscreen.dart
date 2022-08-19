import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/Favouritescreen.dart';
import 'package:flutter_complete_guide/screens/categories_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class Tabsccreen extends StatefulWidget {
  List<Meal> favourites;
  Tabsccreen(this.favourites);

  @override
  State<Tabsccreen> createState() => _TabsccreenState();
}

class _TabsccreenState extends State<Tabsccreen> {
  List<Map<String, Object>> _pages;
  int _selectedpage = 0;
  List<Meal> fav;
  @override
  void initState() {
    // TODO: implement initState*
    fav = widget.favourites;
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': Favouritesscreen(fav), 'title': 'Your favourites'}
    ];

    super.initState();
  }

  void selectpage(int index) {
    setState(() {
      _selectedpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedpage]['title']),
        ),
        drawer: Main_drawer(),
        body: _pages[_selectedpage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectpage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.yellow,
          currentIndex: _selectedpage,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'categories'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'favourites')
          ],
        ));
  }
}
