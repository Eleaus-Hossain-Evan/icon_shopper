import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    observers: [ProviderLog()],
  );

  Logger.init(
    true, // isEnable ，if production ，please false
    isShowFile: false, // In the IDE, whether the file name is displayed
    isShowTime: false, // In the IDE, whether the time is displayed
    isShowNavigation: true,
    levelVerbose: 247,
    levelDebug: 15,
    levelInfo: 10,
    levelWarn: 5,
    levelError: 9,
    phoneVerbose: Colors.white,
    phoneDebug: AppColors.success,
    phoneInfo: AppColors.info,
    phoneWarn: AppColors.warning,
    phoneError: AppColors.error,
  );
  final box = container.read(hiveProvider);
  await box.init();

  container.read(themeProvider);

  final String token = box.get(AppStrings.token, defaultValue: '');

  NetworkHandler.instance
    ..setup(baseUrl: APIRouteEndpoint.BASE_URL, showLogs: false)
    ..setToken(token);

  Logger.d('token: $token');
  runApp(
    ProviderScope(
      parent: container,
      observers: [ProviderLog()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final appTheme = ref.watch(themeProvider);
    // final user = ref.watch(loggedInProvider.notifier).user.copyWith();

    useEffect(() {
      Future.wait([
        // Future.microtask(() => ref.read(authProvider.notifier).setUser(user)),
      ]);

      return null;
    }, []);

    return ScreenUtilInit(
      // designSize: const Size(375, 812),
      designSize: const Size(392, 781),
      builder: (context, child) {
        return DismissKeyboard(
          child: MaterialApp.router(
            title: AppStrings.appName,
            debugShowCheckedModeBanner: false,
            scaffoldMessengerKey: ref.watch(scaffoldKeyProvider),
            scrollBehavior: const ScrollBehavior()
                .copyWith(physics: const BouncingScrollPhysics()),
            //: Router
            routerConfig: router,
            //:BotToast
            builder: BotToastInit(),

            //:localization
            // localizationsDelegates: AppLocalizations.localizationsDelegates,
            // supportedLocales: AppLocalizations.supportedLocales,
            locale: ref.watch(appLocalProvider),

            //:theme
            themeMode: appTheme.theme.isEmpty
                ? ThemeMode.system
                : appTheme.theme == "dark"
                    ? ThemeMode.dark
                    : ThemeMode.light,

            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
          ),
        );
      },
    );
  }
}
