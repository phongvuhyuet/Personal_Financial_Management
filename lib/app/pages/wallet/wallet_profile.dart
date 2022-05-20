import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/icons/my_icons.dart';
import 'package:personal_financial_management/app/components/images/my_images.dart';
import 'package:personal_financial_management/domain/models/wallet.dart';

class WalletProfile extends StatefulWidget {
  const WalletProfile({Key? key, required this.walletInfo}) : super(key: key);
  final Wallet walletInfo;

  @override
  State<WalletProfile> createState() => _WalletProfileState();
}

class _WalletProfileState extends State<WalletProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyAppColors.gray050,
        iconTheme: IconThemeData.fallback(),
        titleSpacing: 0.0,
        elevation: 5,
        title: const Text("THÔNG TIN CHI TIẾT",
            style: const TextStyle(
              fontSize: 20,
              color: MyAppColors.gray700,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              children: [Text('aaaaa')],
            )
            // _buildWalletInfo(),
            // _buildWalletHistory(),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletInfo() {
    return Container(
      child: Expanded(
        child: Row(
          children: [
            // FittedBox(fit: BoxFit.cover, child: MyAppImages.walletProfile)
            // MyAppImages.walletProfile
            // Image.asset(
            //   'assets/images/wallet_profile.jpg',
            //   height: 100,
            //   width: 100,
            // ),
            // Text(widget.walletInfo.name),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletHistory() {
    return Container();
  }
}
