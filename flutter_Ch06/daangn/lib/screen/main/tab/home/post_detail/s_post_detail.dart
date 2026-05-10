import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_round_button.dart';
import 'package:fast_app_base/entity/post/vo_detail_product_post.dart';
import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/provider/product_post_provider.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/w_post_content.dart';
import 'package:fast_app_base/screen/main/tab/home/post_detail/w_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../entity/product/vo_product.dart';

class PostDetailScreen extends HookConsumerWidget {
  final int id;
  final SimpleProductPost? simpleProductPost;

  const PostDetailScreen({
    required this.id,
    required this.simpleProductPost,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(postDetailProvider(postId: id));

    return Scaffold(
      body: post.when(
        data: (data) => _PostDetail(data.simple, productPost: data),
        error: (error, trace) => const Text('에러 발생'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class _PostDetail extends HookConsumerWidget {
  final SimpleProductPost simpleProductPost;
  final DetailProductPost? productPost;

  static const bottomMenuHeight = 180.0;

  const _PostDetail(this.simpleProductPost, {this.productPost, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();

    return Stack(
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: bottomMenuHeight),
            child: Column(
              children: [
                _Image(
                  pageController: pageController,
                  simpleProductPost: simpleProductPost,
                ),
                UserProfileWidget(simpleProductPost.product.user),
                PostContent(
                  simpleProductPost: simpleProductPost,
                  detailProductPost: productPost,
                )
              ],
            ),
          ),
        ),
        const _AppBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: PostDetailBottomMenu(product: simpleProductPost.product),
        )
      ],
    );
  }
}

class PostDetailBottomMenu extends StatelessWidget {
  final Product product;

  const PostDetailBottomMenu({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.backgroundColor,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Line(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Row(
              spacing: 20,
              children: [
                Image.asset('$basePath/detail/heart_on.png', width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          product.price.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const Text(
                      '가격 제안하기',
                      style: TextStyle(textBaseline: TextBaseline.alphabetic),
                    )
                  ],
                ),
                const Spacer(),
                RoundButton(
                  text: '채팅하기',
                  onTap: () {},
                  bgColor: Colors.orange,
                  borderRadius: 7,
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    super.key,
    required this.pageController,
    required this.simpleProductPost,
  });

  final PageController pageController;
  final SimpleProductPost simpleProductPost;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.deviceWidth,
      width: context.deviceWidth,
      child: Stack(children: [
        PageView(
          controller: pageController,
          children: simpleProductPost.product.images
              .map(
                (url) => CachedNetworkImage(
                  imageUrl: url,
                  fit: BoxFit.fill,
                ),
              )
              .toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SmoothPageIndicator(
            controller: pageController, // PageController
            count: simpleProductPost.product.images.length,
            effect: const JumpingDotEffect(
              verticalOffset: 10,
              dotColor: Colors.white54,
              activeDotColor: Colors.black,
            ), // your preferred effect
            onDotClicked: (index) {},
          ),
        )
      ]),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60 + context.statusBarHeight,
      child: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
