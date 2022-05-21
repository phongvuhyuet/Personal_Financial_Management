import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;
import 'package:personal_financial_management/domain/repositories/budget_repo.dart';
import 'package:personal_financial_management/domain/repositories/repositories.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required TransactionRepository transactionRepository,
    required BudgetRepository budgetRepository,
    required WalletRepository walletRepository,
  })  : _transactionRepository = transactionRepository,
        _budgetRepository = budgetRepository,
        _walletRepository = walletRepository,
        super(const HomeState()) {
    on<HomeSubscriptionRequested>(_onSubscriptionRequested);
  }
  final TransactionRepository _transactionRepository;
  final BudgetRepository _budgetRepository;
  final WalletRepository _walletRepository;
  Future<void> _onSubscriptionRequested(
    HomeSubscriptionRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: () => HomeStatus.loading));
    List<t.Transaction> transactions = await _transactionRepository
        .getTransactions(DateTime.now(), state.filter);
    List<t.Transaction> walletTransactions = await _transactionRepository
        .getWalletTransactions('62850f110946e496d4fba97f');
    Map<String, dynamic> budget =
        await _budgetRepository.getMonthlyBudget(DateTime.now());
    Map<String, dynamic> wallets = await _walletRepository.getAllWallets();
    print(wallets);
    print(budget["totalBudget"]);
    print(budget["spent"]);
    print(transactions);
    print(walletTransactions);
    emit(state.copyWith(
        status: () => HomeStatus.success,
        transactions: () => transactions,
        totalBudget: () => budget["totalBudget"],
        spent: () => budget["spent"]));
  }
}
