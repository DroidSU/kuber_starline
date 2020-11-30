import 'package:flutter/material.dart';
import 'package:kuber_starline/customs/utility_methods.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:kuber_starline/ui/GameTypeScreen.dart';

class ChooseGameTimeScreen extends StatefulWidget {
  GameData gameData;

  ChooseGameTimeScreen({this.gameData});

  @override
  _ChooseGameTimeScreenState createState() => _ChooseGameTimeScreenState();
}

class _ChooseGameTimeScreenState extends State<ChooseGameTimeScreen> {
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
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 140, 0, 0),
                  child: Text(
                    'Choose Time To Play',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 220,
                  height: 100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Card(
                      elevation: 15,
                      shadowColor: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                child: Text(
                                  UtilityMethodsManager()
                                      .beautifyTime(gameData.slot2Time1),
                                  style: TextStyle(
                                      color: UtilityMethodsManager()
                                              .findDifference(
                                                  gameData.slot2Time1)
                                          ? Colors.green
                                          : Colors.grey,
                                      fontSize: 20),
                                ),
                              ),
                              UtilityMethodsManager()
                                      .findDifference(gameData.slot2Time1)
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      child: InkWell(
                                        child: Image.asset(
                                          'images/play_button.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameTypeScreen(
                                                        gameData: gameData,
                                                      )));
                                        },
                                      ))
                                  : Container(),
                            ],
                          ),
                          UtilityMethodsManager()
                                  .findDifference(gameData.slot2Time1)
                              ? Container()
                              : Container(
                                  child: Text(
                                    gameData.result1.substring(0, 3) +
                                        "-" +
                                        gameData.result1.substring(3, 4),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // UtilityMethodsManager()
                          //         .findDifference(gameData.slot2Time1)
                          //     ? Container()
                          //     : Text(
                          //         'Time is over',
                          //         style: TextStyle(
                          //             color: Colors.red, fontSize: 16),
                          //       ),
                        ],
                      )),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 180, 0, 0),
                  width: 220,
                  height: 100,
                  padding: EdgeInsets.all(10),
                  child: Card(
                      elevation: 15,
                      shadowColor: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                child: Text(
                                  UtilityMethodsManager()
                                      .beautifyTime(gameData.slot2Time2),
                                  style: TextStyle(
                                      color: UtilityMethodsManager()
                                              .findDifference(
                                                  gameData.slot2Time2)
                                          ? Colors.green
                                          : Colors.grey,
                                      fontSize: 20),
                                ),
                              ),
                              UtilityMethodsManager()
                                      .findDifference(gameData.slot2Time2)
                                  ? Container(
                                      padding: EdgeInsets.all(5),
                                      child: InkWell(
                                        child: Image.asset(
                                          'images/play_button.png',
                                          height: 30,
                                          width: 30,
                                        ),
                                        onTap: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      GameTypeScreen(
                                                        gameData: gameData,
                                                      )));
                                        },
                                      ))
                                  : Container(),
                            ],
                          ),
                          UtilityMethodsManager()
                                  .findDifference(gameData.slot2Time2)
                              ? Container()
                              : Container(
                                  child: Text(
                                    gameData.result2.substring(0, 3) +
                                        "-" +
                                        gameData.result2.substring(3, 4),
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 18),
                                  ),
                                ),
                          // SizedBox(
                          //   height: 5,
                          // ),
                          // UtilityMethodsManager()
                          //         .findDifference(gameData.slot2Time2)
                          //     ? Container()
                          //     : Text(
                          //         'Time is over',
                          //         style: TextStyle(
                          //             color: Colors.red, fontSize: 16),
                          //       ),
                        ],
                      )),
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
