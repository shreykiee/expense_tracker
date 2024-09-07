import 'package:expense_tracker/pages/expense.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Expenses(),
      routes: {},
    ),
  );
}
