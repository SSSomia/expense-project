import 'package:expense_project/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(expense.title),
        subtitle: Text(
          DateFormat.yMMMd().format(expense.date),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${expense.amount} EGP"),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                Provider.of<ExpenseProvider>(context, listen: false)
                    .deleteExpense(expense.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}