import 'package:testingapp/Models/HomeViewModel.dart';
import 'package:testingapp/Views/Home/home.dart';
import 'package:testingapp/Views/Authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeView = Provider.of<HomeViewModel>(context);
    print(homeView);
    print(homeView.user);
    // return either the Home or Authenticate widget
    if (homeView == null || homeView.user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}
