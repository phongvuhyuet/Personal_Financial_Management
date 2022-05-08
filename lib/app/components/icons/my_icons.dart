import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/utils/assets.dart';

class MyAppIcons {
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
  static Widget create = SvgPicture.asset(ContentIcon.create);
  static Widget createActive = SvgPicture.asset(
    ContentIcon.create,
    color: MyAppColors.accent800,
    fit: BoxFit.fill,
    height: 24,
    width: 24,
  );
  static Widget details = SvgPicture.asset(FinancialIcon.receipt);
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
}
