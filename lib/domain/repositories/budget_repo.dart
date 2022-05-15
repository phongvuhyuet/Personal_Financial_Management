import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;

class BudgetRepository {
  Future<List<int>> getMonthlyBudget(Timestamp month) async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('transactions').get();
    List<t.Transaction> transactions =
        snapshot.docs.map((doc) => t.Transaction.fromSnapshot(doc)).toList();
  }
}
