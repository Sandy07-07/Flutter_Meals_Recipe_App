import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

import '../widgets/meal_item.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget
{
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen>
{
  late String categoryTitle;
  late List<Meal> displayedmeals;
  var _loadedInitData = false;
  //final String categoryTitle;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  void initState()
  {
    super.initState();
  }

  @override
  void didChangeDependencies()
  {
    if(_loadedInitData == false)
    {
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'] as String;
      displayedmeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId)
  {
      setState(() {
        displayedmeals.removeWhere((meal) => meal.id == mealId);
      });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (ctx, index) {
            return MealItem(
                id: displayedmeals[index].id,
                title: displayedmeals[index].title,
                imageURL: displayedmeals[index].imageUrl,
                duration: displayedmeals[index].duration,
                complexity: displayedmeals[index].complexity,
                affordability: displayedmeals[index].affordability,
            );
        },
        itemCount: displayedmeals.length,
      ),
    );
  }

}
