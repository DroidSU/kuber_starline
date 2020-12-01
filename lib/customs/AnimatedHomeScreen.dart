import 'package:flutter/material.dart';

class AnimatedHomeScreen extends StatefulWidget {
  @override
  _AnimatedHomeScreenState createState() => _AnimatedHomeScreenState();
}

class _AnimatedHomeScreenState extends State<AnimatedHomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scalefactor = 1;
  bool isOpenDrawer = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scalefactor),
      child: Stack(
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
              child: InkWell(
                child: !isOpenDrawer
                    ? Icon(
                        Icons.menu_rounded,
                        color: Colors.white,
                        size: 26,
                      )
                    : Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 26,
                      ),
                onTap: () {
                  setState(() {
                    if (!isOpenDrawer) {
                      xOffset = 200;
                      yOffset = 100;
                      scalefactor = 0.8;
                      isOpenDrawer = true;
                    } else {
                      xOffset = 0;
                      yOffset = 0;
                      scalefactor = 1;
                      isOpenDrawer = false;
                    }
                  });
                },
              )),
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
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: buildListOfGames(),
                )
              ],
            ),
          ),
        ],
      ),
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
