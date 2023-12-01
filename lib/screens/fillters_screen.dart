import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class FillterScreen extends StatefulWidget {
  static const routName = '/fillter-screen';
  const FillterScreen(
      {Key? key, required this.selectMealFillter, required this.currentFillter})
      : super(key: key);
  final Function selectMealFillter;
  final Map<String, bool> currentFillter;

  @override
  State<FillterScreen> createState() => _FillterScreenState();
}

class _FillterScreenState extends State<FillterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFillter['gluten']!;
    _vegetarian = widget.currentFillter['vegetarian']!;
    _vegan = widget.currentFillter['vegan']!;
    _lactoseFree = widget.currentFillter['lactos']!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Fillters"),
        backgroundColor: Colors.pink,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                final selectedFilter = {
                  'gluten': _glutenFree,
                  'lactos': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian
                };
                widget.selectMealFillter(selectedFilter);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            "Adjust Your Meal Selection",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        Expanded(
            child: ListView(
          children: <Widget>[
            SwitchListTile(
              value: _glutenFree,
              title: const Text("Gluten-Free"),
              subtitle: const Text("Only Include Gluteen-Free Meals"),
              onChanged: (values) {
                setState(() {
                  _glutenFree = values;
                });
              },
            ),
            SwitchListTile(
              value: _vegetarian,
              title: const Text("Vegetarina"),
              subtitle: const Text("Only Include Vegetarian Meals"),
              onChanged: (values) {
                setState(() {
                  _vegetarian = values;
                });
              },
            ),
            SwitchListTile(
              value: _lactoseFree,
              title: const Text("Lactos-Free"),
              subtitle: const Text("Only Include Lactos-Free Meals"),
              onChanged: (values) {
                setState(() {
                  _lactoseFree = values;
                });
              },
            ),
            SwitchListTile(
              value: _vegan,
              title: const Text("Vegan"),
              subtitle: const Text("Only Include Vegan Meals"),
              onChanged: (values) {
                setState(() {
                  _vegan = values;
                });
              },
            ),
          ],
        ))
      ]),
    );
  }
}
