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
}
