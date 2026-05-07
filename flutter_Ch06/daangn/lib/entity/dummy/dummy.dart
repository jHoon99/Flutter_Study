import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/entity/post/vo_product_post.dart';
import 'package:fast_app_base/entity/product/product_status.dart';
import 'package:fast_app_base/entity/product/vo_product.dart';
import 'package:fast_app_base/entity/user/vo_user.dart';

final user1 = User(
  id: 1,
  nickname: '홍길동',
  profileUrl: picSum(1010),
  temperature: 36.5,
);

final user2 = User(
  id: 2,
  nickname: '바디',
  profileUrl: picSum(900),
  temperature: 36.5,
);

final user3 = User(
  id: 3,
  nickname: '파도',
  profileUrl: picSum(700),
  temperature: 36.5,
);

final product1 = Product(
  user1,
  '아이폰17',
  700000,
  '깨끗하게 잘 쓰던 물건이에요.',
  ProductStatus.normal,
  [
    picSum(100),
    picSum(103),
    picSum(101),
  ],
);

final product2 = Product(
  user1,
  '아이폰12',
  660000,
  '잘 쓰던 물건이에요.',
  ProductStatus.booked,
  [
    picSum(120),
    picSum(103),
    picSum(121),
  ],
);

final product3 = Product(
  user1,
  '아이폰1',
  6600,
  '물건이에요.',
  ProductStatus.complete,
  [
    picSum(120),
    picSum(103),
    picSum(121),
  ],
);

final post1 = ProductPost(
  product1.user,
  product1,
  '글의 내용입니다.',
  '서울시 특별한 주소',
  3,
  2,
  DateTime.now().subtract(
    5.minutes,
  ),
);

final post2 = ProductPost(
  product2.user,
  product2,
  '글의 입니다.',
  '서울시 주소',
  30,
  20,
  DateTime.now().subtract(
    7.minutes,
  ),
);

final post3 = ProductPost(
  product3.user,
  product3,
  '글의 ㄱㄱ입니다.',
  '서울시 ㄱㄱ주소',
  303,
  203,
  DateTime.now().subtract(
    20.minutes,
  ),
);

final postList = [post1, post2, post3, post1, post2, post3];

String picSum(int id) {
  return 'https://picsum.photos/id/$id/200/200';
}
