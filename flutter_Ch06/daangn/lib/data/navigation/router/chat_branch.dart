import 'package:fast_app_base/screen/main/tab/chat/f_chat.dart';
import 'package:go_router/go_router.dart';

import '../app_route.dart';

final chatBranch = StatefulShellBranch(routes: [
  GoRoute(
      path: AppRoute.chat.path,
      builder: (_, __) => const ChatFragment()
  ),
]);
