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
        title: Text('다양한 Flutter의 입력 알아보기'),
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TestCheckBox(),
        TestRadioButton(),
        TestSlider(),
        TestSwitch(),
        TestPopupMenu(),
      ],
    );
  }
}

class TestCheckBox extends StatefulWidget {
  const TestCheckBox({super.key});

  @override
  State<TestCheckBox> createState() => _TestCheckBoxState();
}

class _TestCheckBoxState extends State<TestCheckBox> {
  late List<bool> values;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    values = [false, false, false];
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: values[0], onChanged: (value) => changeValue(0, value ?? false)),
        Checkbox(value: values[1], onChanged: (value) => changeValue(1, value ?? false)),
        Checkbox(value: values[2], onChanged: (value) => changeValue(2, value ?? false)),
      ],
    );
  }

  void changeValue(int index, bool value) {
    setState(() {
      values[index] = value;
    });
  }
}

enum TestValue {
  test1,
  test2,
  test3,
}

class TestRadioButton extends StatefulWidget {
  const TestRadioButton({super.key});

  @override
  State<TestRadioButton> createState() => _TestRadioButtonState();
}

class _TestRadioButtonState extends State<TestRadioButton> {
  TestValue? selectValue;

  @override
  Widget build(BuildContext context) {
    return RadioGroup<TestValue>(
      groupValue: selectValue,
      onChanged: (value) {
        setState(
          () => selectValue = value,
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: Radio(value: TestValue.test1),
            title: Text(TestValue.test1.name),
            onTap: () => setState(() {
              if (selectValue != TestValue.test1) {
                selectValue = TestValue.test1;
              }
            }),
          ),
          Radio(value: TestValue.test2),
          Radio(value: TestValue.test3),
        ],
      ),
    );
  }
}

class TestSlider extends StatefulWidget {
  const TestSlider({super.key});

  @override
  State<TestSlider> createState() => _TestSliderState();
}

class _TestSliderState extends State<TestSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('$value'),
        Slider(
          value: value,
          onChanged: (newValue) => setState(() => value = newValue),
          label: '$value',
          divisions: 100,
          activeColor: Colors.red,
        ),
      ],
    );
  }
}

class TestSwitch extends StatefulWidget {
  const TestSwitch({super.key});

  @override
  State<TestSwitch> createState() => _TestSwtichState();
}

class _TestSwtichState extends State<TestSwitch> {
  bool value = false;
  bool CupertinoValue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSwitch(value: CupertinoValue, onChanged: (newValue) => setState(() => CupertinoValue = newValue)),
        Switch(value: value, onChanged: (newValue) => setState(() => value = newValue)),
      ],
    );
  }
}

class TestPopupMenu extends StatefulWidget {
  const TestPopupMenu({super.key});

  @override
  State<TestPopupMenu> createState() => _TestPopupMenuState();
}

class _TestPopupMenuState extends State<TestPopupMenu> {
  TestValue selectValue = TestValue.test1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoContextMenu(
          actions: [
            CupertinoContextMenuAction(
              trailingIcon: CupertinoIcons.share,
              onPressed: () => Navigator.pop(context),
              child: Text('공유'),
            ),
            CupertinoContextMenuAction(
              trailingIcon: CupertinoIcons.heart,
              onPressed: () => Navigator.pop(context),
              child: Text('좋아요'),
            ),
            CupertinoContextMenuAction(
              isDestructiveAction: true,  // 빨간색
              trailingIcon: CupertinoIcons.delete,
              onPressed: () => Navigator.pop(context),
              child: Text('삭제'),
            ),
          ],
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
        Text(selectValue.name),
        PopupMenuButton(
          itemBuilder: (context) {
            return TestValue.values.map(
              (value) => PopupMenuItem(
                value: value,
                child: Text(value.name),
              ),
            ).toList();
          },
        onSelected: (newValue) => setState(() => selectValue = newValue),
        ),
      ],
    );
  }
}
