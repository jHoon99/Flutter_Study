import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_detail_product_post.freezed.dart';

@freezed
abstract class DetailProductPost with _$DetailProductPost {
  const factory DetailProductPost({
    required SimpleProductPost simple,
    required String content,
  }) = _DetailProductPost;
}
