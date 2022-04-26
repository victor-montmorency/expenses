import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';

class graphicBar extends StatelessWidget {
  final String? label;
  final double? value;
  final double? percentage;

  graphicBar({this.label, this.percentage, this.value});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return FittedBox(
          child: Column(
            children: [
              Container(child: FittedBox(child: Text('${value.toString()}'))),
              Container(
                height: constraints.maxHeight,
                width: 10,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: percentage,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor)),
                    )
                  ],
                ),
              ),
              Text(label.toString())
            ],
          ),
        );
      },
    );
  }
}
