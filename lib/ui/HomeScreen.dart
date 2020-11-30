import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/customs/utility_methods.dart';
import 'package:kuber_starline/network/HTTPService.dart';
import 'package:kuber_starline/network/models/all_games_response_model.dart';
import 'package:kuber_starline/network/models/game_model.dart';
import 'package:kuber_starline/network/models/get_wallet_response_model.dart';
import 'package:kuber_starline/network/models/wallet_model.dart';
import 'package:kuber_starline/ui/ChooseGameTimeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpenDrawer = false;
  bool _hasFetchedGames = false;
  String authToken = "";

  List<GameData> listOfGames = List();
  WalletData _walletData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAuthToken();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                if (!Scaffold.of(context).isDrawerOpen)
                  Scaffold.of(context).openDrawer();
                else
                  Navigator.of(context).pop();
              },
            )),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 40, 80, 0),
            child: Icon(
              Icons.account_balance_wallet_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            child: Text(
              _walletData != null
                  ? '\u{20B9} ${_walletData.balance}'
                  : "\u{20B9} 0",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            margin: EdgeInsets.fromLTRB(10, 40, 55, 0),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
            child: Icon(
              Icons.notification_important_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(20, 90, 0, 0),
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
          margin: EdgeInsets.fromLTRB(20, 130, 0, 0),
          child: Text(
            'Vishwas ka Dhanda Vishwas Ke Sath',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                      '**********',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              _hasFetchedGames
                  ? Expanded(
                      child: buildListOfGames(),
                    )
                  : Container(),
            ],
          ),
        ),
        !_hasFetchedGames
            ? Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(),
      ],
    );
  }

  Widget buildListOfGames() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listOfGames.length,
      itemBuilder: (BuildContext buildcontext, int index) {
        return InkWell(
          child: Card(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            color: Colors.white,
            shadowColor: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              padding: EdgeInsets.all(8),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: 16,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Column(
                            children: [
                              Text(
                                'Open Bids',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                UtilityMethodsManager().beautifyTime(
                                    listOfGames[index].slot2Time1),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                'Close Bids',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                ),
                              ),
                              Text(
                                UtilityMethodsManager().beautifyTime(
                                    listOfGames[index].slot2Time2),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            listOfGames[index].gamename,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          child: Text(
                            listOfGames[index].result1.substring(0, 3) +
                                "-" +
                                listOfGames[index].result1.substring(3, 4) +
                                " " +
                                listOfGames[index].result2.substring(0, 3) +
                                "-" +
                                listOfGames[index].result2.substring(3, 4),
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'images/play_button.png',
                      height: 30,
                      width: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ChooseGameTimeScreen(
                      gameData: listOfGames[index],
                    )));
          },
        );
      },
    );
  }

  void displayGames(Response response) {
    var responseJSON =
        AllGamesResponseModel.fromJson(json.decode(response.body));

    if (responseJSON.status) {
      setState(() {
        _hasFetchedGames = true;
        listOfGames = responseJSON.data;
      });
    } else {}
  }

  void fetchAuthToken() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    authToken = sharedPrefs.getString(Constants.SHARED_PREF_AUTH_TOKEN);

    HTTPService().fetchAllGames(authToken).then((response) => {
          if (response.statusCode == 200)
            {displayGames(response)}
          else
            {print(response.body)}
        });

    HTTPService().getWalletDetails(authToken).then((response) => {
          if (response.statusCode == 200)
            {showWalletData(response)}
          else
            {print('Wallet balance could not be fetched')}
        });
  }

  void showWalletData(Response response) {
    var walletResponseJSON =
        GetWalletBalanceResponseModel.fromJson(json.decode(response.body));

    if (walletResponseJSON.status) {
      storeWalletBalance(walletResponseJSON.data.balance);
      setState(() {
        _walletData = walletResponseJSON.data;
      });
    } else {
      print(response.body);
    }
  }

  void storeWalletBalance(String walletBalance) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setString(Constants.SHARED_PREF_WALLET_BALANCE, walletBalance);
  }
}
