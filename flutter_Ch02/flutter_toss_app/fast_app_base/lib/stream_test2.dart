import 'dart:io';

import 'package:fast_app_base/common/cli_common.dart';

void main() async {
  /// List와 Iterable
  final List list = ['blue', 'yellow', 'red'];
  final iterator = list.iterator;
  print(iterator.current);
  while (iterator.moveNext()) {
    print(iterator.current);
  }
  /// sync*로 Iterable 만들기
  for (final message in countIterable(5)) {
    print(message);
  }
  // await for (final message in countStream(5)) {
  //   print(message);
  // }
  /// async*로 Stream 만들기
  /// yield*를 통해서 Iterable & Stream 연장 시키기
}

Iterable<String> countIterable(int max) sync* {
  for (int i = 1; i <= max; i++) {
    sleep(1.seconds); // 예제기 떄문에 쓰지만 실제로는 쓰면 안된다. 메인 스레드 자체가 멈춰버림.
    yield i.toString();
  }
  yield '새해 복 많이 받으세요';
  // yield* ['1', '2', '3', '4', '5'];
  yield* countIterable(max);
}

/// Generator 라고 함.
/// 데이터를 생산하거나 일련의 작업들을 수행할 때 유용함.

Stream<String> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await sleepAsync(1.seconds);
    yield i.toString();
  }
  yield '새해 복 많이 받으세요.';
  yield* countStream(to);
}