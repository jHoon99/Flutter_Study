import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../entity/user/vo_user.dart';

class UserProfileWidget extends HookConsumerWidget {
  final User user;
  final String address = '서둔동 433';

  const UserProfileWidget(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        spacing: 10,
        children: [
          _profileImage,
          _userTitle,
          const Spacer(),
          _temperature
        ],
      ),
    );
  }

  Widget get _profileImage {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: user.profileUrl,
        width: 40,
      ),
    );
  }

  Widget get _userTitle {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(user.nickname),
        Text(address, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget get _temperature {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            Text(
              '${user.temperature}🌡️',
              style: const TextStyle(color: Colors.green),
            ),
            Image.asset('$basePath/detail/smile.png', width: 20)
          ],
        ),
        const SizedBox(
          width: 60,
          child: LinearProgressIndicator(
            value: 0.5,
            color: Colors.green,
          ),
        ),
        const Text(
          '매너온도',
          style: TextStyle(color: Colors.grey, fontSize: 10),
        )
      ],
    );
  }
}
