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
// import 'dart:convert';

// import 'package:expense_tracker/pages/expense.dart';
// import 'package:flutter/material.dart';
// import 'package:json_theme_plus/json_theme_plus.dart';
// import 'package:flutter/services.dart'; // For rootBundle import 'dart:convert'; // For jsonDecode

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
//   final themeJson = jsonDecode(themeStr);
//   final theme = ThemeDecoder.decodeThemeData(themeJson)!;
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: theme,
//     home: const Expenses(),
//     routes: {},
//   ));
// }
