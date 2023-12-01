import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {
  static const route = '/category-meals-screen';

  final List<Meal> availableMeals;

  const CategoryMeals({super.key, required this.availableMeals});

  @override
  State<CategoryMeals> createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String? categoryTitle;
  List<Meal> displayedMeals = [];
  var _isLoaded = false;

  @override
  void didChangeDependencies() {
    if (!_isLoaded) {
      final route =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = route['title'];
      final categoryId = route['id'];
      displayedMeals = widget.availableMeals.where(((element) {
        return element.categoryId.contains(categoryId);
      })).toList();
      _isLoaded = true;
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    displayedMeals.removeWhere((element) => element.id == mealId);
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
          itemBuilder: (ctx, i) {
            return MealItem(
              id: displayedMeals[i].id,
              title: displayedMeals[i].title,
              imageUrl: displayedMeals[i].imageUrl,
              duration: displayedMeals[i].duration,
              comlexity: displayedMeals[i].complexity,
              affordability: displayedMeals[i].affordability,
            );
          },
          itemCount: displayedMeals.length),
    );
  }
}
