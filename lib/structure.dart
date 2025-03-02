import 'dart:math';
import 'package:flutter/material.dart';
import 'package:masroufi/main.dart';
import 'package:masroufi/newExWidget.dart';
import 'package:masroufi/exListWidget.dart';
import 'package:masroufi/expense.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Structure extends StatefulWidget {
  const Structure({super.key});

  @override
  State<StatefulWidget> createState() {
    return StructureState();
  }
}

class StructureState extends State<Structure> {
  final List<Expense> expenseList = [];
  List<Expense> currentSelection = [];
  final List<String> categories = [
    'Food',
    'Grocery',
    'Gas',
    'Entertainment',
    'Transportation',
    'Health',
    'All'
  ];
  String? filter;
  double total = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(
                "Your total is $total EGP",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        NewExWidget(callBackFunc: addNewExpense),
        DropdownButton(
            hint:
                Text(filter == null ? 'Choose a category' : filter.toString()),
            items: categories.map((String item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                filter = newValue;
              });
              filterItems();
            }),
        ExListWidget(currentSelection, deleteExpense),
        SizedBox(height: 20),
        currentSelection != expenseList
            ? SizedBox()
            : ElevatedButton(
                onPressed: () => setState(() {
                      expenseList.clear();
                    }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade300,
                  foregroundColor: Colors.white,
                  elevation: 5,
                  padding: EdgeInsets.all(15),
                ),
                child: Text('Delete All'))
      ],
    );
  }

  double getTotal() {
    double total = 0;
    for (Expense e in currentSelection) {
      total += e.amount;
    }
    return total;
  }

  void addNewExpense({required String t, required double a, String? c}) {
    setState(() {
      Expense e = Expense(
          title: t,
          amount: a,
          date: DateTime.now(),
          id: DateTime.now().toString(),
          category: c);
      expenseList.add(e);
      filterItems();
    });
  }

  void deleteExpense(BuildContext context, int index) {
    setState(() {
      expenseList.removeAt(index);
      filterItems();
    });
  }

  void filterItems() {
    setState(() {
      if (filter == null || filter!.isEmpty || filter == 'All') {
        currentSelection = expenseList;
      } else {
        currentSelection =
            expenseList.where((item) => item.category == filter).toList();
      }
      total = getTotal();
    });
  }
}
