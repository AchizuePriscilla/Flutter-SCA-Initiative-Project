import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Color color = Colors.white;
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width * 0.85,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1602296751243-2a15fa218cf8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8eXVtbXklMjBmb29kfGVufDB8fDB8&ixlib=rb-1.2.1&w=1000&q=80")),
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.85,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Yummy food",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600),
                    ),
                    // IconButton(
                    //   onPressed: () {
                    //     color = Colors.green;
                    //   },
                    //   icon: Icon(Icons.favorite, size: 2, color: Colors.green),
                    // ),
                    Icon(Icons.favorite, size: 31, color: Colors.green),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Text(
                      "165 cal .",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15),
                    ),
                    Text(
                      "15 min",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
