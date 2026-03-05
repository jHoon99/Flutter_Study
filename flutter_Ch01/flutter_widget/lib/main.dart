import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Study to Container')),
        body: CustomContainer(),
      ),
    ),
  );
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Colors.pink.shade50,
          border: Border.all(color: Colors.red, width: 5, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.black, offset: Offset(6, 6))
          ],
        ),
        child: Center(
          child: Container(
            color: Colors.yellow,
            padding: EdgeInsets.symmetric(horizontal: 20),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text('Hello Container'),
          ),
        ),
      ),
    );
  }
}
