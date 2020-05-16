import 'package:flutter/material.dart';
import 'package:frogbitflutter/screens/favourites_screen.dart';
import 'package:frogbitflutter/screens/home_screen.dart';
import 'package:frogbitflutter/screens/login_screen.dart';
import 'package:frogbitflutter/services/provider_package_state_management.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String currentUser = "Test";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserDataProvider>(
      create: (context) => UserDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
            accentColor: Colors.grey[600],
            scaffoldBackgroundColor: Colors.black87),
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          'HomePage': (context) => HomePage(),
          'FavouritesPage': (context) => FavouritesPage()
        },
      ),
    );
  }
}
