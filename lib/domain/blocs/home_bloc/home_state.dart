part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }
enum TransactionFilter { week, month, day }

class HomeState extends Equatable {
  const HomeState(
      {this.status = HomeStatus.initial,
      this.transactions = const [],
      this.filter = TransactionFilter.month,
      this.timestamp = null,
      this.budget = null});

  final HomeStatus status;
  final List<t.Transaction> transactions;
  final TransactionFilter filter;
  final Timestamp? timestamp;
  final int? budget;

  // List<t.Transaction> get filteredTransaction => {
  //   return transactions;
  // };

  HomeState copyWith(
      {HomeStatus Function()? status,
      List<t.Transaction> Function()? transactions,
      TransactionFilter Function()? filter,
      Timestamp Function()? timestamp,
      int Function()? budget}) {
    return HomeState(
      status: status != null ? status() : this.status,
      transactions: transactions != null ? transactions() : this.transactions,
      filter: filter != null ? filter() : this.filter,
      timestamp: timestamp != null ? timestamp() : this.timestamp,
      budget: budget != null ? budget() : this.budget,
    );
  }

  @override
  List<Object?> get props => [status, transactions, filter, timestamp, budget];
}
