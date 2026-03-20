import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget을 겹겹히 쌓아 배치하기'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 500,
          height: 500,
          color: Colors.black,
        ),
        Container(
          width: 400,
          height: 400,
          color: Colors.red,
        ),
        Container(
          width: 300,
          height: 300,
          color: Colors.blue,
        ),
        Align( // + Positioned 도 있음, Align은 위젯의 기본 위치를 벗어나서 배치 가능
          alignment: Alignment.topRight,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
            margin: EdgeInsets.only(left: 50),
          ),
        ),
      ],
    );
  }
}
