import 'package:fast_app_base/screen/main/tab/stock/setting/w_switch_menu.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isPushOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: ListView(
        children: [
          //switch
          SwitchMenu(
            '푸시 설정',
            isPushOn,
            onTap: (isOn) => setState(() => isPushOn = isOn),
          )
          //slider
          //date time
          //number dialog
        ],
      ),
    );
  }
}
