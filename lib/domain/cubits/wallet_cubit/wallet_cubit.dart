import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_financial_management/domain/blocs/home_bloc/home_bloc.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;
part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  void getWalletTransactions(
    String walletId,
  ) {
    final List<t.Transaction> walletTransitions = [];
    emit(WalletState(walletTransitions: walletTransitions));
  }
}
