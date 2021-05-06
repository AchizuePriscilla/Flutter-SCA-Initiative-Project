import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/screens/homeScreen_tab.dart';
import 'package:flutterscainitiativeproject/screens/profile_screen.dart';
import 'package:flutterscainitiativeproject/screens/recipes_screen.dart';
import 'package:flutterscainitiativeproject/screens/search_screen.dart';
import 'package:flutterscainitiativeproject/shared/widgets/categorySelector.dart';

class HomeScreen extends StatefulWidget {
  final String firstName;

  const HomeScreen({this.firstName});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  User loggedinUser;

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
        print(loggedinUser.email);
      }
    } catch (e) {}
  }

  int tabIndex = 0;
  List<Widget> tabList;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
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
        title: Text("Hi ${widget.firstName ?? widget.firstName}",
            style: TextStyle(
                // letterSpacing: 0.8,
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.w700)),
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
