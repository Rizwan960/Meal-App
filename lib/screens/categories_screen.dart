import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/cateogry_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 190,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => CategoryItem(
                title: catData.title,
                color: catData.color,
                id: catData.id,
              ),
            )
            .toList());
  }
}
