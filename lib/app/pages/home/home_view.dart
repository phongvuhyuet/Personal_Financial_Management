import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/date_picker/date_picker.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/components/images/my_images.dart';
import 'package:personal_financial_management/domain/blocs/home_bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DateTime? dateTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          context.read<HomeBloc>().add(HomeSubscriptionRequested());
          return Container(
            color: MyAppColors.white000,
            child: Column(
              children: [
                _buildTabBar(),
                MyDatePicker(dateTime: dateTime),
                _buildIndicatorChart(),
                Container(
                    margin: const EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: MyAppColors.gray500,
                          blurRadius: 0,
                          offset: const Offset(0.0, 0.75),
                        )
                      ],
                      color: MyAppColors.white000,
                    ),
                    child: _buildHistoryTitle()),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 1,
                      );
                    },
                    itemBuilder: (context, index) {
                      return _buildHistoryExpense();
                    },
                    itemCount: 100,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
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
    late List<Widget> _tabViews = [];
    void _onChangeTab(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return Card(
      color: MyAppColors.gray050,
      elevation: 5,
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: DefaultTabController(
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
      ),
    );
  }

  Widget _buildIndicatorChart() {
    //format number according to #.##0.00 format
    NumberFormat _numberFormat = NumberFormat.currency(
      locale: 'vi-VN',
      symbol: '',
      decimalDigits: 2,
      customPattern: '#,##0.00',
    );
    return CircularPercentIndicator(
      addAutomaticKeepAlive: true,
      reverse: true,
      radius: 150.0,
      animation: true,
      animationDuration: 1000,
      lineWidth: 15.0,
      percent: 0.4,
      center: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tổng tiền',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: MyAppColors.gray600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              '${_numberFormat.format(123459123)} ${_numberFormat.currencyName}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: MyAppColors.gray800,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
            ),
            child: Text(
              'Hạn mức: ${_numberFormat.format(200000000)} ${_numberFormat.currencyName}',
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: MyAppColors.gray600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
      circularStrokeCap: CircularStrokeCap.butt,
      backgroundColor: MyAppColors.gray100,
      progressColor: MyAppColors.gray800,
    );
  }

  Widget _buildHistoryTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('LỊCH SỬ GIAO DỊCH', style: TextStyle(fontSize: 14)),
          TextButton(
              onPressed: () {},
              child: Text('XEM CHI TIẾT',
                  style:
                      TextStyle(fontSize: 14, color: MyAppColors.accent800))),
        ],
      ),
    );
  }

  Widget _buildHistoryExpense() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        leading: MyAppIcons.bag,
        title: Text('Giao dịch'),
        subtitle: Text('Giao dịch'),
        trailing: Text('- ${123456789} đ'),
      ),
    );
  }
}
