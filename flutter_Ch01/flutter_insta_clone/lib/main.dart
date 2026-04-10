import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'body.dart';

void main() {
  runApp(
    MaterialApp(
      home: const InstaCloneHome(),
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.black,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.black,
        ),
      ),
    ),
  );
}

class InstaCloneHome extends StatefulWidget {
  const InstaCloneHome({super.key});

  @override
  State<InstaCloneHome> createState() => _InstaCloneHomeState();
}

class _InstaCloneHomeState extends State<InstaCloneHome> {
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0 ? AppBar(
        title: Text(
          'Instagram',
          style: GoogleFonts.lobsterTwo(fontSize: 32),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              print('Tab Favorite');
            },
            icon: Icon(
              Icons.favorite_border_outlined,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {
              print('Tab paperplane');
            },
            icon: Icon(
              CupertinoIcons.paperplane,
              size: 32,
            ),
          ),
        ],
      ) : null,
      body: InstaBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) => setState(() => index = newIndex),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 28,), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search, size: 28), label: 'Search'),
        ],
      ),
    );
  }
}
