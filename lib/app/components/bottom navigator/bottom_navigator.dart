import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';

class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  late final BottomNavigationBarItem homePage;

  late final BottomNavigationBarItem detailsPage;

  late final BottomNavigationBarItem inputPage;

  late final BottomNavigationBarItem statisticPage;

  late final BottomNavigationBarItem walletPage;
  @override
  void initState() {
    homePage = BottomNavigationBarItem(
      icon: Icon(MyAppIcons.home),
      label: 'Trang chủ',
    );
    detailsPage = BottomNavigationBarItem(
      icon: Icon(MyAppIcons.details),
      label: 'Chi tiết',
    );
    inputPage = BottomNavigationBarItem(
      icon: Icon(MyAppIcons.create),
      label: 'Nhập',
    );
    statisticPage = BottomNavigationBarItem(
      icon: Icon(MyAppIcons.piechart),
      label: 'Thống kê',
    );
    walletPage = BottomNavigationBarItem(
      icon: Icon(MyAppIcons.cart),
      label: 'Ví',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [],
    );
  }
}
