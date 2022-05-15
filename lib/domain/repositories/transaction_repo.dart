import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;

class TransactionRepository {
  Future<List<t.Transaction>> getTransactions(Timestamp month) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? user = _auth.currentUser;
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('transactions')
        .where(
          "created_at",
        )
        .get();
    var res = snapshot.docs
        .map((doc) => t.Transaction.fromSnapshot(doc))
        .where((element) {
      var u = element.userRef;

      if (user != null && u.id == user.uid) return true;
      return false;
    }).toList();
    return res;
  }
}
