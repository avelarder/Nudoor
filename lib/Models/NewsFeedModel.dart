import 'package:cloud_firestore/cloud_firestore.dart';

class NewsFeedModel {
  final String title;
  final String description;
  final String thumbnail;
  final bool isPublic;
  final DateTime postedOn;
  final DocumentReference reference;

//  NewsFeedModel({this.title, this.description, this.thumbnail, this.isPublic, this.postedOn});

  NewsFeedModel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['Title'] != null),
        assert(map['Description'] != null),
        assert(map['Thumbnail'] != null),
        assert(map['IsPublic'] != null),
        assert(map['Posted On'] != null),
        title  = map['Title'],
        description = map['Description'],
        thumbnail = map['Thumbnail'],
        isPublic = map['IsPublic'],
        postedOn = map['Posted On'].toDate();

  NewsFeedModel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

}