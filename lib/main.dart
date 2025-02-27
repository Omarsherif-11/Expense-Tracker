import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:masroufi/expense.dart';
import 'package:masroufi/structure.dart';

// Main function
void main() {
  runApp(MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Masroufi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// Home widget
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Masroufi")),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Total Expenses Card
              Structure()
            ],
          ),
        ));
  }
}
