import 'package:flutter/material.dart';
import 'package:flutter_app_plugin_test/screens/home/home_screen.dart';
import 'package:flutter_app_plugin_test/screens/login/login_screen.dart';
import 'package:flutter_app_plugin_test/screens/signup/signup_screen.dart';


final routes = {
  '/login':         (BuildContext context) => new LoginScreen(),
  '/home':         (BuildContext context) => new HomeScreen(),
  '/signup':         (BuildContext context) => new SignupScreen(),
  '/' :          (BuildContext context) => new LoginScreen(),

};