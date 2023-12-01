import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/fillters_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filteredMeal = {
    'gluten': false,
    'lactos': false,
    'vegan': false,
    'vegetarian': false
  };
  void _setFilter(Map<String, bool> filtterData) {
    setState(() {
      _filteredMeal = filtterData;
      _availableMeal = DUMMY_MEALS.where((element) {
        if (_filteredMeal['gluten']! && !element.isGlutenFree) {
          return false;
        }
        if (_filteredMeal['lactos']! && !element.isLactoseFree) {
          return false;
        }
        if (_filteredMeal['vegan']! && !element.isVegan) {
          return false;
        }
        if (_filteredMeal['vegetarian']! && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggle(String mealId) {
    final exsitingIndex = favMeal.indexWhere((element) => element.id == mealId);
    if (exsitingIndex >= 0) {
      setState(() {
        favMeal.removeAt(exsitingIndex);
      });
    } else {
      setState(() {
        favMeal.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  bool _isfav(String mealId) {
    return favMeal.any((element) => element.id == mealId);
  }

  List<Meal> _availableMeal = DUMMY_MEALS;
  List<Meal> favMeal = [];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meals',
      color: Colors.blue,
      home: TabsScreen(favMeal: favMeal),
      routes: {
        //'/': (context) => const TabsScreen(),
        CategoryMeals.route: (context) => CategoryMeals(
              availableMeals: _availableMeal,
            ),
        MealDetailScreen.rout: (context) =>
            MealDetailScreen(fav: _toggle, isfav: _isfav),
        FillterScreen.routName: (context) => FillterScreen(
            selectMealFillter: _setFilter, currentFillter: _filteredMeal),
      },
    );
  }
}
