import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavrotiesScreen extends StatelessWidget {
  final List<Meal> favMeal;
  const FavrotiesScreen({Key? key, required this.favMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favMeal.isEmpty) {
      return const Center(
          child: Text('You Dont Have Any Favroite Yet- Try Adding Some.'));
    } else {
      return ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: favMeal[i].id,
              title: favMeal[i].title,
              imageUrl: favMeal[i].imageUrl,
              duration: favMeal[i].duration,
              comlexity: favMeal[i].complexity,
              affordability: favMeal[i].affordability,
            );
          },
          itemCount: favMeal.length);
    }
  }
}
