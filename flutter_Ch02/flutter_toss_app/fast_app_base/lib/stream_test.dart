import 'dart:async';
import 'dart:math';

import 'common/dart/extension/num_duration_extension.dart';
import 'common/util/async/cli_async.dart';

void main() {
  // Stream 기본 개념
  /// Future - 1번의 데이터를 가져옴. (요청 후 한 번)
  /// Stream - 여러번의 데이터를 받을 수 있음. (관계를 맺어 지속적으로 받을 수 있음)

  // Stream 생성과 수행
  /// 1. async*
  /// 2. streamController 연동
  // countStream(10).listen((event) {
  //   print(event);
  // });

  final controller = StreamController<int>();
  final stream = controller.stream;

  stream.listen((event) {
    print(event);
  });

  addDataToTheSink(controller);

  // Stream 데이터 관찰

  // Stream 데이터 변환
  countStream(4).map((e) => '$e 초가 지났습니다.').listen((e) {
    print(e);
  });

  // 위젯에서 Stream Data 표현하기
  /// f.home.dart

  // Stream 데이터 관찰2 - BroadcastStream
  final broadCastStream = countStream(4).asBroadcastStream();
  broadCastStream.listen((event) {
    print(event);
  });

  Future.delayed(2.seconds, () {
    broadCastStream.listen((event) {
      print('방송 2초 후: $event');
    });
  });

  // 2개의 위젯에서 하나의 BroadcastStream Data 표현하기
  /// f.home.dart

  // Stream Error Handling
  countStream(5).handleError((e) {
    print(e);
  }).listen((e) {
    print(e);
  });
}

Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await sleepAsync(1.seconds);
    yield i;
  }
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    await sleepAsync(1.seconds);
    controller.sink.add(i);
  }
}
