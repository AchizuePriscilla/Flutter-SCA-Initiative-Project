import 'package:flutter/material.dart';

class RouteNames {
  //route names used through out the app will be specified as static constants here

  static const String splashScreen = '/';
  static const String homeScreen = 'HomeScreen';
  static const String onboarding = 'OnboardingScreen';
  static const String homeScreenTab = 'HomeScreenTab';
  static const String loginScreen = 'LoginScreen';
  static const String registerScreen = 'RegisterScreen';
  static const String profileScreen = 'ProfileScreen';
  static const String recipesScreen = 'recipesScreen';
  static const String searchScreen = 'SearchScreen';
  static const String signupScreen = 'signupScreen';
  static const String welcomeScreen = 'welcomeScreen';

  static Map<String, Widget Function(BuildContext)> routes = {
    // RouteNames.splashScreen: (context) => SplashScreen(),
  };
}
