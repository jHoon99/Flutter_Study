import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User(
    final String nickname,
    final double temperature,
    final int id,
  ) = _User;
}
