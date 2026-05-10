import 'package:freezed_annotation/freezed_annotation.dart';

import '../product/vo_product.dart';
import '../user/vo_user.dart';

part 'vo_simple_product_post.freezed.dart';

@freezed
abstract class SimpleProductPost with _$SimpleProductPost {
  const factory SimpleProductPost(
    final User user,
    final Product product,
    final String title,
    final String address,
    final int chatCount,
    final int likeCount,
    final DateTime createdTime,
  ) = _SimpleProductPost;
}
