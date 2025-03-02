import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewExWidget extends StatelessWidget {
  final titleValue = TextEditingController();
  final amountValue = TextEditingController();
  String? category;
  final Function callBackFunc;
  NewExWidget({required this.callBackFunc});
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Expense title'),
            controller: titleValue,
          ),
          TextField(
              decoration: InputDecoration(labelText: 'Amount in EGP'),
              controller: amountValue),
          DropdownButton<String>(
            hint: Text(
                category == null ? 'Choose a category' : category.toString()),
            value: category,
            items: [
              'Food',
              'Grocery',
              'Gas',
              'Entertainment',
              'Transportation',
              'Health'
            ].map((String item) {
              return DropdownMenuItem<String>(value: item, child: Text(item));
            }).toList(),
            onChanged: (String? chosen) {
              category = chosen;
            },
          ),
          TextButton(
            onPressed: () {
              handlePress();
            },
            child: Text(
              "Add",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }

  void handlePress() {
    callBackFunc(
        t: titleValue.text, a: double.parse(amountValue.text), c: category);
  }
}
