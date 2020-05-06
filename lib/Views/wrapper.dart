import 'package:testingapp/Views/Home/home.dart';
import 'package:testingapp/Models/User.dart';
import 'package:testingapp/Views/Authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}
