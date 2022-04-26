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

  final List<Transaction> _transactions = []; //Main List of Transactions
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where(
      (tr) {
        return tr.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      tittle: title,
      value: value,
      date: date,
    );
    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openTransactionFormModal(context);
        },
        child: Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        actions: [
          if (isLandscape)
            Row(
              children: [
                Text('Exibir Gráfico'),
                Switch(
                    activeColor: Colors.white,
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    }),
              ],
            ),
        ],
        backgroundColor: Theme.of(context).accentColor,
        title: const Text(
          'Gastos Semanais',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: LayoutBuilder(builder: ((context, constraints) {
        return Column(children: [
          if (_showChart || !isLandscape)
            SizedBox(
              child: Graphics(_recentTransactions),
              height: isLandscape
                  ? constraints.maxHeight * 0.4
                  : constraints.maxHeight * 0.2,
            ),
          TransactionList(_transactions, _removeTransaction),
        ]);
      })),
    );
  }
}
