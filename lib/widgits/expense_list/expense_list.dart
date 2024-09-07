import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgits/expense_list/expense_list_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  ExpenseList({super.key, required this.expenses, required this.removeExpense});

  final List<Expense> expenses;
  void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        child: ExpenseListItem(
          expense: expenses[index],
        ),
      ),
    );
  }
}
