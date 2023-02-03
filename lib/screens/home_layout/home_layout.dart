import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:route_movies_app/screens/home_screen/home_screen.dart';
import 'package:route_movies_app/screens/search/search_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'homeLayout';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).primaryColor,
        // Default is Colors.white.
        handleAndroidBackButtonPress: true,
        // Default is true.
        resizeToAvoidBottomInset: true,
        // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true,
        // Default is true.
        hideNavigationBarWhenKeyboardShows: true,
        // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          // borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Theme.of(context).primaryColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style1, // Choose the nav bar style with this property.
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      SearchScreen(),
      Container(
        child: const Center(
          child: Text(
            'BROWSE',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      Container(
        child: const Center(
          child: Text(
            'WATCHLIST',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      // Container()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("HOME"),
        activeColorPrimary: Theme.of(context).colorScheme.secondary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.search),
        title: ("SEARCH"),
        activeColorPrimary: Theme.of(context).colorScheme.secondary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.movie_creation),
        title: ("BROWSE"),
        activeColorPrimary: Theme.of(context).colorScheme.secondary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark_border_outlined),
        title: ("WATCHLIST"),
        activeColorPrimary: Theme.of(context).colorScheme.secondary,
        inactiveColorPrimary: Theme.of(context).colorScheme.onSecondary,
      ),
    ];
  }
}
