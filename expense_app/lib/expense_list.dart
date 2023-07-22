import 'package:expense_app/expenseitem.dart';
import 'package:expense_app/expensetype.dart';
import 'package:flutter/material.dart';
import './expense.dart';

//this widget will not change it simply display the data therefore use statelesswidget

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenselist, required this.removeexpense});

  final List<Expense> expenselist;
  final void Function(Expense) removeexpense;

  @override
  Widget build(BuildContext context) {
    // we can not use column widget because we need to dispaly 100-1000 expense so column is not a good choise
    //we can use listview which make the lsit scrollable by default
    return ListView.builder(
      itemCount: expenselist.length,
      itemBuilder: (context, index) => Dismissible(
          background: Container(
            // alignment: Alignment.centerRight,
            //child: const Icon(Icons.delete),
            color: Theme.of(context).colorScheme.error.withOpacity(0.70),
            margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal),
          ),
          onDismissed: (direction) {
            removeexpense(expenselist[index]);
          },

          //this key is added because if we remove the item the key is used to tell dart that the item with this key is deleted
          //there are Objectkey and Valuekey
          key: ValueKey(expenselist[index]),
          child: ExpenseItem(expenselist[index])),
    );
  }
}
