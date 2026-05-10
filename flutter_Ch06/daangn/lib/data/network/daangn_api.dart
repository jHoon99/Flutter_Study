import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/data/network/result/api_error.dart';
import 'package:fast_app_base/data/simple_result.dart';
import 'package:fast_app_base/entity/dummy/notification_dummies.dart';
import 'package:fast_app_base/entity/notification/vo_notification.dart';
import 'package:fast_app_base/entity/post/vo_detail_product_post.dart';

import '../../entity/dummy/dummy.dart';

class DaangnApi {
  static Future<SimpleResult<List<DaangnNotification>, ApiError>> getNotification() async {
    await sleepAsync(500.ms);
    return SimpleResult.success(notificationdummyList);
  }

  static Future<SimpleResult<DetailProductPost, ApiError>> getPost(int id) async {
    await sleepAsync(500.ms);
    return SimpleResult.success(
      DetailProductPost(
        simple: post1,
        content: '깨끗하게 잘 쓰던 물건이에요.' '잘 쓰면 좋겠습니다. ' '감사합니다',
      ),
    );
  }
}
