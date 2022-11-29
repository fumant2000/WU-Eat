import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmchat/pages/home/main-foods-page.dart';
import 'package:tmchat/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

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


}
