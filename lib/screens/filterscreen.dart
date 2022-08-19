import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class Filterscreen extends StatefulWidget {
  static const routename = 'filterscreen';
  final Function savefilters;
  final Map<String, bool> filters;
  Filterscreen(this.filters, this.savefilters);
  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosFree = false;
  @override
  void initState() {
    _glutenFree = widget.filters['glutten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactosFree = widget.filters['lactose'];
    // TODO: implement initState
    super.initState();
  }

  Widget _buildSwitchTile(String title, String description, bool current_value,
      Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: current_value,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Main_drawer(),
      appBar: AppBar(
        title: Text("your filters"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedvalues = {
                'glutten': _glutenFree,
                'lactose': _lactosFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.savefilters(selectedvalues);
              ;
            },
          )
        ],
      ),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        /*    SwitchListTile(
            title: Text("title"),
            subtitle: Text('description'),
            value: _glutenFree,
            onChanged: (newvalue) {
              setState(() {
                _glutenFree = newvalue;
              });
            })*/
        _buildSwitchTile(
            'gluttenfree', 'only include glutten-free meals', _glutenFree,
            (newvalue) {
          setState(() {
            _glutenFree = newvalue;
          });
          ;
        }),
        _buildSwitchTile(
            'vegeterian', 'only include vegeterian meals', _vegetarian,
            (newvalue) {
          setState(() {
            _vegetarian = newvalue;
          });
          ;
        }),
        _buildSwitchTile('vegan', 'only include vegan meals', _vegan,
            (newvalue) {
          setState(() {
            _vegan = newvalue;
          });
        }),
        _buildSwitchTile(
            'lactosfree', 'only include lactos-free meals', _lactosFree,
            (newvalue) {
          setState(() {
            _lactosFree = newvalue;
          });
          ;
        })
      ]),
    );
  }
}
