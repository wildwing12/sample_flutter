import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_flutter/rabbit.dart';
import 'package:sample_flutter/stateful_sample_widget.dart';
import 'package:sample_flutter/stateless_sample_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
// This widget is the root of your application.
}
class _MyAppState extends State<MyApp>{
  int value = 0;
  @override
  void initState() {
    value = 0;
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        value++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: StatelessSample(
      //   "구멍이 없는 박스 로 실험하는 토끼",
      //   Rabbit("뽕쟁이 쥬드", RabbitState.SLEEP),
      // ),
      home: value > 10 ? Container()
          :StatefulSampleWidget(
        "구멍이 있는 박스 로 실험하는 토끼",
        value,
        Rabbit("뽕쟁이 쥬드", RabbitState.EAT),
      ),
    );
  }
}
