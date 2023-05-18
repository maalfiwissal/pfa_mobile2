import 'package:flutter/material.dart';
import 'package:pitch_project/MenuItem.dart';
import 'package:pitch_project/Home/home_user.dart';
import 'package:pitch_project/Home/home_terrain.dart';
import 'package:pitch_project/Home/home_club.dart';
import 'package:pitch_project/Home/home_zone.dart';
import 'package:pitch_project/components/reseration.dart';
import 'package:pitch_project/login.dart';
import 'package:pitch_project/villes-page.dart';
import 'package:pitch_project/setting-page.dart';
import 'package:pitch_project/About-page.dart';
import 'package:pitch_project/login.dart';
import 'package:flutter/services.dart' as http;

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch:Colors.deepOrange),
      home: LoginPage(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final menus = [
    {'title': 'Home', 'icon': Icon(Icons.home), 'page': VillePage()},
    {'title': 'Settings', 'icon': Icon(Icons.settings), 'page': SettingPage()},
    {'title': 'About', 'icon': Icon(Icons.info), 'page': AboutPage()},
    {'title': 'Users', 'icon': Icon(Icons.face_unlock_rounded), 'page': HomeUser()},
    {'title': 'Terrain', 'icon': Icon(Icons.sports_soccer_sharp), 'page':HomeTerrain()},
    {'title': 'Reservation', 'icon': Icon(Icons.sim_card_rounded), 'page':UserTerrainSelectionForm()},
    {'title': 'Club', 'icon': Icon(Icons.view_column), 'page':HomeClub()},
    {'title': 'Zone', 'icon': Icon(Icons.place_sharp), 'page':HomeZone()},
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pitch Page"),
      ),
      body: Center(
        child: Text("Home Pitch ..."),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("./images/user.png"),
                  backgroundColor: Colors.transparent,
                  minRadius: 180,
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Color.fromARGB(255, 4, 9, 18)!])),
            ),
            ...menus.map((item) {
              return new Column(
                children: <Widget>[
                  Divider(
                    color: Color.fromARGB(255, 236, 97, 27)
                  ),
                  menuItem(item['title'] as String, item['icon'] as Icon,
                      (context) {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => item['page'] as Widget));
                  })
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
