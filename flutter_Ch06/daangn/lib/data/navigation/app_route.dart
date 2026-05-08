import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  home('/'),
  localLife('/local-life'),
  nearMe('/near_me'),
  chat('/chat'),
  my('/my'),



  // home
  notification('notification'),

  // localLife

  // nearMe

  // chat

  // My

  ;
  final String path;
  const AppRoute(this.path);
}

extension AppRouteView on BuildContext {
  void pushNotification() => push('/notification');
}