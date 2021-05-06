import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/shared/widgets/categorySelector.dart';
import 'package:flutterscainitiativeproject/shared/widgets/recipeCard.dart';

class HomeScreenTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: ListView(
              children: [RecipeCard(), RecipeCard(), RecipeCard()],
            ),
          ),
          // ListView(
          //   shrinkWrap: true,
          //   children: [RecipeCard(), RecipeCard()],
          // ),
        ],
      ),
    );
  }
}
