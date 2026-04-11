import 'package:flutter/material.dart';

import 'screen/home_screen.dart';
import 'screen/search_screen.dart';

class InstaBody extends StatelessWidget {
  final int index;

  const InstaBody({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const HomeScreen();
    }
    return const SearchScreen();
  }
}


