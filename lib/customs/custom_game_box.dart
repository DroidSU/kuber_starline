import 'package:flutter/material.dart';

import 'custom_inc_dec_textfield.dart';

class CustomGameBox extends StatefulWidget {
  final String seriesName;
  final List<int> listOfNumbers;

  CustomGameBox({@required this.seriesName, @required this.listOfNumbers});

  @override
  _CustomGameBoxState createState() => _CustomGameBoxState();
}

class _CustomGameBoxState extends State<CustomGameBox> {
  String seriesName;
  List<int> listOfNumbers = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seriesName = widget.seriesName;
    listOfNumbers = widget.listOfNumbers;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Text(
            seriesName,
            style: TextStyle(color: Colors.white, fontSize: 22),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
            itemCount: listOfNumbers.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 4 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 15),
            itemBuilder: (BuildContext buildcontext, index) {
              return CustomTextField(
                boxValue: listOfNumbers[index],
                onAmountValueChanged: (value) {
                  // valueMap[index] = int.parse(value);
                  // int currentPoint = 0;
                  //
                  // for (int i = 0; i < valueMap.length; i++) {
                  //   currentPoint += valueMap[i];
                  // }
                  //
                  // setState(() {
                  //   totalPoints = currentPoint;
                  // });
                },
              );
            }),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
