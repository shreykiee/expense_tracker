import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

// from  package class of id generator
const uuid = Uuid();

// from package class of date formatter

final formatter = DateFormat.yMd();

//creating custom ENUM for category
enum Category { food, travel, leisure, work }

//creating icons for category
const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff_rounded,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
};

class Expense {
  Expense({
    required this.amount,
    required this.date,
    required this.title,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formatteddate => formatter.format(date);
}
