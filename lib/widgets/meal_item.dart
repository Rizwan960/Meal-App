import 'package:flutter/material.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity comlexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.comlexity,
    required this.affordability,
    required this.id,
  }) : super(key: key);
  String get complexityText {
    switch (comlexity) {
      case Complexity.simple:
        return "Simple";
      case Complexity.challenging:
        return "Challenging";
      case Complexity.hard:
        return "Hard";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";
      case Affordability.pricey:
        return "Pricey";
      case Affordability.luxurious:
        return "Luxurious";
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(
      MealDetailScreen.rout,
      arguments: id,
    )
        .then((value) {
      if (value != null) {
        // removeItem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        selectMeal(context),
      },
      splashColor: Colors.pink,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
        margin: const EdgeInsets.all(10),
        child: Column(children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.network(imageUrl,
                    height: 250, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 30,
                right: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 23,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(Icons.schedule),
                    const SizedBox(
                      width: 6,
                    ),
                    Text("$duration Min"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.work),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(complexityText),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.attach_money),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
