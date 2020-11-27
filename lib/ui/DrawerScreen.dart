import 'package:flutter/material.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/ui/ProfileScreen.dart';
import 'package:kuber_starline/ui/SplashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String name;
  String email;
  String mobileNumber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: InkWell(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('images/default_user.png'),
                      backgroundColor: Colors.white,
                      radius: 32,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Text(
                          mobileNumber,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'App version',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
            ),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.red,
                child: Icon(
                  Icons.home,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'Home',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.lightGreen,
                child: Icon(
                  Icons.account_circle_rounded,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'My Profile',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.deepOrangeAccent,
                child: Icon(
                  Icons.lock_outline_rounded,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'Generate MPIN',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.purple,
                child: Icon(
                  Icons.history_rounded,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'My History',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.blueAccent,
                child: Icon(
                  Icons.assignment_outlined,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'Account Statement',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.pinkAccent,
                child: Icon(
                  Icons.money,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'Funds',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.deepPurple,
                child: Icon(
                  Icons.history_rounded,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'Game Rates',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.lightGreen,
                child: Icon(
                  Icons.info_outlined,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'How to play',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {},
                elevation: 2.0,
                fillColor: Colors.blueAccent,
                child: Icon(
                  Icons.settings,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              Text(
                'Settings',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              RawMaterialButton(
                onPressed: () {
                  logoutUser();
                },
                elevation: 2.0,
                fillColor: Colors.lightBlueAccent,
                child: Icon(
                  Icons.logout,
                  size: 24.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8.0),
                shape: CircleBorder(),
              ),
              InkWell(
                child: Text(
                  'Logout',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                onTap: () {
                  logoutUser();
                },
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  void logoutUser() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.clear();

    Navigator.of(context).pushReplacement(new PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SplashScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ));
  }

  void fetchUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString(Constants.SHARED_PREF_NAME);
      mobileNumber =
          sharedPreferences.getString(Constants.SHARED_PREF_MOBILE_NUMBER);
      email = sharedPreferences.getString(Constants.SHARED_PREF_EMAIL);
    });
  }
}
