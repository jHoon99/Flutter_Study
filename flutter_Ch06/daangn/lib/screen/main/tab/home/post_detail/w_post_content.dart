import 'package:fast_app_base/entity/post/vo_detail_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostContent extends HookConsumerWidget {
  final SimpleProductPost simpleProductPost;
  final DetailProductPost? detailProductPost;

  const PostContent({
    super.key,
    required this.simpleProductPost,
    this.detailProductPost,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Text(
            simpleProductPost.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(DateTime.now().toString()),
          if (detailProductPost == null) const Center(child: CircularProgressIndicator()),
          if (detailProductPost != null) Text(detailProductPost?.content ?? '존재 하지 않는 글입니다.')
        ],
      ),
    );
  }
}
