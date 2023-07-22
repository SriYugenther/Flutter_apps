import 'package:expense_app/expense_list.dart';
import 'package:flutter/material.dart';
import './expensetype.dart';
import './appbar_button.dart';
import './chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> registeredExpenses = [
    /*Expense(
        title: "Course",
        amount: 120,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "Movie",
        amount: 150,
        date: DateTime.now(),
        category: Category.leisure),*/
  ];

  void addbutton() {
    //this widget is used to create a UI when button in pressed
    showModalBottomSheet(
        useSafeArea:
            true, //this is used to align the bottom sheet after the camera or device features
        context: context,
        isScrollControlled: true,
        builder: (ctx) => AppButtons(
              onAddExpense: addExpense,
            ));
  }

  void addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseindex = registeredExpenses.indexOf(expense);

    setState(() {
      registeredExpenses.remove(expense);
    });

    //this set of code is used to bring back the deleted item by pressing Undo button

    ScaffoldMessenger.of(context)
        .clearSnackBars(); //this will clear all the snack bar when other snack dipalyed

    //snackbark is used to add a undo button and a flash text at the bottm to display the message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted"),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                registeredExpenses.insert(expenseindex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heigth = MediaQuery.of(context).size.height;

    //this maincontent is used to check whether the expense are empty or not
    Widget mainContent = const Center(
      child: Text("No Expense Found!"),
    );
    //if not empty add the expenselist
    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenselist: registeredExpenses,
        removeexpense: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: addbutton,
          icon: const Icon(Icons.add_box_outlined),
        ),
      ], title: const Text("Expense Tracker")),
      body: width < 600
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Chart(expenses: registeredExpenses),
                //const Text("sriyuga"),
                //const SizedBox(
                //  height: 10,
                //),
                //since listview is also a column therefore it is column inside a column
                //so use expanded
                Expanded(
                  child: mainContent,
                ),
              ],
            )
          : Row(
              children: [
                //we wrapped chart also in container because we gave width as double infinity in chart widget
                //since double infinity take all the space if we wrap in expanded it take the given space
                Expanded(
                  child: Chart(expenses: registeredExpenses),
                ),
                Expanded(
                  child: mainContent,
                ),
              ],
            ),
    );
  }
}
