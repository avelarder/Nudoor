import 'dart:convert';

import 'package:testingapp/Models/HomeViewModel.dart';
import 'package:testingapp/Models/NewsFeedModel.dart';
import 'package:testingapp/views/wrapper.dart';
import 'package:testingapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testingapp/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:testingapp/Helpers/app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  HomeViewModel buildUpHomeModel() {
    final List<NewsFeedModel> newsFeedItems = [];
    final records = Firestore.instance.collection('NewsFeed').snapshots();

    print('reading records from firebase');
    records.forEach((element) {
      print('document read');
      element.documents.forEach((record) {
        newsFeedItems.add(NewsFeedModel.fromSnapshot(record));
        print('record added');
      });
    });

/*
    final List<NewsFeedModel> newsFeedItems = [
      NewsFeedModel(
        title: "Sample 1",
        description: "sample description here.",
        isPublic: true,
        postedOn: DateTime.now(),
        thumbnail: "https://media.istockphoto.com/photos/happy-family-outdoors-picture-id997714898?b=1&k=6&m=997714898&s=170x170&h=WC30cLGGj5VLKLMskAg7Hcf79oJjcpB-ILjbaD_B7Hw="
    )];
*/

    return new HomeViewModel(newsFeeds: newsFeedItems, user: AuthService().user);
  }

  @override
  Widget build(BuildContext context) {

    return StreamProvider<HomeViewModel>.value(
      value: Stream.value(buildUpHomeModel()),
      child: StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          supportedLocales: [
            Locale('en', 'US'),
            Locale('es', 'US'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode &&
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          home: Wrapper(),
        ),
      ),
    );
  }


}
