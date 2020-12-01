import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final int boxValue;
  final Function(String) onAmountValueChanged;

  CustomTextField({@required this.boxValue, this.onAmountValueChanged});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  int boxValue;

  String amountPlaced;
  TextEditingController textEditingController;

  Function(String) onValueChanged;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    boxValue = widget.boxValue;
    onValueChanged = widget.onAmountValueChanged;

    textEditingController = new TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textEditingController.dispose();
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
            controller: textEditingController,
            style: TextStyle(color: Colors.black, fontSize: 16),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLines: 1,
            onChanged: (value) {
              if (value.isEmpty) value = '0';
              onValueChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
