import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/components/widgets/havenAccount.dart';
import 'package:personal_financial_management/app/utils/assets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool savePassword;
  late final TextEditingController _userNameController;
  late final TextEditingController _passwordController;
  late bool _isVisbilityPassword;
  @override
  void initState() {
    super.initState();
    savePassword = false;
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _isVisbilityPassword = false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            color: MyAppColors.white000,
            elevation: 0,
            child: SizedBox(
              height: 111,
              child: SvgPicture.asset(
                BackgroundImages.foregroundImagesURL,
                fit: BoxFit.fill,
                width: 1000,
              ),
            ),
          ),

          // child: FittedBox(
          //     fit: BoxFit.fitWidth,
          //     alignment: Alignment.centerLeft,
          //     child: MyAppImages.foregroundImage),
          body: ListView(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _logo(),
                const Text(
                  'Đăng nhập',
                  style: TextStyle(
                      fontSize: 42,
                      color: Color.fromRGBO(34, 73, 87, 1),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lexend Deca'),
                ),
                const SizedBox(
                  height: 34,
                ),
                const Text(
                  'Đăng nhập và bắt đầu quản lý tài chính!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 1,
                    letterSpacing: .6,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(34, 73, 87, 1),
                    fontFamily: 'Lexend Deca',
                  ),
                ),
                Container(
                  width: 297,
                  height: 45,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    maxLength: 30,
                    smartQuotesType: SmartQuotesType.disabled,
                    maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        counterText: '',
                        hoverColor: MyAppColors.gray300,
                        fillColor: MyAppColors.gray200,
                        labelText: "Tài khoản",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: MyAppColors.gray300,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1, color: MyAppColors.accent800),
                        ),
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            color: MyAppColors.accent800,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend Deca'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                  ),
                ),
                Container(
                  width: 297,
                  height: 45,
                  margin: const EdgeInsets.only(top: 30),
                  child: TextFormField(
                    maxLength: 30,
                    obscureText: !_isVisbilityPassword,
                    smartQuotesType: SmartQuotesType.disabled,
                    maxLines: 1,
                    decoration: InputDecoration(
                        filled: true,
                        counterText: '',
                        suffixIcon: _isVisbilityPassword
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisbilityPassword =
                                        !_isVisbilityPassword;
                                  });
                                },
                                icon: MyAppIcons.visibility)
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVisbilityPassword =
                                        !_isVisbilityPassword;
                                  });
                                },
                                icon: MyAppIcons.visibilityOff,
                              ),
                        hoverColor: MyAppColors.gray300,
                        fillColor: MyAppColors.gray200,
                        labelText: "Mật khẩu",
                        enabledBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                            width: 1,
                            color: MyAppColors.gray300,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              width: 1, color: MyAppColors.accent800),
                        ),
                        labelStyle: const TextStyle(
                            fontSize: 14,
                            color: MyAppColors.accent800,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lexend Deca'),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              visualDensity: VisualDensity.compact,
                              activeColor: MyAppColors.accent900,
                              checkColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              value: savePassword,
                              onChanged: (_) {
                                setState(() {
                                  savePassword = !savePassword;
                                });
                              }),
                          const Text('Ghi nhớ mật khẩu',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(156, 124, 69, 1.0),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lexend Deca',
                              ))
                        ],
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('Quên mật khẩu?'))
                    ],
                  ),
                ),

                //login button
                Container(
                  margin: const EdgeInsets.only(top: 21),
                  width: 280,
                  height: 45,
                  child: Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyAppColors.accent800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(34, 73, 87, 1),
                            fontFamily: 'Lexend Deca',
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                // haven't account
                const SizedBox(
                  height: 42,
                ),

                haventAccount(onPressed: () {}, children: []),

                // _buildBackground()
              ],
            ),
          ])),
    );
  }

  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        child: MyAppIcons.logo,
        height: 72,
        width: 72,
      ),
    );
  }

  // Widget _myCustomTextField({
  //   required String label,
  //   Icon? icon,
  //   bool? isPassword,
  //   bool? isVisbilityPassword,
  // }) {
  //   return   }

}
