import 'package:flutter/material.dart';
import 'package:kuber_starline/network/models/game_model.dart';

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
