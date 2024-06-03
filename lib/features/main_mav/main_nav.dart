import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icon_shopper/features/category/presentation/category_screen.dart';
import 'package:icon_shopper/features/checkout/application/checkout_provider.dart';
import 'package:icon_shopper/features/profile/presentation/profile_screen.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/core.dart';
import '../auth/application/auth_provider.dart';
import '../checkout/presentation/cart_screen.dart';
import '../home/presentation/home_screen.dart';
import '../profile/application/profile_provider.dart';
import '../profile/presentation/profile_screen.dart';

final bottomNavigatorKey = GlobalKey();

class MainNav extends HookConsumerWidget {
  static const route = '/main-nav';
  static final bottomNavigatorKey = GlobalKey();

  const MainNav({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProductProvider);
    final navIndex = useState(0);
    final navWidget = [
      const HomeScreen(),
      const CategoryScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    useEffect(() {
      Future.wait([
        // Future.microtask(() => ref.read(homeDataProvider.notifier).getData()),
        Future.microtask(() => ref.read(authProvider.notifier).profileView()),
        Future.microtask(() =>
            ref.read(contactInfoNotifierProvider.notifier).getContactInfo()),
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
        animationDuration: const Duration(milliseconds: 600),
        destinations: [
          NavigationDestination(
            icon: const Icon(
              Icons.home_outlined,
              color: AppColors.black600,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: context.colors.primary,
            ),
            label: AppStrings.home,
          ),
          NavigationDestination(
            icon: const Icon(
              BoxIcons.bx_category,
              color: AppColors.black600,
            ),
            selectedIcon: Icon(
              BoxIcons.bxs_category,
              color: context.colors.primary,
            ),
            label: "Category",
          ),
          NavigationDestination(
            icon: Badge(
              backgroundColor: context.colors.secondary,
              label: Text(cartState.length.toString()),
              isLabelVisible: cartState.isNotEmpty,
              child: const Icon(
                BoxIcons.bx_cart_alt,
                color: AppColors.black600,
              ),
            ),
            selectedIcon: Icon(
              BoxIcons.bxs_cart_alt,
              color: context.colors.primary,
            ),
            label: "Cart",
          ),
          NavigationDestination(
            icon: const Icon(
              BoxIcons.bx_user,
              color: AppColors.black600,
            ),
            selectedIcon: Icon(
              BoxIcons.bxs_user,
              color: context.colors.primary,
            ),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}
