import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample_flutter/rabbit.dart';

class StatefulSampleWidget extends StatefulWidget {
  String title;
  int value;
  Rabbit rabbit;

  StatefulSampleWidget(this.title, this.value, this.rabbit);

  _StatefulSampleWidgetState createState() => _StatefulSampleWidgetState();
}

class _StatefulSampleWidgetState extends State<StatefulSampleWidget> {
  bool stateBool = false;

  @override
  void initState() {
    //state값을 초기값
    super.initState();
    print("initState");
    //print(MediaQuery.of(context).size);//오류떠
    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   int index = timer.tick % 4;
    //   setState(() {
    //     switch (index) {
    //       case 0:
    //         widget.rabbit.updateState(RabbitState.SLEEP);
    //         break;
    //       case 1:
    //         widget.rabbit.updateState(RabbitState.WALK);
    //         break;
    //       case 2:
    //         widget.rabbit.updateState(RabbitState.RUM);
    //         break;
    //       case 3:
    //         widget.rabbit.updateState(RabbitState.EAT);
    //         break;
    //     }
    //     print(widget.rabbit.state);
    //   });
    // });
  }
@override//영구적으로 삭제해줄때 메모리 누스를 막는 역할 함
  void dispose() {

    super.dispose();
  }
//context에 접근 하는 단계
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print(MediaQuery.of(context).size);
    print("나는 둘째");
  }

  @override
  void setState(VoidCallback fn) {
    if(mounted) super.setState(fn);
  }

  @override//변경이 된 나자신을 비교하여 변경되었는지 변경되었으면 추가 로직을 넣음.
  void didUpdateWidget(covariant StatefulSampleWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("oldWidget : ${oldWidget.value}<>this widgetvalue:${widget.value}");
    if(oldWidget.value != widget.value) {
      print("뉴 패션");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("쥬드 쥬드 젖젖");
    return Scaffold(
      appBar: AppBar(title: Text("뽕댕이")),
      body: Container(
        child: Center(
          child: Text(widget.rabbit.state.toString(),
              style: TextStyle(fontSize: 20)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            stateBool = !stateBool;
          });
        },
        child: Text("button"),
      ),
    );
  }
}
