import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/auth/domain/model/user_model.dart';
import '../../core.dart';



final loggedInProvider = ChangeNotifierProvider((ref) {
  return LoggedInNotifier(ref);
});

class LoggedInNotifier extends ChangeNotifier {
  final Ref ref;

  String get token => getToken();

  UserModel get user => getUser();

  bool get loggedIn => token.isEmpty && user == UserModel.init() ? false : true;

  LoggedInNotifier(this.ref) : super();

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

  String getToken() {
    return ref.watch(hiveProvider).get(AppStrings.token, defaultValue: '');
  }

  UserModel getUser() {
    return UserModel.fromJson(ref
        .watch(hiveProvider)
        .get(AppStrings.user, defaultValue: UserModel.init().toJson()));
  }
}
