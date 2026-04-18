import 'package:fast_app_base/common/cli_common.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';

import '../../common/util/async/flutter_async.dart';
import '../main/s_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      delay(() {
        Nav.push(const MainScreen());
      }, 3000.ms);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/image/splash/splash.png',
        width: 192,
        height: 192,
      ),
    );
  }
}
