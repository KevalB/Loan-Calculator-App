import 'package:flutter/material.dart';
import 'calc_screen.dart';

void main() => runApp(MaterialApp(home: MainScreen()));

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Calculator App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CalculatorScreen(),
                ));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange, // Light orange color
                padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
              ),
              child: Text(
                'Loan Calculator',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
