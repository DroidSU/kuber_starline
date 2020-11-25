import 'package:flutter/material.dart';
import 'package:kuber_starline/ui/DrawerScreen.dart';
import 'package:kuber_starline/ui/HomeScreen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey _scaffoldKey = new GlobalKey();
  bool isOpenDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawerEnableOpenDragGesture: false,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.white),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.account_balance_wallet_rounded, color: Colors.white),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_outlined, color: Colors.white),
            label: 'Support',
          ),
        ],
      ),
      drawer: DrawerScreen(),
      body: HomeScreen(),
    );
  }

  Widget buildListOfGames() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext buildcontext, int index) {
        return Card(
          margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
          color: Colors.white,
          shadowColor: Colors.white,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Hello',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        );
      },
    );
  }
}
