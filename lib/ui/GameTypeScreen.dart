import 'package:flutter/material.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:kuber_starline/ui/SingleGameScreen.dart';
import 'package:kuber_starline/ui/SinglePannaGameScreen.dart';
import 'package:kuber_starline/ui/TriplePannaGameScreen.dart';

class GameTypeScreen extends StatefulWidget {
  final GameData gameData;
  final String selectedTime;

  GameTypeScreen({@required this.gameData, @required this.selectedTime});

  @override
  _GameTypeScreenState createState() => _GameTypeScreenState();
}

class _GameTypeScreenState extends State<GameTypeScreen> {
  GameData gameData;
  String selectedTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameData = widget.gameData;
    selectedTime = widget.selectedTime;
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
                        child: InkWell(
                          child: Column(
                            children: [
                              Image.asset(
                                'images/ic_single.png',
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
                                          gameType: "Single",
                                          gameTime: selectedTime,
                                        )));
                          },
                        ),
                      ),
                      Container(
                          color: Colors.transparent,
                          child: InkWell(
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/ic_one_patti.png',
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Single Panna',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SinglePannaGameScreen(
                                            gameData: gameData,
                                            gameType: "Single Panna",
                                            gameTime: selectedTime,
                                          )));
                            },
                          )),
                      Container(
                          color: Colors.transparent,
                          child: InkWell(
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/ic_two_patti.png',
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Double Panna',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            onTap: () {},
                          )),
                      Container(
                          color: Colors.transparent,
                          child: InkWell(
                            child: Column(
                              children: [
                                Image.asset(
                                  'images/ic_three_patti.png',
                                  height: 100,
                                  width: 100,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Triple Panna',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TriplePannaGameScreen(
                                            gameData: gameData,
                                            gameType: "Triple Panna",
                                            gameTime: selectedTime,
                                          )));
                            },
                          )),
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
