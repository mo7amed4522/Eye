// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, deprecated_member_use, avoid_print
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Navigation/custom_Animated_buttom_bar.dart';
import '../Pages/home/hpme_page.dart';
import '../Pages/home2/Home_page2.dart';
import '../Pages/messages/overViewLast/HomeOVerView/homeOverView.dart';
import '../searchUers/searchHome.dart';
import 'dashbordController.dart';

class My_dashbord_NavaAge extends StatelessWidget {
  const My_dashbord_NavaAge({Key? key}) : super(key: key);

  final _inactiveColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashbordController>(
      init: DashbordController(),
      builder: (_controller) => Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: _controller.tabIndex,
            children: [
              HomePageBottomNavBottomNav(),
              HomePageOverView(),
              SearchForNewUser(),
              Home_page_buttom_nav2(),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(
            _controller.tabIndex, _controller.changeTabIndex, context),
      ),
    );
  }

  Widget _buildBottomBar(_currentIndex, change, context) {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: change,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          title: Text(
            'Home (1)',
          ),
          activeColor: Colors.green,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.people,
          ),
          title: Text(
            'Users',
          ),
          activeColor: Colors.purpleAccent,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.search_sharp,
          ),
          title: Text(
            'Search',
          ),
          activeColor: Colors.pink,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          title: Text(
            '(2) Home',
          ),
          activeColor: Colors.blue,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
