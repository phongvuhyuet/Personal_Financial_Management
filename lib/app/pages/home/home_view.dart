import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/date_picker/date_picker.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/components/images/my_images.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      _buildTabBar(),
      Row(
        children: [
          MyDatePicker(dateTime: dateTime),
        ],
      )
    ]);
  }

  Widget _buildTabBar() {
    late int _currentIndex = 0;
    late TextStyle _tabBarTextStyle = TextStyle(
      fontSize: 16,
    );
    late List<Widget> _tabs = [
      Tab(
        child: Text(
          'THÁNG',
          style: _tabBarTextStyle,
        ),
      ),
      Tab(
        child: Text(
          'TUẦN',
          style: _tabBarTextStyle,
        ),
      ),
      Tab(
        child: Text(
          'NGÀY',
          style: _tabBarTextStyle,
        ),
      ),
    ];

    void _onChangeTab(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return DefaultTabController(
      initialIndex: _currentIndex,
      length: 3,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: MyAppColors.gray500,
              blurRadius: 15.0,
              offset: const Offset(0.0, 0.75),
            )
          ],
          color: MyAppColors.gray050,
        ),
        child: TabBar(
          indicatorColor: MyAppColors.accent700,
          unselectedLabelColor: MyAppColors.gray600,
          labelColor: MyAppColors.accent700,
          onTap: _onChangeTab,
          tabs: _tabs,
        ),
      ),
    );
  }
}
