import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:kuber_starline/constants/project_constants.dart';
import 'package:kuber_starline/network/HTTPService.dart';
import 'package:kuber_starline/network/models/password_change_response_model.dart';
import 'package:kuber_starline/ui/DrawerScreen.dart';
import 'package:kuber_starline/ui/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDrawerOpen = false;

  String name = "";
  String email = "";
  String mobileNumber = "";
  String authToken = "";
  String oldPassword = "";
  String newPassword = "";
  String confirmPassword = "";

  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;

  bool _showPasswordChangeProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerScreen(),
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.red,
          shadowColor: Colors.red[300],
          title: Text(
            'Settings',
            style: TextStyle(color: Colors.red, fontSize: 18),
          ),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 24,
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Settings',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'User Name',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                          name,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 18,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Registered Email',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Card(
                          elevation: 10,
                          shadowColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70, width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                filled: true,
                                hintStyle:
                                    new TextStyle(color: Colors.grey[800]),
                                hintText: "Registered Email",
                                // errorText: _validMobile
                                //     ? null
                                //     : "Please enter valid mobile number",
                                fillColor: Colors.white),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                          ),
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        '${oldPassword.replaceAll(RegExp(r"."), "*")}',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 10,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              obscureText: true,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  filled: true,
                                  hintStyle: new TextStyle(color: Colors.grey),
                                  hintText: "New Password",
                                  // errorText: _validMobile
                                  //     ? null
                                  //     : "Please enter valid mobile number",
                                  fillColor: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            elevation: 10,
                            shadowColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white70, width: 1),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              obscureText: true,
                              decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  filled: true,
                                  hintStyle: new TextStyle(color: Colors.grey),
                                  hintText: "Confirm Password",
                                  // errorText: _validMobile
                                  //     ? null
                                  //     : "Please enter valid mobile number",
                                  fillColor: Colors.white),
                              keyboardType: TextInputType.visiblePassword,
                              controller: confirmPasswordController,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Align(
                      child: !_showPasswordChangeProgress
                          ? RaisedButton(
                              onPressed: () {
                                setState(() {
                                  _showPasswordChangeProgress = true;
                                });
                                changePassword();
                              },
                              color: Colors.blue,
                              padding: EdgeInsets.all(2),
                              child: Text(
                                'Change',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : CircularProgressIndicator(),
                      alignment: Alignment.center,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void getUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPreferences.getString(Constants.SHARED_PREF_NAME);
      email = sharedPreferences.getString(Constants.SHARED_PREF_EMAIL);
      mobileNumber =
          sharedPreferences.getString(Constants.SHARED_PREF_MOBILE_NUMBER);
      oldPassword = sharedPreferences.getString(Constants.SHARED_PREF_PASSWORD);
      authToken = sharedPreferences.getString(Constants.SHARED_PREF_AUTH_TOKEN);

      emailController.text = email;
    });
  }

  void changePassword() async {
    newPassword = passwordController.text.trim();
    confirmPassword = confirmPasswordController.text.trim();

    if (newPassword != null &&
        newPassword.isNotEmpty &&
        newPassword == confirmPassword) {
      HTTPService()
          .changePassword(authToken, newPassword)
          .then((response) => {parseChangePasswordResult(response)});
    } else {
      setState(() {
        _showPasswordChangeProgress = false;
      });
    }
  }

  void parseChangePasswordResult(Response response) async {
    if (response.statusCode == 200) {
      var responseJSON =
          PasswordChangeResponseModel.fromJson(json.decode(response.body));

      if (responseJSON.status) {
        logoutUser();
      } else {
        setState(() {
          _showPasswordChangeProgress = false;
        });
      }
    } else {
      setState(() {
        _showPasswordChangeProgress = false;
      });
    }
  }

  void logoutUser() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.clear();

    Navigator.of(context).pushReplacement(new PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ));
  }
}
