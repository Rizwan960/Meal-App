import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favroties_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favMeal;
  const TabsScreen({Key? key, required this.favMeal}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const MainDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.pink,
            title: const Text("Daily Meals"),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ]),
          ),
          body: TabBarView(children: <Widget>[
            const CategoriesScreen(),
            FavrotiesScreen(
              favMeal: widget.favMeal,
            ),
          ]),
        ));
  }
}
