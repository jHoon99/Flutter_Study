void main() {
  for (int i = 0; i < 10; i++) {
    print('running for Index $i');
  }

  List<int> indexs = [0, 1, 2, 3, 4, 5];

  for (int i in indexs) {
    print('running for Index $i');
  }

  bool isRunning = true;

  int count = 0;

  while (isRunning) {
    if (count >= 5) {
      isRunning = false;
    }
    count++;
    print('While is Runnng');
  }

  Future<void> todo(int second) async {
    await Future.delayed(Duration(seconds: second));
    print('Todo Done in $second seconds');
  }

  todo(1);
  todo(2);
  todo(3);
  todo(4);
  todo(5);

  Stream<int> todo1() async* {
    int counter = 0;

    while (counter <= 10) {
      counter++;
      await Future.delayed(Duration(seconds: 1));
      print('Todo is Runnung $counter');
      yield counter;
    }

    print("Todo is Done");
  }

  todo1();
}
