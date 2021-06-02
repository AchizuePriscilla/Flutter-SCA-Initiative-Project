import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/arguments/home_view_argument.dart';
import 'package:flutterscainitiativeproject/screens/views/home_view_tab.dart';
import 'package:flutterscainitiativeproject/screens/views/profile_view.dart';
import 'package:flutterscainitiativeproject/screens/views/recipes_view.dart';
import 'package:flutterscainitiativeproject/screens/views/search_view.dart';

class HomeScreen extends StatefulWidget {
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
    final args = ModalRoute.of(context).settings.arguments as HomeViewArguments;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Hi ${args.firstname ?? args.firstname}",
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
