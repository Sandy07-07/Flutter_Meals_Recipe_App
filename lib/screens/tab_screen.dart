import 'package:flutter/material.dart';

import './categories_screen.dart';
import '../widgets/main_drawer.dart';
import './favorite_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget
{
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
{
  late List<Map<String,Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages =  [
      {'page': CategoriesScreen(), 'title': 'Categories',},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favourites',}
    ];
    super.initState();
  }

  void _selectPage(int index)
  {
      setState(() {
        _selectedPageIndex = index;
      });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectedPageIndex]['title'] as String)),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
          items: const [
            BottomNavigationBarItem(
                backgroundColor: Colors.pink,
                icon: Icon(Icons.category_outlined),
                label: 'Categories',
            ),
            BottomNavigationBarItem(
                backgroundColor: Colors.pink,
                icon: Icon(Icons.star),
                label: 'Favorites',
            ),
        ],
      ),
    );
  }
}