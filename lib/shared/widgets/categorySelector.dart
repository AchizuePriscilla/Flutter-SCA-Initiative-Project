import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/shared/widgets/categoryTile.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ['Breakfast', 'Brunch', 'Lunch', 'Dinner'];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: CategoryTile(
                  containerColor: index == selectedIndex
                      ? Colors.green
                      : Colors.grey.shade300,
                  textColor: index == selectedIndex
                      ? Colors.white
                      : Colors.grey.shade600,
                  text: categories[index],
                ),
              ),
            );
          }),
    );
  }
}
