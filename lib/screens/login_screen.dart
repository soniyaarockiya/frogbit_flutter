import 'package:flutter/material.dart';
import 'package:frogbitflutter/constants/ui_constants.dart';
import 'package:frogbitflutter/services/authentication.dart';
import 'package:frogbitflutter/services/provider_package_state_management.dart';
import 'package:provider/provider.dart';

//TODO: Render overflow

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // UI constants
  BaseAuth _auth = new Auth();
  final formKey = new GlobalKey<FormState>();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
//            color: Color(0xFFfab000),
              ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(30.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                style: kTextFieldStyle,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                ),
                validator: (value) =>
                    value.isEmpty ? 'Email cant be empty' : null,
                onSaved: (value) => email = value.trim(),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                style: kTextFieldStyle,
//                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter the password',
                ),
                validator: (value) =>
                    value.isEmpty ? 'pass word cant be empty' : null,
                onSaved: (value) => password = value,
              ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                elevation: 10.0,
                color: Color(0xFFfab000),
                onPressed: validateAndSubmit,
                child: Text(
                  'Login',
                  style: kTextFieldStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Validate form
  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      //if you don't save the form , it returns null for both email and password
      form.save();
      return true;
    } else {
      return false;
    }
  }

  //Submit form and login
  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        String userId = await _auth.signInWithEmailAndPassword(email, password);
        if (userId != null) {
          print("success......user id is ................$userId");
          Provider.of<UserDataProvider>(context, listen: false)
              .changeString(userId.toUpperCase());
          formKey.currentState.reset();
          //Use pushReplacementNamed to remove previous screen (login) and back button from home page
          Navigator.of(context).pushReplacementNamed('HomePage');
//          Navigator.pushNamed(context, 'HomePage');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
