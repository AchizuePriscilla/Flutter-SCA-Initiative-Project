import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterscainitiativeproject/routes/route_generator.dart';
import 'package:flutterscainitiativeproject/routes/route_names.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SCA Initiative Project',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: RouteNames.routes,
      initialRoute: RouteNames.welcomeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
