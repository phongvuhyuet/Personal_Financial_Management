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
  })  : _transactionRepository = transactionRepository,
        _budgetRepository = budgetRepository,
        super(const HomeState()) {
    on<HomeSubscriptionRequested>(_onSubscriptionRequested);
  }
  final TransactionRepository _transactionRepository;
  final BudgetRepository _budgetRepository;
  Future<void> _onSubscriptionRequested(
    HomeSubscriptionRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: () => HomeStatus.loading));
    try {
      List<t.Transaction> transactions =
          await _transactionRepository.getTransactions(DateTime.now());
      Map<String, dynamic> budget =
          await _budgetRepository.getMonthlyBudget(DateTime.now());
      print(budget["totalBudget"]);
      print(budget["spent"]);
      print(transactions);
      emit(state.copyWith(
          status: () => HomeStatus.success,
          transactions: () => transactions,
          totalBudget: () => budget["totalBudget"],
          spent: () => budget["spent"]));
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
