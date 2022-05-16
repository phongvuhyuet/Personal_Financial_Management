import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_financial_management/domain/models/transaction.dart'
    as t;

class TransactionRepository {
  Future<List<t.Transaction>> getTransactions(DateTime qTimestamp) async {
    try {
      String? token = await FirebaseAuth.instance.currentUser?.getIdToken();
      print(token);
      Response<List> res = await Dio().get(
          'http://192.168.20.106:5000/api/transaction',
          options: Options(headers: {'AuthToken': token}),
          queryParameters: {
            'timestamp': qTimestamp.toString(),
            'filter': 'month'
          });
      List? arr = res.data;
      return arr!.map((element) => t.Transaction.fromJson(element)).toList();
    } catch (error) {
      throw error;
    }
  }
}
