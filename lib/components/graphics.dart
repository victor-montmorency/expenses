import 'package:flutter/material.dart';

class Graphics extends StatelessWidget {
  const Graphics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Card(
        color: Color.fromARGB(255, 173, 0, 0),
        child: Text(
          'Gráfico',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 5,
      ),
    );
  }
}
