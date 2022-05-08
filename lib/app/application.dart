import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_financial_management/app/pages/home/home_route.dart';
import 'package:personal_financial_management/app/pages/home/home_view.dart';
import 'package:personal_financial_management/app/pages/login_page.dart';
import 'package:personal_financial_management/app/pages/main_page.dart';
import 'package:personal_financial_management/app/utils/global_key.dart';
import 'package:personal_financial_management/domain/blocs/auth_bloc/authentication_bloc.dart';
import 'package:personal_financial_management/domain/repositories/repositories.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [RepositoryProvider.value(value: authenticationRepository)],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
              create: (context) => AuthenticationBloc(),
            )
          ],
          child: MaterialApp(
            key: GlobalKeys.appNavigator,
            home: LoginPage(),
          ),
        ));
  }
}
