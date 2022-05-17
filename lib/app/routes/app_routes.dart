import 'package:flutter/material.dart';
import 'package:personal_financial_management/app/pages/login_page.dart';
import 'package:personal_financial_management/app/pages/main_page.dart';
import 'package:personal_financial_management/app/pages/welcome_page.dart';
import 'package:personal_financial_management/domain/blocs/auth_bloc/authentication_bloc.dart';
import 'package:personal_financial_management/domain/repositories/repositories.dart';
import 'package:personal_financial_management/domain/repositories/user_repo.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (animation.status == AnimationStatus.reverse)
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    return FadeTransition(opacity: animation, child: child);
  }
}

class AppRoute {
  static const String welcomePage = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String detail = '/detail';
  static const String wallet = '/wallet';
  static const String dataEntry = '/dataentry';
  static const String statistic = '/statistic';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    print(settings);
    switch (settings.name) {
      case welcomePage:
        return PageViewTransition(builder: (context) => LoginPage());
      case home:
        return PageViewTransition(builder: (context) => MainPage());
      case login:
        return PageViewTransition(builder: (context) => LoginPage());
      case detail:
      // return PageViewTransition(builder: (context) => DetailPage());
      case wallet:
      // return PageViewTransition(builder: (context) => WalletPage());
      case dataEntry:
      // return PageViewTransition(builder: (context) => CreateIncomePage());
      default:
        return PageViewTransition(builder: (context) => LoginPage());
    }
  }
}
