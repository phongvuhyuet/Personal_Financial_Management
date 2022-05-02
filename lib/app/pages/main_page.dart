import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:personal_financial_management/app/components/bottom_navigator/bottom_navigator.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/pages/home/home_route.dart';
import 'package:personal_financial_management/app/utils/global_key.dart';
import 'package:personal_financial_management/domain/models/models.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<MainView> _pages;
  late PageController _pageController;
  late List<String> _viewTracking;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();

    _pages = [
      MainView(
        'homeKey',
        'main',
        'Trang chủ',
        HomeRoute(
          callback: _handleCallback,
        ),
        icon: MyAppIcons.home,
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: GlobalKeys.mainScaffold,
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigator(),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      top: false,
      child: PageView(
        controller: _pageController,
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        // children: _pages.map((MainView mainView) {
        //   return mainView.widget;
        // }).toList(),
        children: [
          // pages
          Container(color: Colors.red),
          Container(color: Colors.blue),
          Container(color: Colors.green),
          Container(color: Colors.yellow),
          Container(color: Colors.orange),
        ],
        physics: NeverScrollableScrollPhysics(), // No sliding
      ),
    );
  }

  Widget _buildBottomNavigator() {
    return MyBottomNavigator(pageController: _pageController);
  }

  void _handleCallback(
      {String? key,
      String? view,
      String? title,
      IconData? icon,
      Color? color}) {}
}
