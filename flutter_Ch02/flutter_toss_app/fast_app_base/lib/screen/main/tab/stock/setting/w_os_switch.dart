import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OsSwitch extends StatelessWidget {
  final bool isOn;
  final void Function(bool isOn) onTap;

  const OsSwitch({super.key, required this.isOn, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoSwitch(
            value: isOn,
            onChanged: (value) => onTap(value),
          )
        : Switch(
            value: isOn,
            onChanged: (value) => onTap(value),
          );
  }
}
