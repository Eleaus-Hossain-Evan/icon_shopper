import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../features/auth/domain/model/user_model.dart';
import '../../core.dart';

final loggedInProvider = ChangeNotifierProvider((ref) {
  return LoggedInNotifier(ref);
}, name: "loggedInProvider");

class LoggedInNotifier extends ChangeNotifier {
  LoggedInNotifier(this.ref);
  final Ref ref;

  String _token = '';
  UserModel _user = UserModel.init();

  String get token => _token;
  UserModel get user => _user;

  bool get loggedIn => _token.isNotEmpty;

  void deleteAuthCache() {
    ref.read(hiveProvider).delete(AppStrings.token);
    ref.read(hiveProvider).delete(AppStrings.user);

    updateAuthCache();
  }

  void updateAuthCache({String? token, UserModel? user}) {
    changeToken(token ?? "");
    changeSavedUser(user ?? UserModel.init());
  }

  void changeToken(String token) {
    ref.read(hiveProvider).put(AppStrings.token, token);
    setToken(token);
  }

  void changeSavedUser(UserModel user) {
    ref.read(hiveProvider).put(AppStrings.user, user.toJson());
    setUser(user);
  }

  void setToken(String token) {
    _token = token;
    notifyListeners();
  }

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
