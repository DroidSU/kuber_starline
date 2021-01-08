import 'package:flutter/material.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/customs/custom_inc_dec_textfield.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TriplePannaGameScreen extends StatefulWidget {
  final GameData gameData;
  final String gameType;
  final String gameTime;

  TriplePannaGameScreen(
      {@required this.gameData,
      @required this.gameType,
      @required this.gameTime});

  @override
  _TriplePannaGameScreenState createState() => _TriplePannaGameScreenState();
}

class _TriplePannaGameScreenState extends State<TriplePannaGameScreen> {
  GameData gameData;
  String gameTime;
  String gameType;
  String walletBalance = "";
  String authToken = "";

  int totalPoints = 0;
  List<int> listOfNumbers = List();
  Map<int, int> valueMap = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameData = widget.gameData;
    gameTime = widget.gameTime;
    gameType = widget.gameType;

    fetchUserDetails();

    listOfNumbers = [000, 111, 222, 333, 444, 555, 666, 777, 888, 999];

    if (valueMap.isEmpty) {
      for (int i = 0; i < 10; i++) {
        valueMap[i] = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: GridView.builder(
                          itemCount: listOfNumbers.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100,
                                  childAspectRatio: 4 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 15),
                          itemBuilder: (BuildContext buildcontext, index) {
                            return CustomTextField(
                              boxValue: listOfNumbers[index],
                              onAmountValueChanged: (value) {
                                valueMap[index] = int.parse(value);
                                int currentPoint = 0;

                                for (int i = 0; i < valueMap.length; i++) {
                                  currentPoint += valueMap[i];
                                }

                                setState(() {
                                  totalPoints = currentPoint;
                                });
                              },
                            );
                          }),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: MaterialButton(
                        elevation: 10,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Colors.red,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onWillPop: onBackPressed);
  }

  void fetchUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    walletBalance =
        sharedPreferences.getString(Constants.SHARED_PREF_WALLET_BALANCE);
    authToken = sharedPreferences.getString(Constants.SHARED_PREF_AUTH_TOKEN);
  }

  Future<bool> onBackPressed() async {
    Navigator.of(context).pop();

    return true;
  }
}
