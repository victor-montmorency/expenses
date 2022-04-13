import 'package:expenses/components/graphics.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'components/TransactionForm.dart';
import 'models/transactions.dart';
import 'components/transactionList.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        accentColor:
            Color.fromARGB(255, 173, 0, 0), //accentColor is the main Color
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        });
  }

  final List<Transaction> _transactions = [];
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      tittle: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: const Text(
          'Gastos Semanais',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Column(children: [
        Graphics(_transactions),
        TransactionList(_transactions),
      ]),
    );
  }
}
