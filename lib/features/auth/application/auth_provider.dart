import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/core/core.dart';
import 'package:icon_shopper/features/auth/application/auth_state.dart';
import 'package:icon_shopper/features/auth/infastructure/auth_repo.dart';

import '../domain/model/user_model.dart';

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
      return state.copyWith(loading: false, user: r.user);
    });
  }

  Future<void> logout() async {
    showToast('${state.user.name} logging out');
    state = state.copyWith(user: UserModel.init());

    ref.read(loggedInProvider.notifier).deleteAuthCache();
    NetworkHandler.instance.setToken("");

    // _ref.read(loggedInProvider.notifier).isLoggedIn();
  }

  Future<void> register() async {
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(loading: false);
  }

  Future<void> forgotPassword() async {
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(loading: false);
  }

  Future<void> updateProfile() async {
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(loading: false);
  }

  Future<void> updatePassword() async {
    state = state.copyWith(loading: true);
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(loading: false);
  }
}
