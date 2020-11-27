import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/src/response.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/network/HTTPService.dart';
import 'package:kuber_starline/network/models/register_response_model.dart';
import 'package:kuber_starline/ui/DashboardScreen.dart';
import 'package:kuber_starline/ui/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name;
  String email;
  String mobileNumber;

  bool isRegistering = false;
  bool _validName = true;
  bool _validEmail = true;
  bool _validMobile = true;

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController mobileNumberController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobileNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipRect(
              child: Image.asset('images/vector_wave_shape.png'),
            ),
            Positioned(
              child: Container(
                margin: EdgeInsets.fromLTRB(20, 140, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: 'New Users,\n',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'REGISTER TO \n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 24)),
                      TextSpan(
                        text: 'EARN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 24),
                      ),
                    ],
                  ),
                ),
              ),
              top: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 10,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 300, 20, 0),
                  child: TextField(
                    controller: nameController,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Full name",
                        errorText:
                            _validName ? null : "Please enter valid name",
                        fillColor: Colors.white),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Card(
                  elevation: 10,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: emailController,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Email address",
                        errorText: _validEmail
                            ? null
                            : "Please enter proper email address",
                        fillColor: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Card(
                  elevation: 10,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextField(
                    controller: mobileNumberController,
                    decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Mobile Number",
                        errorText: _validMobile
                            ? null
                            : "Please enter valid mobile number",
                        fillColor: Colors.white),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
                  child: !isRegistering
                      ? ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              'Register',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () {
                              if (nameController.text.trim().isNotEmpty &&
                                  emailController.text.trim().isNotEmpty &&
                                  mobileNumberController.text
                                      .trim()
                                      .isNotEmpty &&
                                  mobileNumberController.text.trim().length ==
                                      10) {
                                setState(() {
                                  isRegistering = true;
                                });

                                email = emailController.text;
                                name = nameController.text;
                                mobileNumber = mobileNumberController.text;

                                HTTPService()
                                    .registerUser(
                                        email: email,
                                        name: name,
                                        mobileNumber: mobileNumber)
                                    .then((response) => {
                                          if (response.statusCode == 200)
                                            {goToNextScreen(response)}
                                          else
                                            {showerrorDialog(response)}
                                        });
                              } else {
                                if (nameController.text.isEmpty) {
                                  _validName = false;
                                }

                                if (emailController.text.isEmpty) {
                                  _validEmail = false;
                                }

                                if (mobileNumberController.text.isEmpty ||
                                    mobileNumberController.text.length != 10) {
                                  _validMobile = false;
                                }
                              }

                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(
                              //         builder: (context) => DashboardScreen()));
                            },
                            elevation: 12,
                            color: Colors.red,
                            splashColor: Colors.white,
                          ),
                        )
                      : CircularProgressIndicator(),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: InkWell(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already a player?',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red,
                                    fontSize: 16)),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goToNextScreen(Response response) async {
    var responseJSON = RegisterResponse.fromJson(json.decode(response.body));

    setState(() {
      isRegistering = false;
    });

    if (responseJSON.status == true) {
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setString(Constants.SHARED_PREF_NAME, name);
      sharedPrefs.setString(Constants.SHARED_PREF_EMAIL, email);
      sharedPrefs.setString(Constants.SHARED_PREF_MOBILE_NUMBER, mobileNumber);
      sharedPrefs.setString(
          Constants.SHARED_PREF_AUTH_TOKEN, responseJSON.token);
      sharedPrefs.setBool(Constants.SHARED_PREF_REGISTRATION_COMPLETE, true);

      Navigator.of(context).pushReplacement(new PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DashboardScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ));
    } else {
      showerrorDialog(response);
    }
  }

  Future<void> _showMyDialog(String contentMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Icon(
            Icons.info,
            color: Color(0xFFFF4c4c),
            size: 40,
          ),
          content: Text(
            contentMessage,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontFamily: 'Montserrat'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  showerrorDialog(Response response) {
    var responseJSON = RegisterResponse.fromJson(json.decode(response.body));
    setState(() {
      isRegistering = false;
    });

    _showMyDialog(responseJSON.message);
  }
}
