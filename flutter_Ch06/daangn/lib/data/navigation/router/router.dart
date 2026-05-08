import 'package:fast_app_base/data/navigation/router/home_branch.dart';
import 'package:fast_app_base/data/navigation/router/local_life_branch.dart';
import 'package:fast_app_base/data/navigation/router/near_me_branch.dart';
import 'package:fast_app_base/screen/main/s_main.dart';
import 'package:go_router/go_router.dart';

import 'chat_branch.dart';
import 'my_branch.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (_, __, navigationShell) => MainScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        homeBranch,
        localLifeBranch,
        nearMeBranch,
        chatBranch,
        myBranch,
      ],
    )
  ],
);
