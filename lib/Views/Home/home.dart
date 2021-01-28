import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:testingapp/Views/Home/delivery.dart';
import 'package:testingapp/Views/Home/Surveys.dart';
import 'package:testingapp/Views/Home/Agreements.dart';
import 'package:testingapp/Views/Home/Parcels.dart';
import 'package:testingapp/Views/Home/News.dart';
import 'package:testingapp/Views/Home/Market.dart';
import 'package:testingapp/Views/Home/Emergencies.dart';
import 'package:testingapp/Views/Home/Archives.dart';
import 'package:testingapp/Models/IconModel.dart';
import 'package:testingapp/Widgets/Carousel_Template.dart';
import 'package:testingapp/Services/Auth.dart';
import 'package:testingapp/Helpers/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final AuthService _auth = AuthService();

  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconModel> _icons = [];


  Widget _buildIcon(int index) {


    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _icons[index].landing),
        );
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Color.fromRGBO(255, 255, 255, 0.19)
                    : Color(0xFFE7EBEE),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Icon(
                _icons[index].icon,
                size: 30.0,
                color: _selectedIndex == index
                    ? Theme.of(context).primaryColor
                    : Color(0xFFB4C1C4),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              _icons[index].title,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {


    _icons = [
      IconModel(icon: FontAwesomeIcons.poll, title: AppLocalizations.of(context).translate('home_icon_surveys'), landing: SurveysPage()),
      IconModel(icon: FontAwesomeIcons.handshake, title: AppLocalizations.of(context).translate('home_icon_agreements'), landing: AgreementsPage()),
      IconModel(icon: FontAwesomeIcons.shippingFast, title: AppLocalizations.of(context).translate('home_icon_parcels'), landing: ParcelsPage()),
      IconModel(icon: FontAwesomeIcons.hamburger, title: AppLocalizations.of(context).translate('home_icon_delivery'), landing: DeliveryPage()),
      IconModel(icon: FontAwesomeIcons.newspaper, title: AppLocalizations.of(context).translate('home_icon_news'), landing: NewsPage()),
      IconModel(icon: FontAwesomeIcons.balanceScale, title: AppLocalizations.of(context).translate('home_icon_market'), landing: MarketPage()),
      IconModel(icon: FontAwesomeIcons.ambulance, title: AppLocalizations.of(context).translate('home_icon_emergencies'), landing: EmergenciesPage()),
      IconModel(icon: FontAwesomeIcons.archive, title:  AppLocalizations.of(context).translate('home_icon_archives'), landing: ArchivesPage()),
      IconModel(icon: FontAwesomeIcons.bell, title:  AppLocalizations.of(context).translate('home_icon_notifications'), landing: DeliveryPage()),
    ];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 120.0),
              child: Text(
                'La Floresta',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .take(3)
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .skip(3)
                  .take(3)
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .skip(6)
                  .take(3)
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            SizedBox(height: 20.0),
            CarouselTemplate(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) async {
          setState(() {
            _currentTab = value;
          });
          if (_currentTab == 2) {
            await _auth.signOut();
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_pizza,
              size: 30.0,
            ),
            title: SizedBox.shrink(),
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            title: SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
