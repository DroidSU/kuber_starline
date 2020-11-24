import 'package:flutter/material.dart';
import 'package:kuber_starline/customs/wave_painter.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: WavePainter(),
      ),
    );
  }
}
