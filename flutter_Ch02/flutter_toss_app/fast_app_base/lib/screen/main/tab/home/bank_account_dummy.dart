import 'dart:collection';

import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:rive/rive.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bankShinhan, 32000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bankShinhan, 302200000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(bankToss, 303300000);
final bankAccountKakao = BankAccount(bankKakao, 300005500, accountTypeName: '입출금통장');

// List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountToss,
  bankAccountShinhan1,
  bankAccountShinhan1,
  bankAccountToss,
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountKakao,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];

// Map
final bankAccountMap = {'shinhan1': bankAccountShinhan1, 'shinhan2': bankAccountShinhan2};

// Set
final bankAccountSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
};

abstract class Animal {
  void eat() {}
}

class Dog extends Animal {
  @override
  void eat() {
    print('dog eat');
  }
}

class Tiger extends Animal {
  void eat() {}
}

class Cat extends Animal {
  void eat() {}
}

// 제네릭
class Result<T, Fail> {
  final T data;
  final Fail failData;

  Result(this.data, {required this.failData});
}

Result<String, RiveFailed> doTheWork() {
  return Result('success', failData: RiveFailed(Stream.error('error')));
}

// Result<int> doInt() {
//   return Result(1);
// }

main() {
  // final dog1 = Dog();
  // final dog2 = Dog();
  // final dog3 = Dog();
  // final dog4 = Dog();
  //
  // final cat1 = Cat();
  // final cat2 = Cat();
  // final cat3 = Cat();
  //
  // final list = [dog1, dog2, dog3, dog4, cat1, cat2, cat3];
  // for (final animal in list) {
  //   // animal.eat(); 이렇게는 타입이 섞여있어서 list의 타입이 분명하지 않기때문에(Object) 불가능.
  //   if(animal is Dog) { // 이렇게 짰다가 다른 Cat이나 Dog에 다른 객체가 들어간다면 오류를 잡기 힘들다.
  //     animal.eat();
  //   } else if(animal is Cat) {
  //     animal.eat();
  //   }
  // }

  // 삽입
  bankAccounts.insert(1, bankAccountKakao);

  // 위치이동
  final temp = bankAccounts.removeAt(4);
  bankAccounts.insert(0, temp);

  // 교환
  // final temp1 = bankAccounts.last;
  // bankAccounts[5] = bankAccounts[0];
  // bankAccounts[0] = temp1;
  bankAccounts.swap(5, 0); // 함수로 분리

  // 변환
  final _ = bankAccounts.map((e) => e.bank).toList();

  for(final account in bankAccounts) {
    print(account.toString());
    print(account.accountTypeName);
  }

  // Map
  final map = HashMap<String, BankAccount>();
  map['toss'] = bankAccountToss;
  map['shinhan1'] = bankAccountShinhan1;
  if(map.containsKey('shinhan1')) {
    map['shinhan2'] = bankAccountShinhan2;
  }

  final tossAccount = map['toss'];

  // 생성
  final list = [];
  final set = {bankAccountShinhan1, bankAccountShinhan2};
  final map = {'shinhan1': bankAccountShinhan1};


  // 제네릭
}

extension ListExtension on List {
  void swap(int origin, int target) {
    final temp1 = this[target];
    this[target] = this[origin];
    this[origin] = temp1;
  }
}
