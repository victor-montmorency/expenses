import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';
import '../main.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sem Gastos ainda! Clique no botão para adicionar uma despesa.',
                textAlign: TextAlign.center,
              ),
            ],
          )
        : Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final e = transactions[index];
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(
                                color: Theme.of(context).accentColor,
                                width: 2)),
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                        child: Text(
                          e.value.toString(), //Transaction Value
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.tittle, //Transaction Tittle
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Text(
                            DateFormat('d MMM y').format(e.date),
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
