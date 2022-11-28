import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:tmchat/pages/home/main-foods-page.dart';
import 'package:tmchat/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late PersistentTabController _controller;

  int _selecterdIndex = 0;
  void onTapNav(int index) {
    setState(() {
      _selecterdIndex = index;
    });
  }

  List page = [
    MainFoodsPage(),
    Container(
      child: Center(
        child: Text('Next page'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Next next page'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Next next next page'),
      ),
    ),
  ];
 /* List<Widget> _buildScreens() {
    return [
      MainFoodsPage(),
      Container(
        child: Center(
          child: Text('Next page'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Next next page'),
        ),
      ),
      Container(
        child: Center(
          child: Text('Next next next page'),
        ),
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox_fill),
        title: ("Archive"),
        activeColorPrimary: AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
       PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: ("card"),
        activeColorPrimary:AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
       PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person),
        title: ("Me"),
        activeColorPrimary:AppColors.mainColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[_selecterdIndex],
      //MainFoodsPage(),
      bottomNavigationBar: BottomNavigationBar(
       selectedItemColor: AppColors.mainColor,
       unselectedItemColor: Colors.black87,
       showSelectedLabels: false,
       showUnselectedLabels: false,
       selectedFontSize: 0,
       unselectedFontSize: 0,
       currentIndex: _selecterdIndex,
       onTap: onTapNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text('home'),
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.archive),
            title: Text('history'),
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('card'),
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('me'),
            ),
        ]
        ),
    );
  }

 /* @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
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
      itemAnimationProperties: ItemAnimationProperties(
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
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }*/
}
