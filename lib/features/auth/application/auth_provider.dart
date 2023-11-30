import 'dart:io';

// ignore: unused_import
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/auth/application/auth_state.dart';
import 'package:icon_shopper/features/auth/domain/signup_body.dart';
import 'package:icon_shopper/features/auth/infastructure/auth_repo.dart';
import 'package:mime/mime.dart';

import '../../profile/domain/change_password_body.dart';
import '../domain/model/user_model.dart';
import '../../profile/domain/profile_update_body.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref, AuthRepo());
}, name: "authProvider");

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref ref;
  final AuthRepo repo;
  AuthNotifier(this.ref, this.repo) : super(AuthState.init());

  Future<void> login({required String phone, required String password}) async {
    state = state.copyWith(loading: true);

    final result = await repo.login(
      phone: phone,
      password: password,
    );
    state = result.fold((l) {
      showErrorToast(l.error.message);
      return state.copyWith(loading: false);
    }, (r) {
      showToast(r.message);
      ref
          .read(loggedInProvider.notifier)
          .updateAuthCache(token: r.token, user: r.user);
      NetworkHandler.instance.setToken(r.token);
      // ref.read(routerProvider).go(MainNav.route);
      return state.copyWith(loading: false, user: r.user);
    });
  }

  Future<void> logout() async {
    showToast('${state.user.name} logging out');
    state = state.copyWith(user: UserModel.init());

    ref.read(loggedInProvider.notifier).deleteAuthCache();
    NetworkHandler.instance.setToken("");
    // ref.read(routerProvider).go(LoginScreen.route);

    // ref.read(loggedInProvider.notifier).isLoggedIn();
  }

  Future<bool> register(SignUpBody body) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.register(body);

    state = result.fold((l) {
      showErrorToast(l.error.message);
      return state.copyWith(loading: false);
    }, (r) {
      showToast(r.message);
      success = r.success;
      return state.copyWith(loading: false);
    });

    return success;
  }

  Future<bool> verifyOtp(String otp) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.verifyOtp(otp);

    state = result.fold((l) {
      showErrorToast(l.error.message);
      return state.copyWith(loading: false);
    }, (r) {
      showToast(r.message);
      success = r.success;
      return state.copyWith(loading: false);
    });

    return success;
  }

  void resetPassword(String text, String value) {}

  Future<void> profileView() async {
    state = state.copyWith(loading: true);

    final result = await repo.profileView();

    state = result.fold((l) {
      showErrorToast(l.error.message);
      return state.copyWith(loading: false);
    }, (r) {
      final user = state.user.copyWith(
        name: r.user.name,
        email: r.user.email,
        phone: r.user.phone,
        information: r.user.information,
        avatar: r.user.avatar,
        gender: r.user.gender,
      );
      return state.copyWith(loading: false, user: user);
    });
  }

  Future<bool> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String information,
    File? avatar,
  }) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final imageString = Uri.dataFromBytes(
      avatar?.readAsBytesSync() ?? [],
      mimeType: lookupMimeType(avatar?.path ?? '') ?? '',
    ).toString();

    final body = ProfileUpdateBody(
      name: name,
      email: email,
      phone: phone,
      information: information,
      avatar: avatar != null ? imageString : '',
    );

    // Logger.d('body: ${body.toJson()}', tag: 'updateProfile');

    final result = await repo.updateProfile(body);

    state = result.fold((l) {
      showErrorToast(l.error.message);
      return state.copyWith(loading: false);
    }, (r) {
      showToast("Profile Updated Successfully");
      return state.copyWith(loading: false);
    });
    await profileView();

    return success;
  }

  Future<bool> passwordUpdate(ChangePasswordBody passwordUpdateBody) async {
    bool success = false;
    state = state.copyWith(loading: true);

    final result = await repo.passwordUpdate(passwordUpdateBody);

    state = result.fold((l) {
      showErrorToast(l.error.message);
      return state.copyWith(loading: false);
    }, (r) {
      showToast(r.message);
      success = r.success;
      ref.read(routerProvider).pop();
      return state.copyWith(loading: false);
    });

    return success;
  }

  setUser(UserModel user) {
    state = state.copyWith(user: user);
  }
}
