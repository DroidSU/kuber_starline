import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  int boxValue;

  CustomTextField({@required this.boxValue});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  int boxValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxValue = widget.boxValue;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.redAccent,
          height: 30,
          width: 40,
          alignment: Alignment.center,
          child: Text(
            boxValue.toString(),
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Container(
          color: Colors.white,
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
          height: 30,
          width: 60,
          child: TextField(
            style: TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
