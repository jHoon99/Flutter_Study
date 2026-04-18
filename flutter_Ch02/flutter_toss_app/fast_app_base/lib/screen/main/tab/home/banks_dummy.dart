import 'package:fast_app_base/common/constants.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank.dart';

const baseShinhan = '$basePath/bank/bank_shinhan.png';
const baseKakao = '$basePath/bank/bank_kakao.png';
const baseToss = '$basePath/bank/bank_toss.png';

final bankShinhan = Bank('신한은행', '$baseShinhan');
final bankKakao = Bank('카카오뱅크', '$baseKakao');
final bankToss = Bank('토스뱅크', '$baseToss');