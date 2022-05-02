import 'package:flutter/material.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/utils/global_key.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';

class MyBottomNavigator extends StatefulWidget {
  const MyBottomNavigator({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  State<MyBottomNavigator> createState() => _MyBottomNavigatorState();
}

class _MyBottomNavigatorState extends State<MyBottomNavigator> {
  late final BottomNavigationBarItem homePage;

  late final BottomNavigationBarItem detailsPage;

  late final BottomNavigationBarItem inputPage;

  late final BottomNavigationBarItem statisticPage;

  late final BottomNavigationBarItem walletPage;
  late int _currentIndex;
  @override
  void initState() {
    homePage = BottomNavigationBarItem(
      icon: Icon(
        MyAppIcons.home,
      ),
      label: 'Trang chủ',
    );
    detailsPage = BottomNavigationBarItem(
      icon: Icon(
        MyAppIcons.details,
      ),
      label: 'Chi tiết',
    );
    inputPage = BottomNavigationBarItem(
      icon: Icon(
        MyAppIcons.create,
      ),
      label: 'Nhập',
    );
    statisticPage = BottomNavigationBarItem(
      icon: Icon(
        MyAppIcons.pieChart,
      ),
      label: 'Thống kê',
    );
    walletPage = BottomNavigationBarItem(
      icon: Icon(
        MyAppIcons.cart,
      ),
      label: 'Ví',
    );
    super.initState();
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          key: GlobalKeys.bottomBarKey,
          currentIndex: _currentIndex,
          elevation: 0,
          unselectedItemColor: MyAppColors.gray500,
          selectedItemColor: MyAppColors.accent800,
          backgroundColor: MyAppColors.gray050,
          mouseCursor: MaterialStateMouseCursor.clickable,
          showUnselectedLabels: true,
          iconSize: 24,
          type: BottomNavigationBarType.fixed,
          items: [
            homePage,
            detailsPage,
            inputPage,
            statisticPage,
            walletPage,
          ],
          onTap: _handleBarItemTap,
        ),
      ),
    );
  }

  void _handleBarItemTap(int index) {
    setState(() {
      _currentIndex = index;
      widget.pageController.jumpToPage(index);
    });
  }
}
