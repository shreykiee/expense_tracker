import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgits/expense_list/expense_list.dart';
import 'package:expense_tracker/widgits/new_expense.dart';

import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 2000,
      date: DateTime.now(),
      title: "chiken 65",
      category: Category.food,
    ),
    Expense(
      amount: 500,
      date: DateTime.now(),
      title: "Cinema",
      category: Category.leisure,
    ),
  ];

  // new expense
  void addNewExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(
        saveNewExpense: saveNewExpense,
      ),
    );
  }

  //saving new expense
  void saveNewExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }
  //remove expense

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
      //show snackbar & implement UNDO
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 5),
          content: const Text('expense deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () => setState(
              () {
                _registeredExpenses.insert(expenseIndex, expense);
              },
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
        child:
            const Text("There are no expenses , add expenses to display here"));
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        removeExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Expense Tracker")),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Swipe ➡️ to delete expense'),
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 247, 247),
        onPressed: addNewExpense,
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(border: Border.all(), color: Colors.white10),
      ),
    );
  }
}
