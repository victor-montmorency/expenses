import 'dart:async';
import 'package:flutter/material.dart';
import '../main.dart';

class TransactionForm extends StatelessWidget {
  final titlecontroller = TextEditingController();
  final valuecontroller = TextEditingController();

  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = titlecontroller.text;
    final value = double.tryParse(valuecontroller.text) ?? 0.0;
    if (title.isEmpty || value <= 0) return;

    onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
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
            FlatButton(
                textColor: Color.fromARGB(255, 173, 0, 0),
                onPressed: _submitForm,
                child: Text(
                  'Nova Transação',
                ))
          ],
        ),
      ),
    );
  }
}
