import 'package:flutter/material.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/customs/custom_inc_dec_textfield.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingleGameScreen extends StatefulWidget {
  GameData gameData;

  SingleGameScreen({this.gameData});

  @override
  _SingleGameScreenState createState() => _SingleGameScreenState();
}

class _SingleGameScreenState extends State<SingleGameScreen> {
  String walletBalance = "";
  String authToken = "";
  GameData gameData;
  List<int> listOfNumbers = List();
  int totalPoints = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gameData = widget.gameData;
    fetchUserDetails();
    listOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
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
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 40, 0),
                  child: Text(
                    'Total Points: ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 100, 8, 0),
                  child: Text(
                    totalPoints.toString(),
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
                  padding: EdgeInsets.all(15),
                  child: GridView.builder(
                      itemCount: listOfNumbers.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100,
                          childAspectRatio: 4 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 15),
                      itemBuilder: (BuildContext buildcontext, index) {
                        return CustomTextField(boxValue: listOfNumbers[index]);
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
              )
            ],
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
