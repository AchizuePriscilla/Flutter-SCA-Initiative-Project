import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/shared/widgets/categorySelector.dart';
import 'package:flutterscainitiativeproject/shared/widgets/recipeCard.dart';

class HomeScreenTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 13),
        CategorySelector(),
        SizedBox(
          height: 30,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              children: [RecipeCard(), RecipeCard(), RecipeCard()],
            ),
          ),
        ),
      ],
    );
  }
}
