import 'package:fast_app_base/data/network/daangn_api.dart';
import 'package:fast_app_base/entity/post/vo_detail_product_post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_post_provider.g.dart';

@riverpod
class PostDetail extends _$PostDetail {
  @override
  Future<DetailProductPost> build({required int postId}) async {
    final result = await DaangnApi.getPost(postId);
    return result;
  }
}
