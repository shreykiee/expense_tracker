import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseListItem extends StatelessWidget {
  const ExpenseListItem({
    super.key,
    required this.expense,
  });
  final expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(expense.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Row(
            children: [
              //amount
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('\$ ${expense.amount.toStringAsFixed(2)}'),
                  ],
                ),
              ),
              // category icon
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Icon(
                            categoryIcons[expense.category],
                          ),
                        ),
                        Text(expense.formatteddate)
                      ],
                    ),
                  ],
                ),
              ),
              //date
            ],
          )
        ],
      ),
    ));
  }
}
