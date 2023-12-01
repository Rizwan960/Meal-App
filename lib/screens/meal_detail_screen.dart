import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function fav;
  final Function isfav;
  const MealDetailScreen({Key? key, required this.fav, required this.isfav})
      : super(key: key);
  static const rout = "/Meal_Detail_Screen";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (element) => element.id == mealId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 8,
            margin: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "Ingredients",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) => Card(
                color: Colors.pinkAccent,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index])),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: const Text(
              "Steps",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.pinkAccent,
                            child: Text("${index + 1}"),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        const Divider()
                      ],
                    )),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isfav(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => fav(mealId),
      ),
    );
  }
}
