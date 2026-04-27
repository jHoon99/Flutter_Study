import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../screen/main/tab/home/bank_account_dummy.dart';

main() {
  // Functional Programming

  // 프로그래밍 방법을 부르는 이름들

  // 절차적 프로그래밍 - 명령형 프로그래밍
  /// 보일러 플레이트 코드 발생 확률 높음.
  final accounts = getAccounts();
  final list = <String>[];
  for (final account in accounts) {
    final user = getUser(account.accountTypeName as int);
    list.add(user.name);
  }
  print(list);

  // 함수형 프로그래밍 - 선언형 프로그래밍
}

List<BankAccount> getAccounts() {
  return bankAccounts;
}

class User {
  final int id;
  final String name;

  User(this.id, this.name);
}

User getUser(int id) {
  return switch (id) {
    1 => User(id, '김철수'),
    2 => User(id, '이영희'),
    3 => User(id, 'Baby'),
    4 => User(id, 'Love'),
    5 => User(id, 'Popcorn'),
    _ => throw Exception('존재하지 않는 유저입니다.'),
  };
}
