import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:masroufi/expense.dart';

class ExListWidget extends StatelessWidget {
  List<Expense> l_ex = [];
  Function(BuildContext, int)? callbackFunction;
  ExListWidget(List<Expense> l, Function(BuildContext, int) func, {super.key}) {
    l_ex = l;
    callbackFunction = func;
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, index) {
        return Slidable(
            endActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                onPressed: (context) => callbackFunction!(context, index),
                icon: Icons.delete,
                backgroundColor: Colors.red.shade300,
              )
            ]),
            child: Card(
                margin: EdgeInsets.all(10),
                elevation: 15,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "\$${l_ex[index].amount.toString()}",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Center(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(l_ex[index].title,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600))),
                            Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Row(children: [
                                  Icon(
                                    Icons.calendar_month,
                                    size: 25,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                      DateFormat('dd-MM-yyyy')
                                          .format(l_ex[index].date),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.clip))
                                ]))
                          ],
                        ))
                      ],
                    ))));
      },
      itemCount: l_ex.length,
    );
  }
}
