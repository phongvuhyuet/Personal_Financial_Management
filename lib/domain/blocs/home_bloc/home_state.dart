part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }
enum TransactionFilter { week, month, day }

class HomeState extends Equatable {
  const HomeState(
      {this.status = HomeStatus.initial,
      this.transactions = const [],
      this.allTransactions = const [],
      this.filter = TransactionFilter.month,
      this.timestamp = null,
      this.transactionMap = const {},
      this.totalBudget = 0,
      this.spent = 0});

  final HomeStatus status;
  final List<t.Transaction>? transactions;
  final List<t.Transaction>? allTransactions;
  final TransactionFilter filter;
  final Map<String, List<t.Transaction>>? transactionMap;
  final Timestamp? timestamp;
  final num totalBudget;
  final num spent;

  // List<t.Transaction> get filteredTransaction => {
  //   return transactions;
  // };

  HomeState copyWith({
    HomeStatus Function()? status,
    List<t.Transaction> Function()? transactions,
    List<t.Transaction> Function()? allTransactions,
    TransactionFilter Function()? filter,
    Timestamp Function()? timestamp,
    Map<String, List<t.Transaction>>? transactionMap,
    num Function()? totalBudget,
    num Function()? spent,
  }) {
    return HomeState(
      status: status != null ? status() : this.status,
      transactions: transactions != null ? transactions() : this.transactions,
      allTransactions:
          allTransactions != null ? allTransactions() : this.allTransactions,
      filter: filter != null ? filter() : this.filter,
      transactionMap:
          transactionMap != null ? transactionMap : this.transactionMap,
      timestamp: timestamp != null ? timestamp() : this.timestamp,
      totalBudget: totalBudget != null ? totalBudget() : this.totalBudget,
      spent: spent != null ? spent() : this.spent,
    );
  }

  @override
  List<Object?> get props =>
      [status, transactions, filter, timestamp, totalBudget, spent];
}
