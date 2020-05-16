import 'package:flutter/cupertino.dart';

class UserDataProvider extends ChangeNotifier {
  //Logged In user id
  String userId = "User Id";

  void changeString(newString) {
    this.userId = newString;
    notifyListeners();
  }
}
