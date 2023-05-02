import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget
{
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen>
{
  var _glutenFree = false;
  var _vegetarian= false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Your Filters'),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                    final selectedFilters = {
                      'gluten': _glutenFree,
                      'lactose': _lactoseFree,
                      'vegan': _vegan,
                      'vegetarian': _vegetarian,
                    };
                    widget.saveFilters(selectedFilters);
                  },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
        drawer: MainDrawer(),
        body: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: Text('Adjust Your Meal Selection :', style: Theme.of(context).textTheme.headline6,),
            ),
            Expanded(
                child: ListView(children: <Widget>[
                    SwitchListTile(
                      title: const Text('Gluten Free'),
                      value: _glutenFree,
                      subtitle: const Text('Only include Gluten-free Meals'),
                      onChanged: (newValue) {
                        setState(() {
                          _glutenFree = newValue;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Vegetarian'),
                      value: _vegetarian,
                      subtitle: const Text('Only include Vegetarian Meals'),
                      onChanged: (newValue) {
                        setState(() {
                          _vegetarian = newValue;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Vegan'),
                      value: _vegan,
                      subtitle: const Text('Only include Vegan Meals'),
                      onChanged: (newValue) {
                        setState(() {
                          _vegan = newValue;
                        });
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Lactose Free'),
                      value: _lactoseFree,
                      subtitle: const Text('Only include Lactose-free Meals'),
                      onChanged: (newValue) {
                        setState(() {
                          _lactoseFree = newValue;
                        });
                      },
                    ),
                  ],
                ),
            ),
          ],
        ),
    );
  }
}
