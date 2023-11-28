import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/auth/domain/model/user_model.dart';
import '../../core.dart';

final loggedInProvider = ChangeNotifierProvider((ref) {
  return LoggedInNotifier(ref);
});

class LoggedInNotifier extends ChangeNotifier {
  final Ref ref;

  String _token = '';

  String get token => _token;

  UserModel get user => getUser();

  bool get loggedIn => token.isEmpty && user == UserModel.init() ? false : true;

  LoggedInNotifier(this.ref) {
    ref
        .watch(hiveProvider)
        .getCacheBox()
        .watch(key: AppStrings.token)
        .listen((event) {
      Logger.d('token: ${event.value}');
      if (event.key == AppStrings.token && !event.deleted) {
        _token = event.value ?? '';
      }
    });
  }

  void deleteAuthCache() {
    ref.read(hiveProvider).delete(AppStrings.token);
    ref.read(hiveProvider).delete(AppStrings.user);
    notifyListeners();
  }

  void updateAuthCache({String? token, UserModel? user}) {
    changeToken(token ?? "");
    changeSavedUser(user ?? UserModel.init());
    notifyListeners();
  }

  void changeToken(String token) {
    ref.read(hiveProvider).put(AppStrings.token, token);
    notifyListeners();
  }

  void changeSavedUser(UserModel user) {
    ref.read(hiveProvider).put(AppStrings.user, user.toJson());
    notifyListeners();
  }

  // String getToken() {
  //   final boxStream =
  //       ref.watch(hiveProvider).getCacheBox().watch(key: AppStrings.token);
  //   String data = boxStream.listen((event) {
  //     return event.value;
  //   }).toString();
  // }

  UserModel getUser() {
    return UserModel.fromJson(ref
        .watch(hiveProvider)
        .get(AppStrings.user, defaultValue: UserModel.init().toJson()));
  }
}
