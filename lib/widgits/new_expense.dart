import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  NewExpense({super.key, required this.saveNewExpense});
  void Function(Expense) saveNewExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // Date Picker
  void datepicker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);

    setState(() {
      _selectedDate = pickedDate;
    });
  }

// Save Expense
  void _saveExpense() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        _selectedDate == null ||
        _selectedCategory == null) {
      _showErrorDialog();
      return;
    } else {
      widget.saveNewExpense(Expense(
          amount: enteredAmount,
          date: _selectedDate!,
          title: enteredTitle,
          category: _selectedCategory!));
      Navigator.of(context).pop();
    }
  }

// Alert dialog box
  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Invalid Input'),
        content:
            const Text('Please make sure all fields are filled out correctly.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //inside bottom sheet
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 32.0,
          left: 32,
          right: 32,
          top: 32),
      //main column
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title field
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter title'),
            ),
          ),

          const SizedBox(height: 16),
          // amount field & date picker
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefix: Text('\$  '),
                      border: OutlineInputBorder(),
                      label: Text('Enter Amount')),
                ),
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_selectedDate == null
                      ? 'Pick Date'
                      : formatter.format(_selectedDate!)),
                  IconButton(
                      onPressed: () {
                        // Unfocus the current focus node to dismiss the keyboard

                        datepicker();
                      },
                      icon: const Icon(Icons.date_range))
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black54),
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DropdownButton(
                    underline: const Text(''),
                    value: _selectedCategory,
                    hint: const Text('Category'),
                    items: Category.values.map(
                      (category) {
                        return DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()));
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  ),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                style: const ButtonStyle(),
                child: const Text('cancel'),
              ),
              TextButton(onPressed: _saveExpense, child: const Text('save')),
            ],
          ),
        ],
      ),
    );
  }
}
