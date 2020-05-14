import 'package:flutter/material.dart';
import 'package:frogbitflutter/screens/login_screen.dart';
import 'package:frogbitflutter/screens/home_screen.dart';
import 'package:frogbitflutter/screens/favourites_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        accentColor: Colors.blueGrey,
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        'HomePage': (context) => HomePage(),
        'FavouritesPage': (context) => FavouritesPage()
      },
    );
  }
}
