import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/utils/assets.dart';

class MyAppIcons {
  //default size off icons
  static const double size = 24;
  static final defaultStyle = [
    {"fit": BoxFit.fill},
    {
      "height": 24,
    },
    {
      "width": 24,
    }
  ];
  static final Color iconColor = MyAppColors.gray800;
  //default boxfit of icons
  static const BoxFit boxFit = BoxFit.fill;
  //Logo
  static Widget logo = SvgPicture.asset(
    Logo.logoURL,
    width: 100,
    height: 100,
    // color: Colors.transparent,
    fit: BoxFit.fill,
  );

  //google icon
  static Widget googleIcon = SvgPicture.asset(
    GoogleIcon.googleIconURL,
    width: 20,
    height: 20,
  );
  //get instance of the AntDesignIcons class
  static Widget home = SvgPicture.asset(
    GeneralIcon.home,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget homeActive = SvgPicture.asset(
    GeneralIcon.home,
    color: MyAppColors.accent800,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );

  static Widget person = SvgPicture.asset(GeneralIcon.person);
  static Widget create = SvgPicture.asset(
    ContentIcon.create,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget createActive = SvgPicture.asset(
    ContentIcon.create,
    color: MyAppColors.accent800,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget details = SvgPicture.asset(
    FinancialIcon.receipt,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget detailsActive = SvgPicture.asset(
    FinancialIcon.receipt,
    color: MyAppColors.accent800,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget pieChart = SvgPicture.asset(
    FinancialIcon.pieChart,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget pieChartActive = SvgPicture.asset(
    FinancialIcon.pieChart,
    color: MyAppColors.accent800,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget cart = SvgPicture.asset(
    GeneralIcon.cart,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget cartActive = SvgPicture.asset(
    GeneralIcon.cart,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget bag = SvgPicture.asset(
    FinancialIcon.shopperBag,
    fit: BoxFit.fill,
    color: MyAppColors.accent800,
    height: 24,
    width: 24,
  );
  static Widget trash = SvgPicture.asset(
    GeneralIcon.trash,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget wallet = SvgPicture.asset(
    FinancialIcon.wallet,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget walletActive = SvgPicture.asset(
    FinancialIcon.wallet,
    fit: BoxFit.fill,
    color: MyAppColors.accent800,
    height: 24,
    width: 24,
  );

  // action icons
  static Widget visibility = SvgPicture.asset(ActionIcon.visibility);
  static Widget infoOutline = SvgPicture.asset(ActionIcon.infoOutline);
  static Widget info = SvgPicture.asset(ActionIcon.info);
  static Widget visibilityOff = SvgPicture.asset(
    ActionIcon.visibilityOff,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );

  // notification icons
  static Widget notification = SvgPicture.asset(
    SocialIcon.notifications,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );

  //navigation icons
  static Widget menu = SvgPicture.asset(
    NavigationIcon.menu,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget backEnabled = SvgPicture.asset(
    NavigationIcon.chevronLeftOn,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );

  // two arrow icons on and off
  static Widget chevronLeftOn = SvgPicture.asset(
    NavigationIcon.chevronLeftOn,
    color: MyAppColors.accent800,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget chevronRightOn = SvgPicture.asset(
    NavigationIcon.chevronRightOn,
    color: MyAppColors.accent800,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget chevronLeftOff = SvgPicture.asset(
    NavigationIcon.chevronLeftOff,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget chevronRightOff = SvgPicture.asset(
    NavigationIcon.chevronRightOff,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  //financial icons
  static Widget bank = SvgPicture.asset(
    FinancialIcon.bankBuilding,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget penny = SvgPicture.asset(
    FinancialIcon.penny,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );

// social icons
  static Widget smartPhone = SvgPicture.asset(
    SocialIcon.smartPhone,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  
}
