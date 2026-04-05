import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcom new Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.pop(),
          child: Text('Go to Back'),
        ),
      ),
    );
  }
}
