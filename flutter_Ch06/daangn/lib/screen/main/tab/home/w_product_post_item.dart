import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../entity/post/vo_product_post.dart';

class ProductPostItem extends StatelessWidget {
  final ProductPost post;

  const ProductPostItem(this.post, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_image, const SizedBox(width: 8), _body(context)],
      ),
    );
  }

  Widget get _image {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: post.product.images[0],
        width: 80,
        height: 80,
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.content), // 제목
          _content(context), // 내용
          Text('${post.product.price}원'), // 가격
          _images // 좋아요, 채팅
        ],
      ),
    );
  }

  Widget _content(BuildContext context) {
    return Row(
      spacing: 2,
      children: [
        Text(post.address, style: const TextStyle(color: Colors.grey)),
        const Text('⭐️'),
        Text(
          timeago.format(
            post.createdTime,
            locale: context.locale.languageCode,
          ),
        )
      ],
    );
  }

  Widget get _images {
    return Row(
      children: [
        const Spacer(),
        Image.asset('$basePath/home/post_comment.png'),
        Text(post.chatCount.toString()),
        const SizedBox(width: 10),
        Image.asset(
          '$basePath/home/post_heart_off.png',
        ),
        Text(post.likeCount.toString())
      ],
    );
  }
}
