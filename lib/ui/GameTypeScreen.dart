import 'package:flutter/material.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:kuber_starline/ui/SingleGameScreen.dart';

class GameTypeScreen extends StatefulWidget {
  GameData gameData;

  GameTypeScreen({this.gameData});

  @override
  _GameTypeScreenState createState() => _GameTypeScreenState();
}

class _GameTypeScreenState extends State<GameTypeScreen> {
  GameData gameData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameData = widget.gameData;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
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
                margin: EdgeInsets.fromLTRB(12, 40, 0, 0),
                child: InkWell(
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Colors.white,
                  ),
                  onTap: () {
                    onBackPressed();
                  },
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    gameData.gamename,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: <Widget>[
                      Container(
                        color: Colors.transparent,
                        // decoration: new BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.black45,
                        //       blurRadius: 10.0, // soften the shadow
                        //       spreadRadius: 2.0, //extend the shadow
                        //       // offset: Offset(
                        //       //   10.0, // Move to right 10  horizontally
                        //       //   15.0, // Move to bottom 10 Vertically
                        //       // ),
                        //     ),
                        //   ],
                        //   color: Colors.transparent,
                        // ),
                        child: InkWell(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/teen_patti_image.png',
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Single',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                                    builder: (context) => SingleGameScreen(
                                          gameData: gameData,
                                        )));
                          },
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        // decoration: new BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.black45,
                        //       blurRadius: 10.0, // soften the shadow
                        //       spreadRadius: 2.0, //extend the shadow
                        //       // offset: Offset(
                        //       //   10.0, // Move to right 10  horizontally
                        //       //   15.0, // Move to bottom 10 Vertically
                        //       // ),
                        //     ),
                        //   ],
                        //   color: Colors.transparent,
                        // ),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/teen_patti_image.png',
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Single Panna',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        // decoration: new BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.black45,
                        //       blurRadius: 10.0, // soften the shadow
                        //       spreadRadius: 2.0, //extend the shadow
                        //       // offset: Offset(
                        //       //   10.0, // Move to right 10  horizontally
                        //       //   15.0, // Move to bottom 10 Vertically
                        //       // ),
                        //     ),
                        //   ],
                        //   color: Colors.transparent,
                        // ),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/teen_patti_image.png',
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Double Panna',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        // decoration: new BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.black45,
                        //       blurRadius: 10.0, // soften the shadow
                        //       spreadRadius: 2.0, //extend the shadow
                        //       // offset: Offset(
                        //       //   10.0, // Move to right 10  horizontally
                        //       //   15.0, // Move to bottom 10 Vertically
                        //       // ),
                        //     ),
                        //   ],
                        //   color: Colors.transparent,
                        // ),
                        child: Column(
                          children: [
                            Image.asset(
                              'images/teen_patti_image.png',
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Triple Panna',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onWillPop: onBackPressed);
  }

  Future<bool> onBackPressed() async {
    Navigator.of(context).pop();

    return true;
  }
}
