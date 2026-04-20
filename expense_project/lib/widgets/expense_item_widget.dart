import 'package:expense_project/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import 'package:intl/intl.dart';
class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  IconData getCategoryIcon(String title) {
    if (title.toLowerCase().contains('food')) return Icons.fastfood;
    if (title.toLowerCase().contains('transport')) return Icons.directions_car;
    if (title.toLowerCase().contains('shop')) return Icons.shopping_bag;
    return Icons.attach_money;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Circle
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              getCategoryIcon(expense.title),
              color: Colors.indigo,
            ),
          ),

          const SizedBox(width: 12),

          // Title & Date
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "${expense.date.toLocal()}".split(' ')[0],
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Amount + Delete
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "- ${expense.amount} EGP",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: Colors.grey,
                onPressed: () {
                  Provider.of<ExpenseProvider>(context, listen: false)
                      .deleteExpense(expense.id);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}