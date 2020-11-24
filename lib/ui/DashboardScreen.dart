import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   backgroundColor: Colors.red,
      //   type: BottomNavigationBarType.shifting,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, color: Colors.white),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, color: Colors.white),
      //       label: 'History',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, color: Colors.white),
      //       label: 'Wallet',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home, color: Colors.white),
      //       label: 'Support',
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: new DecorationImage(
                image: AssetImage(
                  'images/casino_bg.jpg',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 40, 0, 0),
            child: Icon(
              Icons.menu_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 40, 60, 0),
              child: Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 40, 20, 0),
              child: Icon(
                Icons.notification_important_rounded,
                color: Colors.white,
                size: 26,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        'Welcome to ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        color: Colors.white,
                        child: Text(
                          'Kuber Group',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    'Vishwas ka Dhanda Vishwas Ke Sath',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonTheme(
                        minWidth: 150,
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Kuber Starline',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {},
                          elevation: 12,
                          color: Colors.red,
                          splashColor: Colors.white,
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 150,
                        height: 40.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Kuber Jackpot',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {},
                          elevation: 12,
                          color: Colors.transparent,
                          splashColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/ic_whatsapp.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        '7890127174',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
