import 'package:expense_project/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseProvider with ChangeNotifier {
  final List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  void addExpense(String title, double amount, DateTime date) {
    _expenses.add(
      Expense(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date,
      ),
    );
    notifyListeners();
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  double get totalExpenses {
    return _expenses.fold(0, (sum, e) => sum + e.amount);
  }
}