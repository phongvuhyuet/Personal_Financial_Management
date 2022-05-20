import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:personal_financial_management/app/utils/extentsions.dart';
import 'package:personal_financial_management/domain/blocs/home_bloc/home_bloc.dart';

class DetailView extends StatefulWidget {
  DetailView({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.transactions!.isEmpty) {
          return Container(
            alignment: Alignment.center,
            child: Container(
              alignment: Alignment.center,
              child: EmptyWidget(
                image: null,
                packageImage: PackageImage.Image_1,
                title: 'Không có dữ liệu để hiện thị ròi!!!',
                titleTextStyle: const TextStyle(
                  fontSize: 22,
                  color: Color(0xff9da9c7),
                  fontWeight: FontWeight.w500,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xffabb8d6),
                ),
              ),
            ),
          );
        }

        return Material(
          child: Container(
            child: Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  final element = state.allTransactions!.elementAt(index);

                  return buildListTileExpense(
                    title: element.categoryName,
                    subtitle:
                        "${element.createdAt.day}/${element.createdAt.month.toString().padLeft(2, '0')}/${element.createdAt.year}",
                    amount: element.amount.toString(),
                    isOutPut: element.is_output,
                  );
                },
                itemCount: state.transactions!.length,
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  color: MyAppColors.gray600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
