import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';

class CateGoriesSeletor extends StatefulWidget {
  CateGoriesSeletor(
      {Key? key, required this.categories, this.selectedCategory = ''})
      : super(key: key);
  final Map<String, Widget> categories;
  String selectedCategory;
  @override
  State<CateGoriesSeletor> createState() => _CateGoriesSeletorState();
}

class _CateGoriesSeletorState extends State<CateGoriesSeletor> {
  late String defaultDropdownValue;

  late final dropdownKey;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    dropdownKey = GlobalKey();
    defaultDropdownValue = widget.categories.keys.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
            color: MyAppColors.gray600, style: BorderStyle.solid, width: 0.80),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          padding: EdgeInsets.zero,
          child: DropdownButton<String>(
            value: defaultDropdownValue,
            key: dropdownKey,
            icon: MyAppIcons.arrowDropDown,
            elevation: 16,
            isExpanded: true,
            alignment: Alignment.center,
            underline: null,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (newValue) {
              setState(() {
                defaultDropdownValue = newValue!;
                widget.selectedCategory = newValue;
              });
            },
            items: widget.categories.keys
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: RadioListTile(
                  groupValue: defaultDropdownValue,
                  selected: defaultDropdownValue == value,
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: value,
                  secondary: widget.categories[value],
                  title: Text(
                    value,
                    textAlign: TextAlign.start,
                  ),
                  onChanged: (newValue) {
                    setState(() {
                      widget.selectedCategory = newValue.toString();
                      defaultDropdownValue = newValue.toString();
                      Navigator.pop(dropdownKey.currentContext!);
                    });
                  },
                ),
              );
            }).toList(),
            selectedItemBuilder: (context) {
              return widget.categories.keys.map((String value) {
                return ListTile(
                  title: Text(value),
                  leading: widget.categories[value],
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}
