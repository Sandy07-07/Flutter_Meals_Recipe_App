import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget
{
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context)
  {
    if(favoriteMeals.isEmpty)
      {
        return Center(
                child: Text(
                  'You have no Favorites yet - Start adding some!',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
                  textAlign: TextAlign.center,
                )
            );
      }
    else
      {
        return ListView.builder(itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageURL: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
          itemCount: favoriteMeals.length,
        );
      }
  }
}
