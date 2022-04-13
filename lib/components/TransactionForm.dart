import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double)? onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titlecontroller = TextEditingController();

  final valuecontroller = TextEditingController();

  _submitForm() {
    final title = titlecontroller.text;
    final value = double.tryParse(valuecontroller.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit!(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: titlecontroller,
              decoration: InputDecoration(labelText: 'Titulo: '),
              onSubmitted: (_) => _submitForm(),
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              controller: valuecontroller,
              decoration: InputDecoration(labelText: 'Valor: (R\$)'),
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              margin: EdgeInsets.symmetric(vertical: 15),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                minWidth: double.infinity,
                onPressed: _submitForm,
                child: Text(
                  'Nova Transação',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
