import 'package:testingapp/Models/HomeViewModel.dart';
import 'package:testingapp/Models/NewsFeedModel.dart';
import 'package:testingapp/views/wrapper.dart';
import 'package:testingapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  HomeViewModel buildUpHomeModel() {
    final List<NewsFeedModel> newsFeedItems = [
      NewsFeedModel(
        title: "Sample 1",
        description: "sample description here.",
        isPublic: true,
        postedOn: DateTime.now(),
        thumbnail: "https://media.istockphoto.com/photos/happy-family-outdoors-picture-id997714898?b=1&k=6&m=997714898&s=170x170&h=WC30cLGGj5VLKLMskAg7Hcf79oJjcpB-ILjbaD_B7Hw="
    )];

    return new HomeViewModel(newsFeeds: newsFeedItems, user: AuthService().user);
  }

  @override
  Widget build(BuildContext context) {

    return StreamProvider<HomeViewModel>.value(
      value: Stream.value(buildUpHomeModel()),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }


}
