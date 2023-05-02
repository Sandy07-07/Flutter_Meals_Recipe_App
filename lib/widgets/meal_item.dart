import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget
{
  final String id;
  final String title;
  final String imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageURL,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText
  {
    switch(complexity)
    {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText
  {
    switch(affordability)
    {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext context)
  {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((result) => {
          if(result != null)
            {
              //removeItem(result)
            }
        });
  }

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
            Stack(children: <Widget>[
                  ClipRRect(borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(imageURL, height: 250, width: double.infinity, fit: BoxFit.cover),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20, color: Colors.amber),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
              ],
            ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                    Row(children: <Widget>[
                      const Icon(Icons.schedule_outlined),
                      const SizedBox(width: 5,),
                      Text('$duration mins'),
                        ],
                      ),
                    Row(children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(width: 5,),
                      Text(complexityText),
                        ],
                      ),
                    Row(children: <Widget>[
                      const Icon(Icons.monetization_on_outlined),
                      const SizedBox(width: 5,),
                      Text(affordabilityText),
                        ],
                    ),
               ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
