import 'package:fast_app_base/screen/main/tab/home/banks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

final bankAccountShinhan1 = BankAccount(bankShinhan, 3000000, accountTypeName: '신한 주거래 우대통장(저축예금)');
final bankAccountShinhan2 = BankAccount(bankShinhan, 32000000, accountTypeName: '저축예금');
final bankAccountShinhan3 = BankAccount(bankShinhan, 302200000, accountTypeName: '저축예금');
final bankAccountToss = BankAccount(bankToss, 303300000);
final bankAccountKakao = BankAccount(bankKakao, 300005500, accountTypeName: '입출금통장');

// List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao,
];

// Map
// Set
main() {
  print(bankAccounts[1].accountTypeName);
}