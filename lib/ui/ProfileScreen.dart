import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.red,
            automaticallyImplyLeading: true,
            elevation: 8,
            centerTitle: true,
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5,
                color: Colors.white,
                shadowColor: Colors.grey,
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  height: 100,
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.account_circle_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'User Email:   user@email.com',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mobile_friendly_rounded,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Mobile Number:  0000000000',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                elevation: 5,
                color: Colors.white,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/ic_address.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add Bank Detail',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                elevation: 5,
                color: Colors.white,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/ic_address.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add Address Detail',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                elevation: 5,
                color: Colors.white,
                shadowColor: Colors.grey,
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/ic_address.png',
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add Paytm Detail',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      )
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
