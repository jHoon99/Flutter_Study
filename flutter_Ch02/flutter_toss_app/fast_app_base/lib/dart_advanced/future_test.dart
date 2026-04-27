import 'dart:async';
import 'dart:math';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccounts = [
  BankAccount(Bank('신한', ''), 3000000, accountTypeName: '신한 주거래 우대통장'),
  BankAccount(Bank('토스', ''), 303300000),
  BankAccount(Bank('카카오', ''), 300005500, accountTypeName: '입출금통장'),
];

void main() async {
  // Future의 기본 개념
  /// Future == 미래
  /// 시간이 걸리는 Computation 작업 또는 유저의 응답을 기다려야 되는 상태

  // Future의 생성과 수행
  print('Start');
  final account = await getBankAccounts();
  print(account.toString());
  print('End');

  // Future Timeout
  /// 특정 시간이 지났음에도 동작하지 않았을떄.
  final result = await getBankAccounts().timeout(1.seconds);

  // Future Error handling
  /// then + catchError 조합도 있음.
  print('Start');
  try {
    final result = await getBankAccounts().timeout(1.seconds);
    print(result.toString());
  } catch (e) {
    print(e);
  }
  print('End');

  // FutureOr
  /// 동기 or 비동기
  /// 알아서 처리되고 패키지에서 콜백 타입 지정할 때 많이 쓴다고함.
  /// 라이브러리/프레임워크 제작 시 유용한 패턴
  /// 앱 코드에서는 직접 쓸 일은 많지 않다고 한다.
}

abstract class DoWorkInterface {
  FutureOr<String> doWork();
}

class SyncWork extends DoWorkInterface {
  @override
  String doWork() {
    return '';
  }
}

class AsyncWork extends DoWorkInterface {
  @override
  Future<String> doWork() async {
    return '';
  }
}

Future<List<BankAccount>> getBankAccounts() async {
  await sleepAsync(2.seconds);
  return bankAccounts;
}
