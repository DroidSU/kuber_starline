import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/network/HTTPService.dart';
import 'package:kuber_starline/network/models/login_response_model.dart';
import 'package:kuber_starline/ui/RegisterScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileController;
  TextEditingController passwordController;

  String mobile;
  String password;

  bool _validMob = true;
  bool _validPassword = true;
  bool _showProgress = false;

  Future<bool> onBackPressed() async {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => RegisterScreen()));
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mobileController = TextEditingController();
    passwordController = TextEditingController();

    mobile = "";
    password = "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mobileController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
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
                        text: 'Existing Users,\n',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'LOGIN TO \n',
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
                        controller: mobileController,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Mobile Number",
                            errorText: _validMob
                                ? null
                                : "Please enter valid mobile number",
                            fillColor: Colors.white),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 40, 20, 0),
                      child: TextField(
                        controller: passwordController,
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            filled: true,
                            hintStyle: new TextStyle(color: Colors.grey[800]),
                            hintText: "Password",
                            errorText: _validPassword
                                ? null
                                : "Please enter valid password",
                            fillColor: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(20, 25, 20, 0),
                      child: !_showProgress
                          ? ButtonTheme(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 60.0,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () {
                                  mobile = mobileController.text.trim();
                                  password = passwordController.text.trim();

                                  if (mobile.isNotEmpty &&
                                      mobile.length == 10 &&
                                      password.isNotEmpty &&
                                      password.length > 1) {
                                    setState(() {
                                      _showProgress = true;
                                    });

                                    HTTPService()
                                        .loginUser(
                                            mobileNumber: mobile,
                                            password: password)
                                        .then((response) => {
                                              if (response.statusCode == 200)
                                                goToNextScreen(response)
                                              else
                                                showerrorDialog(response)
                                            });
                                  } else {
                                    setState(() {
                                      if (mobile.isEmpty || mobile.length != 10)
                                        _validMob = false;
                                      if (password.isEmpty ||
                                          password.length != 10)
                                        _validPassword = false;
                                    });
                                  }
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
                              text: 'Not registered yet?',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                    text: ' Register',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        onWillPop: onBackPressed);
  }

  goToNextScreen(Response response) async {
    var responseJSON = LoginResponseModel.fromJson(json.decode(response.body));
    setState(() {
      _showProgress = false;
    });

    if (responseJSON.status == true) {
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setString(Constants.SHARED_PREF_NAME, responseJSON.name);
      sharedPrefs.setString(Constants.SHARED_PREF_EMAIL, responseJSON.email);
      sharedPrefs.setString(Constants.SHARED_PREF_PASSWORD, password);
      sharedPrefs.setString(Constants.SHARED_PREF_MOBILE_NUMBER, mobile);
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
    var responseJSON = LoginResponseModel.fromJson(json.decode(response.body));
    setState(() {
      _showProgress = false;
    });

    _showMyDialog(responseJSON.message);
  }
}
