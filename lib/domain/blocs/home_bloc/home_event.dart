part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeSubscriptionRequested extends HomeEvent {
  const HomeSubscriptionRequested();
  // final TransactionFilter filter;
  // final DateTime? date;

}

class HomeSubscriptionRequestedWithFilter extends HomeEvent {
  HomeSubscriptionRequestedWithFilter({
    this.filter = TransactionFilter.day,
    required this.date,
  });

  final TransactionFilter filter;
  late DateTime? date;
}
