import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:personal_financial_management/app/components/bottom_navigator/bottom_navigator.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/pages/data_entry/data_entry_route.dart';
import 'package:personal_financial_management/app/pages/detail/detail_route.dart';
import 'package:personal_financial_management/app/pages/detail/detail_view.dart';
import 'package:personal_financial_management/app/pages/home/home_route.dart';
import 'package:personal_financial_management/app/pages/statistic/statistic_route.dart';
import 'package:personal_financial_management/app/pages/wallet/wallet_route.dart';
import 'package:personal_financial_management/app/utils/global_key.dart';
import 'package:personal_financial_management/domain/models/models.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin<MainPage> {
  late List<MainView> _pages;

  late PageController _pageController;
  late List<String> _viewTracking;
  late MainView _currentMainView;
  late bool _isMainView;
  @override
  void initState() {
    _pages = [
      MainView(
        'homeKey',
        'main',
        'Trang chủ',
        HomeRoute(
          callback: _handleCallback,
        ),
        icon: MyAppIcons.home,
      ),
      MainView(
        'detailsKey',
        'main',
        'Chi tiết tiền vào ra',
        DetailRoute(
          callback: _handleCallback,
        ),
        icon: MyAppIcons.home,
      ),
      MainView(
        'dataEntryKey',
        'main',
        'Nhập',
        DataEntryRoute(
          callback: _handleCallback,
        ),
        icon: MyAppIcons.home,
      ),
      MainView(
        'statisticKey',
        'main',
        'Quản lý ngân sách',
        StatisticRoute(
          callback: _handleCallback,
        ),
        icon: MyAppIcons.home,
      ),
      MainView(
        'walletKey',
        'main',
        'Danh sách ví',
        WalletRoute(
          callback: _handleCallback,
        ),
        icon: MyAppIcons.home,
      )
    ];
    _pageController = PageController();

    _currentMainView = _pages[0];
    _isMainView = _currentMainView.view == 'main';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(),
        key: GlobalKeys.mainScaffold,
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigator(),
      ),
    );
  }

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      allowImplicitScrolling: true,
      onPageChanged: _handlePageChanged,

      scrollDirection: Axis.horizontal,
      children: _pages.map((MainView mainView) {
        return mainView.widget;
      }).toList(),
      // children: [
      //   // pages
      //   Container(color: Colors.red),
      //   Container(color: Colors.blue),
      //   Container(color: Colors.green),
      //   Container(color: Colors.yellow),
      //   Container(color: Colors.orange),
      // ],
      physics: NeverScrollableScrollPhysics(), // No sliding
    );
  }

  Widget _buildBottomNavigator() {
    return MyBottomNavigator(
        pageController: _pageController,
        currentIndex: _pages.indexOf(_currentMainView));
  }

  void _handlePageChanged(int index) {
    setState(() {
      _currentMainView = _pages[index];
      _isMainView = _currentMainView.view == 'main';
    });
  }

  void _handleOpenSearch() {}
  void _handleOpenDrawer() {}
  void _handleOpenNotification() {}
  void _handleCallback(
      {String? key,
      String? view,
      String? title,
      IconData? icon,
      Color? color}) {}

  Widget _buildLeading() {
    if (!_isMainView) {
      return IconButton(
        icon: MyAppIcons.backEnabled,
        onPressed: _handleOpenDrawer,
      );
    }
    return IconButton(
      splashRadius: 20,
      icon: MyAppIcons.menu,
      onPressed: () => _handleOpenDrawer(),
    );
  }

  Widget _buildTitle() {
    return Container(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Text(
            _currentMainView.title.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              color: MyAppColors.gray700,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      
      title: _buildTitle(),
      centerTitle: false,
      backgroundColor: MyAppColors.gray050,
      titleSpacing: 0.0,
      elevation: _currentMainView.key == 'homeKey' ? 0 : 5,
      leading: _buildLeading(),
      actions: [
        IconButton(
          splashRadius: 20,
          icon: MyAppIcons.notification,
          onPressed: () => _handleOpenSearch(),
        ),
        IconButton(
          splashRadius: 20,
          icon: MyAppIcons.infoOutline,
          onPressed: () => _handleOpenNotification(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
