import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/screens/views/home_view_tab.dart';
import 'package:flutterscainitiativeproject/screens/views/profile_view.dart';
import 'package:flutterscainitiativeproject/screens/views/recipes_view.dart';
import 'package:flutterscainitiativeproject/screens/views/search_view.dart';
import 'dart:developer';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedinUser;
  final initialsRef = FirebaseFirestore.instance.collection('initials');
  dynamic document;
  String firstname;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;

        print(loggedinUser.uid);
      }
    } catch (e) {}
  }

  // getUserById() async {
  //   await initialsRef.doc(loggedinUser.uid).get().then((doc) {
  //     setState(() {
  //       document = doc.data();
  //       firstname = document["first-name"].toString();
  //     });
  //   });
  //   print(document);
  //   print(document["first-name"].toString());
  // }

  int tabIndex = 0;
  List<Widget> tabList;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
    // getUserById();
    tabList = [
      HomeScreenTab(),
      RecipesScreen(),
      SearchScreen(),
      ProfileScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Text(
              "Hi",
              style: TextStyle(
                  // letterSpacing: 0.8,
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 7,
            ),
            FutureBuilder<DocumentSnapshot>(
                future: initialsRef.doc(loggedinUser.uid).get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('User');
                  }
                  firstname = snapshot.data["first-name"].toString();

                  return Text(
                    firstname,
                    style: TextStyle(
                        // letterSpacing: 0.8,
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  );
                })
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.green,
          )
        ],
      ),
      body: SafeArea(
        child: tabList[tabIndex],
        bottom: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_sharp,
                size: 35,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 35,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 35,
              ),
              label: "")
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey.shade300,
        currentIndex: tabIndex,
        onTap: (int index) {
          setState(() {
            tabIndex = index;
          });
        },
      ),
    );
  }
}
