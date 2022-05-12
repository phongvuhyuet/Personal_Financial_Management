import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';

Widget haventAccount(
    {required Function onPressed, required List<Widget> children}) {
  return Container(
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Bạn chưa có tài khoản?',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromARGB(255, 52, 52, 52),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend Deca'),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'Tạo tài khoản',
                style: TextStyle(
                    fontSize: 14,
                    color: MyAppColors.accent800,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend Deca'),
              ),
            ),
            const Text(' or ',
                style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 245, 216, 2),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lexend Deca')),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: InkWell(
            onTap: () {},
            child: RichText(
                text: TextSpan(
                    text: 'Đăng nhập bằng Google',
                    style: TextStyle(
                        fontSize: 16,
                        color: MyAppColors.accent800,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lexend Deca'),
                    children: [
                  WidgetSpan(
                      child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: MyAppIcons.googleIcon,
                  ))
                ])),
          ),
        )
      ],
    ),
  );
}
