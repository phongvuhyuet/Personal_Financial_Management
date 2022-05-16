import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;

class TransactionRepository {
  Future<List<t.Transaction>> getTransactions(Timestamp month) async {
    String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
    print(token);
    var res = await Dio().get('http://localhost:5000/hello',
        options: Options(headers: {'AuthToken': token}));
    print(res);
    return [];
  }
}
