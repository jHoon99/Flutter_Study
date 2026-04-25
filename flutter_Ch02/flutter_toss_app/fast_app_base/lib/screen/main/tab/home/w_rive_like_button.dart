import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveLikeButton extends StatefulWidget {
  const RiveLikeButton({super.key});

  @override
  State<RiveLikeButton> createState() => _RiveLikeButtonState();
}

class _RiveLikeButtonState extends State<RiveLikeButton> {
  late File file;
  late RiveWidgetController controller;
  bool isinitialized = false;

  @override
  void initState() {
    super.initState();
    initRive();
  }

  void initRive() async {
    file = (await File.asset('assets/rive/light-like.riv', riveFactory: Factory.rive))!;
    controller = RiveWidgetController(file);
    setState(() => isinitialized = true);
  }

  @override
  void dispose() {
    file.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isinitialized) return const SizedBox();
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: 50,
        height: 50,
        child: RiveWidget(
          controller: controller,
          fit: Fit.fill,
        ),
      ),
    );
  }
}
