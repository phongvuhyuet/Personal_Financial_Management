import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';

class MyDatePicker extends StatefulWidget {
  const MyDatePicker({Key? key, required this.dateTime}) : super(key: key);
  final DateTime? dateTime;
  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: FloatingActionButton.extended(
          icon: Icon(Icons.date_range),
          label: const Text("Rounded Calendar (English)"),
          onPressed: () async {
            DateTime? newDateTime = await showRoundedDatePicker(
                context: context,
                height: MediaQuery.of(context).size.height * 0.5,
                locale: const Locale("vi", "VN"),
                theme: ThemeData(
                    primarySwatch: const MaterialColor(
                  0xFFFFFFFF,
                  <int, Color>{
                    50: Color(0xFFFFFFFF),
                    100: Color(0xFFFFFFFF),
                    200: Color(0xFFFFFFFF),
                    300: Color(0xFFFFFFFF),
                    400: Color(0xFFFFFFFF),
                    500: Color(0xFFFFFFFF),
                    600: Color(0xFFFFFFFF),
                    700: Color(0xFFFFFFFF),
                    800: Color(0xFFFFFFFF),
                    900: Color(0xFFFFFFFF),
                  },
                )),
                styleDatePicker: MaterialRoundedDatePickerStyle(
                  textStyleDayButton: TextStyle(
                    fontSize: 24,
                    color: MyAppColors.gray900,
                  ),
                  textStyleYearButton: TextStyle(
                    fontSize: 24,
                    color: MyAppColors.gray900,
                  ),
                  textStyleDayHeader: TextStyle(
                    fontSize: 18,
                    color: MyAppColors.gray900,
                  ),
                  textStyleCurrentDayOnCalendar: TextStyle(
                      fontSize: 16,
                      color: MyAppColors.gray900,
                      fontWeight: FontWeight.bold),
                  textStyleDayOnCalendar: TextStyle(
                    fontSize: 14,
                    color: MyAppColors.gray900,
                  ),
                  textStyleDayOnCalendarSelected: TextStyle(
                    fontSize: 16,
                    color: MyAppColors.white000,
                  ),
                  textStyleDayOnCalendarDisabled: TextStyle(
                      fontSize: 24,
                      color: MyAppColors.gray900.withOpacity(0.1)),
                  textStyleMonthYearHeader: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                      fontSize: 20,
                      color: MyAppColors.gray900,
                      fontWeight: FontWeight.bold),
                  paddingDatePicker: const EdgeInsets.all(0),
                  paddingMonthHeader: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  paddingActionBar: const EdgeInsets.fromLTRB(10, 10, 20, 10),
                  paddingDateYearHeader: const EdgeInsets.all(14),
                  sizeArrow: 30,
                  colorArrowNext: MyAppColors.accent700,
                  colorArrowPrevious: MyAppColors.accent700,
                  textStyleButtonPositive: TextStyle(
                    fontSize: 18,
                    color: MyAppColors.accent800,
                  ),
                  textStyleButtonNegative: TextStyle(
                    fontSize: 18,
                    color: MyAppColors.accent800,
                  ),
                  decorationDateSelected: BoxDecoration(
                    color: MyAppColors.accent800,
                    shape: BoxShape.circle,
                  ),
                  backgroundPicker: MyAppColors.white000,
                  backgroundActionBar: MyAppColors.white000,
                  backgroundHeaderMonth: MyAppColors.white000,
                ),
                styleYearPicker: MaterialRoundedYearPickerStyle(
                  textStyleYear:
                      TextStyle(fontSize: 40, color: MyAppColors.gray800),
                  textStyleYearSelected: TextStyle(
                      fontSize: 56,
                      color: MyAppColors.gray800,
                      fontWeight: FontWeight.bold),
                  heightYearRow: 100,
                  backgroundPicker: MyAppColors.white000,
                ));
            if (newDateTime != null) {
              setState(() => dateTime = newDateTime);
            }
          }),
    );
  }
}
