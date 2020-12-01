import 'package:flutter/material.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/customs/custom_inc_dec_textfield.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SinglePannaGameScreen extends StatefulWidget {
  final GameData gameData;
  final String gameType;
  final String gameTime;

  SinglePannaGameScreen(
      {@required this.gameData,
      @required this.gameType,
      @required this.gameTime});

  @override
  _SinglePannaGameScreenState createState() => _SinglePannaGameScreenState();
}

class _SinglePannaGameScreenState extends State<SinglePannaGameScreen> {
  String walletBalance = "";
  String authToken = "";
  GameData gameData;
  String gameType;
  String gameTime;

  int totalPoints = 0;

  List<int> oneSeriesNumbers = List();
  List<int> twoSeriesNumbers = List();
  List<int> threeSeriesNumbers = List();
  List<int> fourSeriesNumbers = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameData = widget.gameData;
    gameType = widget.gameType;
    gameTime = widget.gameTime;

    getUserDetails();

    oneSeriesNumbers = [
      128,
      137,
      146,
      236,
      245,
      290,
      380,
      470,
      489,
      560,
      678,
      579
    ];

    twoSeriesNumbers = [
      129,
      138,
      147,
      156,
      237,
      246,
      354,
      390,
      480,
      570,
      679,
      589
    ];

    threeSeriesNumbers = [
      120,
      139,
      148,
      157,
      238,
      247,
      256,
      346,
      490,
      580,
      670,
      689
    ];

    fourSeriesNumbers = [
      130,
      149,
      158,
      167,
      239,
      248,
      257,
      347,
      356,
      590,
      680,
      789
    ];
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
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 100, 0, 0),
                  child: Text(
                    gameType,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 160, 0, 0),
                  child: Text(
                    'Total Points: ',
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
                  margin: EdgeInsets.fromLTRB(130, 160, 0, 0),
                  child: Text(
                    totalPoints.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 90, 10, 0),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lock_clock,
                      color: Colors.red,
                    ),
                    label: Text(
                      gameTime,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 220, 0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              '1\'s series',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          GridView.builder(
                              itemCount: oneSeriesNumbers.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 100,
                                      childAspectRatio: 4 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 15),
                              itemBuilder: (BuildContext buildcontext, index) {
                                return CustomTextField(
                                  boxValue: oneSeriesNumbers[index],
                                  onAmountValueChanged: (value) {
                                    // valueMap[index] = int.parse(value);
                                    // int currentPoint = 0;
                                    //
                                    // for (int i = 0; i < valueMap.length; i++) {
                                    //   currentPoint += valueMap[i];
                                    // }
                                    //
                                    // setState(() {
                                    //   totalPoints = currentPoint;
                                    // });
                                  },
                                );
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              '2\'s series',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          GridView.builder(
                              itemCount: twoSeriesNumbers.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 100,
                                      childAspectRatio: 4 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 15),
                              itemBuilder: (BuildContext buildcontext, index) {
                                return CustomTextField(
                                  boxValue: twoSeriesNumbers[index],
                                  onAmountValueChanged: (value) {
                                    // valueMap[index] = int.parse(value);
                                    // int currentPoint = 0;
                                    //
                                    // for (int i = 0; i < valueMap.length; i++) {
                                    //   currentPoint += valueMap[i];
                                    // }
                                    //
                                    // setState(() {
                                    //   totalPoints = currentPoint;
                                    // });
                                  },
                                );
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              '3\'s series',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          GridView.builder(
                              itemCount: threeSeriesNumbers.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 100,
                                      childAspectRatio: 4 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 15),
                              itemBuilder: (BuildContext buildcontext, index) {
                                return CustomTextField(
                                  boxValue: threeSeriesNumbers[index],
                                  onAmountValueChanged: (value) {
                                    // valueMap[index] = int.parse(value);
                                    // int currentPoint = 0;
                                    //
                                    // for (int i = 0; i < valueMap.length; i++) {
                                    //   currentPoint += valueMap[i];
                                    // }
                                    //
                                    // setState(() {
                                    //   totalPoints = currentPoint;
                                    // });
                                  },
                                );
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Text(
                              '4\'s series',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          GridView.builder(
                              itemCount: fourSeriesNumbers.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 100,
                                      childAspectRatio: 4 / 2,
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 15),
                              itemBuilder: (BuildContext buildcontext, index) {
                                return CustomTextField(
                                  boxValue: fourSeriesNumbers[index],
                                  onAmountValueChanged: (value) {
                                    // valueMap[index] = int.parse(value);
                                    // int currentPoint = 0;
                                    //
                                    // for (int i = 0; i < valueMap.length; i++) {
                                    //   currentPoint += valueMap[i];
                                    // }
                                    //
                                    // setState(() {
                                    //   totalPoints = currentPoint;
                                    // });
                                  },
                                );
                              }),
                        ],
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

  void getUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    walletBalance =
        sharedPreferences.getString(Constants.SHARED_PREF_WALLET_BALANCE);
    authToken = sharedPreferences.getString(Constants.SHARED_PREF_AUTH_TOKEN);
  }
}
