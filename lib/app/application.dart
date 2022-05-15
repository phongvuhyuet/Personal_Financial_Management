import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:personal_financial_management/app/pages/login_page.dart';
import 'package:personal_financial_management/app/pages/main_page.dart';
import 'package:personal_financial_management/app/pages/welcome_page.dart';
import 'package:personal_financial_management/app/routes/app_routes.dart';
import 'package:personal_financial_management/app/utils/global_key.dart';
import 'package:personal_financial_management/domain/blocs/auth_bloc/authentication_bloc.dart';
import 'package:personal_financial_management/domain/repositories/repositories.dart';
import 'package:personal_financial_management/domain/repositories/user_repo.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();
  final UserRepository userRepository = UserRepository();
  NavigatorState get _navigator => GlobalKeys.appNavigator.currentState!;
  final GlobalKey<NavigatorState> navigatorKey1 = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    print(navigatorKey1);
    return MultiRepositoryProvider(
        providers: [RepositoryProvider.value(value: authenticationRepository)],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AuthenticationBloc>(
                create: (context) => AuthenticationBloc(
                    authenticationRepository: authenticationRepository,
                    userRepository: userRepository))
          ],
          child: MaterialApp(
            key: GlobalKeys.appNavigator,
            //only show on recently opened app
            title: 'Personal Financial Management',
            debugShowMaterialGrid: false,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
              GlobalCupertinoLocalizations
                  .delegate, // Add global cupertino localiztions.
            ],
            supportedLocales: const [
              Locale("vi", "VI"),
              Locale("en", "US"),
            ],
            onGenerateRoute: AppRoute.generateRoute,
            // home: MainPage(),
            navigatorObservers: <NavigatorObserver>[routeObserver],

            builder: (context, child) {
              return BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  print(state);

                  switch (state.status) {
                    case AuthenticationStatus.unauthenticated:
                      print("_navigator");
                      print(_navigator.runtimeType);

                      _navigator.pushNamedAndRemoveUntil(
                        AppRoute.home,
                        (Route<dynamic> route) => false,
                      );
                      break;
                    case AuthenticationStatus.authenticated:
                      _navigator.pushNamedAndRemoveUntil(
                        AppRoute.home,
                        (Route<dynamic> route) => false,
                        arguments: state.user,
                      );
                      break;
                    default:
                      _navigator.pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                          (route) => false);
                  }
                },
                child: child,
              );
            },
          ),
        ));
  }
}
