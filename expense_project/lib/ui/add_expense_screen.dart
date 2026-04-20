import 'package:expense_project/colors/app_colors.dart';
import 'package:expense_project/widgets/build_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void saveExpense() {
    final title = titleController.text;
    final amount = double.tryParse(amountController.text);

    if (title.isEmpty || amount == null) return;

    Provider.of<ExpenseProvider>(
      context,
      listen: false,
    ).addExpense(title, amount, selectedDate);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(label: "Title", controller: titleController),
            buildTextField(
              label: "Amount",
              controller: amountController,
              type: TextInputType.number,
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Icon
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.indigo,
                      size: 20,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // Date Text
                  Expanded(
                    child: Text(
                      "${selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Pick Button
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2020),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null) {
                        setState(() => selectedDate = picked);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Change",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   children: [
            //     Text("${selectedDate.toLocal()}".split(' ')[0]),
            //     const Spacer(),
            //     TextButton(
            //       child: const Text("Pick Date"),
            //       onPressed: () async {
            //         final picked = await showDatePicker(
            //           context: context,
            //           initialDate: selectedDate,
            //           firstDate: DateTime(2020),
            //           lastDate: DateTime.now(),
            //         );
            //         if (picked != null) {
            //           setState(() => selectedDate = picked);
            //         }
            //       },
            //     ),
            //   ],
            // ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 55,

              decoration: BoxDecoration(
                color: buttonColor,
                // gradient: const LinearGradient(
                //   colors: [Color(0xFF5F6DFF), Color(0xFF8F94FB)],
                // ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: ElevatedButton(
                onPressed: saveExpense,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(0, 255, 254, 254),
                  shadowColor: Colors.transparent,
                ),
                child: const Text(
                  "Save Expense",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
