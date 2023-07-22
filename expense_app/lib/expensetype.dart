import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

//creating a variable to format a date in year month date
final formatter = DateFormat.yMEd();

const uuid = Uuid();

enum Category { food, work, travel, leisure }

//creating a map  for category
const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight
};

class Expense {
  Expense({
    //required this.id,
    //we will be creating a new id dyamically once the expense is created

    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  //by using uuid we are intialising a new string to this id
  //: operator after the constructor is called intializer list

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  //final String category;
  //category can be String but but if we give wrong String in place of the category we will not get error but there will problem

  //therefore we are creating a new type using 'enum'

  final Category category;

  //adding function to format the date
  //add intl package to format date
  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expense});

  //creating anathor contructor for the same class
  ExpenseBucket.toCategory(List<Expense> allExpense, this.category)
      : expense = allExpense
            .where((element) => element.category == category)
            .toList();

  final Category category;
  final List<Expense> expense;

  double get totalExpenses {
    double sum = 0;

    for (var element in expense) {
      sum += element.amount;
    }

    return sum;
  }
}
