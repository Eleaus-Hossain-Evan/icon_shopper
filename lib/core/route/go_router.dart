import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/auth/presentation/forgot_password/forgot_password_screen.dart';
import 'package:icon_shopper/features/auth/presentation/login_screen.dart';
import 'package:icon_shopper/features/auth/presentation/register_screen.dart';
import 'package:icon_shopper/features/home/presentation/home_screen.dart';
import 'package:icon_shopper/features/splash/splash_screen.dart';

import '../../features/common/presentation/html_text.dart';
import '../../features/main_mav/main_nav.dart';
import '../core.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  final listenable = ValueNotifier<bool>(true);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: listenable,
      redirect: router._redirectLogic,
      routes: router._routes,
      initialLocation: SplashScreen.route,
      errorPageBuilder: router._errorPageBuilder,
      observers: [
        BotToastNavigatorObserver(),
      ]);
});

class RouterNotifier extends Listenable {
  final Ref _ref;

  RouterNotifier(this._ref) {
    // _ref.listen<bool>(
    // loggedInProvider.select((value) => value.loggedIn),
    // (_, __) => notifyListeners(),
    // );
    // _ref.listen<bool>(
    //   loggedInProvider.select((value) => value.onboarding),
    //   (_, __) => notifyListeners(),
    // );
  }

  String? _redirectLogic(BuildContext context, GoRouterState state) {
    final token = _ref.watch(loggedInProvider.notifier).token;
    final user = _ref.watch(loggedInProvider.notifier).user;

    final isLoggedIn = _ref.watch(loggedInProvider).loggedIn; //bool
    // final isOnboarding = _ref.watch(loggedInProvider).onboarding; //bool

    Logger.i('RouterNotifier: isLoggedIn - $isLoggedIn');
    log('RouterNotifier:  $token, $user');

    final areWeLoggingIn = state.matchedLocation == LoginScreen.route;
    final areWeRegistering = state.matchedLocation == RegisterScreen.route;

    if (!isLoggedIn && areWeLoggingIn) {
      return areWeLoggingIn ? null : LoginScreen.route;
    }
    if (!isLoggedIn && areWeRegistering) {
      return areWeRegistering ? null : RegisterScreen.route;
    }

    if (areWeLoggingIn || areWeRegistering) {
      return MainNav.route;
    }

    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          path: SplashScreen.route,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: LoginScreen.route,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RegisterScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const RegisterScreen(),
          ),
        ),
        GoRoute(
          path: ForgotPasswordScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const ForgotPasswordScreen(),
          ),
        ),
        GoRoute(
          path: HtmlTextScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const HtmlTextScreen(
              details: '',
              title: '',
            ),
          ),
        ),
        GoRoute(
          path: MainNav.route,
          pageBuilder: (context, state) => SlideBottomToTopTransitionPage(
            key: state.pageKey,
            child: const MainNav(),
          ),
        ),
        GoRoute(
          path: HomeScreen.route,
          builder: (context, state) => const HomeScreen(),
        ),
      ];

  Page<void> _errorPageBuilder(BuildContext context, GoRouterState state) =>
      MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          // backgroundColor: Theme.of(context).errorColor.withOpacity(.1),
          body: Center(
            child: Text('Error: ${state.error.toString()}'),
          ),
        ),
      );

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }
}

class SlideRightToLeftTransitionPage extends CustomTransitionPage {
  SlideRightToLeftTransitionPage({
    LocalKey? key,
    required Widget child,
    bool fullscreenDialog = true,
  }) : super(
          key: key,
          fullscreenDialog: fullscreenDialog,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          },
          child:
              child, // Here you may also wrap this child with some common designed widget
        );
}

class SlideBottomToTopTransitionPage extends CustomTransitionPage {
  SlideBottomToTopTransitionPage({
    LocalKey? key,
    required Widget child,
  }) : super(
          key: key,
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOut),
                ),
              ),
              child: child,
            );
          },
          child:
              child, // Here you may also wrap this child with some common designed widget
        );
}

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({
    LocalKey? key,
    required Widget child,
  }) : super(
          key: key,
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
          child: child,
        );
}
