import 'package:expense_project/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/expense_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expense Tracker',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFF5F6FA),
          primaryColor: Colors.indigo,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
