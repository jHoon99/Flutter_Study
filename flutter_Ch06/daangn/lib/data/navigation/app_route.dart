import 'package:fast_app_base/entity/post/vo_simple_product_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  // 탭
  home('/'),
  localLife('/local-life'),
  nearMe('/near_me'),
  chat('/chat'),
  my('/my'),

  // 전체 화면
  notification('/notification'),
  postDetail('/post-detail/:id'),
  ;

  final String path;
  const AppRoute(this.path);
}

extension AppRouteView on BuildContext {
  void pushNotification() => push('/notification');
  void pushPostDetail(int id, SimpleProductPost post) {
    push('/post-detail/$id', extra: post);
  }
}
