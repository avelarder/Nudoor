import 'User.dart';
import 'NewsFeedModel.dart';

class HomeViewModel{
  final List<NewsFeedModel> newsFeeds;
  final Stream<User> user;

  HomeViewModel({this.newsFeeds, this.user});

}