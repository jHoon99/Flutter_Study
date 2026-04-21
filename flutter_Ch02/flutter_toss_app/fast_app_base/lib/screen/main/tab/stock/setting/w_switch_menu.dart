import 'package:fast_app_base/screen/main/tab/stock/setting/w_os_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchMenu extends StatelessWidget {
  final String text;
  final bool isOn;
  final void Function(bool isOn) onTap;

  const SwitchMenu(
    this.text,
    this.isOn, {
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(text, style: const TextStyle(fontWeight: FontWeight.bold),),
      const Spacer(),
      OsSwitch(isOn: isOn, onTap: (value) => onTap(value))
    ],);
  }
}
