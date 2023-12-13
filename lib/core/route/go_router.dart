import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/auth/presentation/forgot_password/forgot_password_screen.dart';
import 'package:icon_shopper/features/auth/presentation/login_screen.dart';
import 'package:icon_shopper/features/auth/presentation/register_screen.dart';
import 'package:icon_shopper/features/checkout/presentation/checkout_screen.dart';
import 'package:icon_shopper/features/home/presentation/home_screen.dart';
import 'package:icon_shopper/features/product/presentation/category_wise_product.dart';
import 'package:icon_shopper/features/profile/presentation/page/order_detail_screen.dart';
import 'package:icon_shopper/features/profile/presentation/page/order_list_screen.dart';
import 'package:icon_shopper/features/profile/presentation/profile_detail_screen.dart';
import 'package:icon_shopper/features/splash/splash_screen.dart';

import '../../features/common/presentation/html_text_screen.dart';
import '../../features/main_mav/main_nav.dart';
import '../../features/product/presentation/product_detail/product_detail_screen.dart';
import '../../features/profile/domain/model/order_model.dart';
import '../../features/profile/presentation/change_password_screen.dart';
import '../core.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  // final listenable = ValueNotifier<bool>(true);

  return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: router,
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

  RouterNotifier(this._ref);

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
            child: HtmlTextScreen(
              url: state.uri.queryParameters['url'] ?? '',
              title: state.uri.queryParameters['title'] ?? '',
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
        GoRoute(
          path: ProfileDetailScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const ProfileDetailScreen(),
          ),
        ),
        GoRoute(
          path: ChangePasswordScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const ChangePasswordScreen(),
          ),
        ),
        GoRoute(
          path: '${CategoryWiseProductScreen.route}/:slug',
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: CategoryWiseProductScreen(
              slug: state.pathParameters['slug'] ?? '',
            ),
          ),
        ),
        GoRoute(
          path: '${ProductDetailScreen.route}/:slug',
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: ProductDetailScreen(
              slug: state.pathParameters['slug'] ?? '',
            ),
          ),
        ),
        GoRoute(
          path: CheckoutScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const CheckoutScreen(),
          ),
        ),
        GoRoute(
          path: OrderListScreen.route,
          pageBuilder: (context, state) => SlideRightToLeftTransitionPage(
            key: state.pageKey,
            child: const OrderListScreen(),
          ),
        ),
        GoRoute(
          path: OrderDetailScreen.route,
          pageBuilder: (context, state) => SlideBottomToTopTransitionPage(
            key: state.pageKey,
            child: OrderDetailScreen(
              model: state.extra as OrderModel,
            ),
          ),
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
    _ref.listen<bool>(
      loggedInProvider.select((value) => value.loggedIn),
      (_, __) => listener,
    );
  }

  @override
  void removeListener(VoidCallback listener) {
    _ref.listen<bool>(
      loggedInProvider.select((value) => value.loggedIn),
      (_, __) => listener,
    );
  }
}

class SlideRightToLeftTransitionPage extends CustomTransitionPage {
  SlideRightToLeftTransitionPage({
    super.key,
    required super.child,
    super.fullscreenDialog = true,
  }) : super(
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
          }, // Here you may also wrap this child with some common designed widget
        );
}

class SlideBottomToTopTransitionPage extends CustomTransitionPage {
  SlideBottomToTopTransitionPage({
    super.key,
    required super.child,
  }) : super(
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
          }, // Here you may also wrap this child with some common designed widget
        );
}

class NoTransitionPage extends CustomTransitionPage {
  NoTransitionPage({
    super.key,
    required super.child,
  }) : super(
          fullscreenDialog: true,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return child;
          },
        );
}
