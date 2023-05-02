import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Drawer(
      child: Column(children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up !!',
               textAlign: TextAlign.center,
               style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30,color: Theme.of(context).primaryColor, ),
            ),
          ),
         const SizedBox(height: 20),
         ListTile(
           leading: const Icon(Icons.restaurant, size: 25),
           title: const Text('Meals', style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 22, fontWeight: FontWeight.bold),),
           onTap: () {Navigator.of(context).pushReplacementNamed('/');},
         ),
         ListTile(
           leading: const Icon(Icons.settings, size: 25),
           title: const Text('Filters', style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 22, fontWeight: FontWeight.bold),),
           onTap: () {Navigator.of(context).pushReplacementNamed('/filters');},
         ),
        ],
      ),
    );
  }
}
