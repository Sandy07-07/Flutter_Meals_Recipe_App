import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget
{
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context)
  {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10),
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text('Ingredients',
                style: Theme.of(context).textTheme.headline6,),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 220,
            width: 300,
            child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedMeal.ingredients[index], textAlign: TextAlign.center,),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Text('Steps',
              style: Theme.of(context).textTheme.headline6,),
            ),
          Container(
            decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
              ),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            height: 220,
            width: 300,
            child: ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) => Column(children:
              [ ListTile(
                leading: CircleAvatar(child: Text('# ${(index + 1)}'),),
                title: Text(selectedMeal.steps[index]),
                  ),
                const Divider(thickness: 2),
                ],
              ),
            ),
          ),
        ],
       ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(mealId),
        child: Icon(isFavorite(mealId)
            ? Icons.star
            : Icons.star_border_outlined),
      ),
    );
  }
}
