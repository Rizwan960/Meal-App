import 'package:flutter/material.dart';
import 'package:meal_app/screens/fillters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          color: Colors.pinkAccent,
          child: const Text(
            "Cooking Up!",
            style: TextStyle(
                fontWeight: FontWeight.w900, fontSize: 30, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListTile(
          leading: const Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: const Text(
            'Meals',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.settings,
            size: 26,
          ),
          title: const Text(
            'Fillters',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(FillterScreen.routName);
          },
        ),
      ]),
    );
  }
}
