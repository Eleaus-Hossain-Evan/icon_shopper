import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/profile/presentation/profile_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../home/presentation/home_screen.dart';

final bottomNavigatorKey = GlobalKey();

class MainNav extends HookConsumerWidget {
  static const route = '/main-nav';

  const MainNav({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      const Center(child: Text('Category')),
      const Center(child: Text('Order')),
      const ProfileScreen(),
    ];

    useEffect(() {
      Future.wait([
        // Future.microtask(() => ref.read(authProvider.notifier).profileView()),
        // Future.microtask(() => ref.read(homeProvider.notifier)),
        // Future.microtask(
        //     () => ref.read(homeProvider.notifier).getRecentParcelList()),
      ]);
      return () => Logger.i("app exit");
    }, const []);

    return Scaffold(
      body: navWidget[navIndex.value],
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.bg200,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        key: bottomNavigatorKey,
        selectedIndex: navIndex.value,
        onDestinationSelected: (index) {
          navIndex.value = index;
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: navIndex.value == 0
                  ? context.colors.primary
                  : AppColors.black600,
            ),
            label: AppStrings.home,
          ),
          NavigationDestination(
            icon: Icon(
              LineAwesome.boxes_solid,
              color: navIndex.value == 1
                  ? context.colors.primary
                  : AppColors.black600,
            ),
            label: AppStrings.parcel,
          ),
          NavigationDestination(
            icon: Icon(
              LineAwesome.box_open_solid,
              color: navIndex.value == 2
                  ? context.colors.primary
                  : AppColors.black600,
            ),
            label: AppStrings.returns,
          ),
          NavigationDestination(
            icon: Icon(
              Icons.account_box_outlined,
              color: navIndex.value == 3
                  ? context.colors.primary
                  : AppColors.black600,
            ),
            label: AppStrings.profile,
          ),
        ],
      ).box.shadowSm.make(),
    );
  }
}
