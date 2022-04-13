import 'dart:ffi';

import 'package:expenses/models/transactions.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Graphics extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Graphics(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date.month == weekDay.month;
        bool sameYear = recentTransactions[i].date.year == weekDay.year;
        if (sameYear && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'Value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(30),
      child: Row(children: []),
    );
  }
}
