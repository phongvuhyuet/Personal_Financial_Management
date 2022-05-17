part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }
enum TransactionFilter { week, month, day }

class HomeState extends Equatable {
  const HomeState(
      {this.status = HomeStatus.initial,
      this.transactions = const [],
      this.filter = TransactionFilter.week,
      this.timestamp = null,
      this.totalBudget = 0,
      this.spent = 0});

  final HomeStatus status;
  final List<t.Transaction>? transactions;
  final TransactionFilter filter;
  final Timestamp? timestamp;
  final num totalBudget;
  final num spent;

  // List<t.Transaction> get filteredTransaction => {
  //   return transactions;
  // };

  HomeState copyWith({
    HomeStatus Function()? status,
    List<t.Transaction> Function()? transactions,
    TransactionFilter Function()? filter,
    Timestamp Function()? timestamp,
    num Function()? totalBudget,
    num Function()? spent,
  }) {
    return HomeState(
      status: status != null ? status() : this.status,
      transactions: transactions != null ? transactions() : this.transactions,
      filter: filter != null ? filter() : this.filter,
      timestamp: timestamp != null ? timestamp() : this.timestamp,
      totalBudget: totalBudget != null ? totalBudget() : this.totalBudget,
      spent: spent != null ? spent() : this.spent,
    );
  }

  @override
  List<Object?> get props =>
      [status, transactions, filter, timestamp, totalBudget, spent];
}
