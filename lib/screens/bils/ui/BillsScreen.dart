import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bills"),),
      body: Center(
        child: Text("Bills screen"),
      ),
    );
  }
}
