import 'package:fake_store/core/error_screen.dart';
import 'package:fake_store/products_feature/all_products.dart';
import 'package:fake_store/products_feature/products_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../core/palette.dart';
import '../storage/storage_service.dart';
import 'cart.dart';

final globalNavbarController =
    Provider((ref) => PersistentTabController(initialIndex: 0));

class Root extends ConsumerStatefulWidget {
  static const name = "root";
  const Root({super.key});

  @override
  RootState createState() => RootState();
}

class RootState extends ConsumerState<Root> {
  @override
  void initState() {
    Future.microtask(
        () => ref.read(productsControllerProvider.notifier).fetchProducts());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Products"),
        activeColorPrimary: Palette.primaryColor1,
        inactiveColorPrimary: Palette.primaryColor6,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.cart),
        title: ("Cart"),
        activeColorPrimary: Palette.primaryColor1,
        inactiveColorPrimary: Palette.primaryColor6,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(storageInitializationFuture).when(
        data: (_) {
          return PersistentTabView(
            context,
            controller: ref.watch(globalNavbarController),
            screens: const [AllProducts(), Cart()],
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset:
                true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true, // Default is true.
            hideNavigationBarWhenKeyboardShows:
                true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style1, // Choose the nav bar style with this property.
          );
        },
        error: (error, stack) => Scaffold(
              body: ErrorBody(
                error: error.toString(),
                retry: () {
                  ref.refresh(storageInitializationFuture);
                },
              ),
            ),
        loading: () => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}
