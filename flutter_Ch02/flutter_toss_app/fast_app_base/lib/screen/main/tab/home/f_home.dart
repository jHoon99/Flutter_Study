import 'dart:math';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/round_button_theme.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/common/widget/w_rounded_container.dart';
import 'package:fast_app_base/screen/dialog/d_message.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_account_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/s_number.dart';
import 'package:fast_app_base/screen/main/tab/home/w_bank_account.dart';
import 'package:fast_app_base/screen/main/tab/home/w_toss_app_bar.dart';
import 'package:fast_app_base/stream_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../common/widget/w_big_button.dart';
import '../../../dialog/d_color_bottom.dart';
import '../../../dialog/d_confirm.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  late final stream = countStream(5).asBroadcastStream();
  int count = 0;
  @override
  void initState() {
    countStream(5).listen((event) {
      setState(() {
        count = event;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          RefreshIndicator(
            edgeOffset: 60,
            onRefresh: () async {
              await sleepAsync(500.ms);
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 60,
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16,
              ),
              child: Column(
                spacing: 10,
                children: [
                  StreamBuilder(stream: stream, builder: (context, snapshot) {
                    final count = snapshot.data;
                    // if (count == null) {
                    //   return CircularProgressIndicator();
                    // }
                    // return Text(count.toString(), style: const TextStyle(fontSize: 30),);

                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                        return Text(count.toString());
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      case ConnectionState.done:
                        return const Text('완료');
                      case ConnectionState.none:
                      return const CircularProgressIndicator();

                    }
                  }),
                  StreamBuilder(stream: stream, builder: (context, snapshot) {
                    final count = snapshot.data;
                    // if (count == null) {
                    //   return CircularProgressIndicator();
                    // }
                    // return Text(count.toString(), style: const TextStyle(fontSize: 30),);

                    switch (snapshot.connectionState) {
                      case ConnectionState.active:
                        return Text(count.toString());
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      case ConnectionState.done:
                        return const Text('완료');
                      case ConnectionState.none:
                        return const CircularProgressIndicator();

                    }
                  }),
                  BigButton(
                    '토스뱅크',
                    onTap: () async {
                      print('start');
                      final result = await Nav.push(const NumberScreen());
                      print(result);
                      print('end');
                    },
                  ),
                  RoundedContainer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '자산',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      ...bankAccounts.map(
                        (e) => BankAccountWidget(account: e),
                      ),
                    ],
                  ))
                ],
              ).animate().slide(duration: 1000.ms).fadeIn(),
            ),
          ),
          const TossAppBar(),
        ],
      ),
    );
  }

  Stream<int> countStream(int max) async* {
    for (int i = 1; i <= max; i++) {
      await sleepAsync(1.seconds);
      yield i;
    }
  }

  void showSnackbar(BuildContext context) {
    context.showSnackbar('snackbar 입니다.',
        extraButton: Tap(
          onTap: () {
            context.showErrorSnackbar('error');
          },
          child: '에러 보여주기 버튼'.text.white.size(13).make().centered().pSymmetric(h: 10, v: 5),
        ));
  }

  Future<void> showConfirmDialog(BuildContext context) async {
    final confirmDialogResult = await ConfirmDialog(
      '오늘 기분이 좋나요?',
      buttonText: "네",
      cancelButtonText: "아니오",
    ).show();
    debugPrint(confirmDialogResult?.isSuccess.toString());

    confirmDialogResult?.runIfSuccess((data) {
      ColorBottomSheet(
        '❤️',
        context: context,
        backgroundColor: Colors.yellow.shade200,
      ).show();
    });

    confirmDialogResult?.runIfFailure((data) {
      ColorBottomSheet(
        '❤️힘내여',
        backgroundColor: Colors.yellow.shade300,
        textColor: Colors.redAccent,
      ).show();
    });
  }

  Future<void> showMessageDialog() async {
    final result = await MessageDialog("안녕하세요").show();
    debugPrint(result.toString());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
}
