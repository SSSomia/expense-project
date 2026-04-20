import 'package:flutter/material.dart';

Widget buildTextField({
  required String label,
  required TextEditingController controller,
  TextInputType? type,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
        ),
      ],
    ),
    child: TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        border: InputBorder.none,
        labelText: label,
      ),
    ),
  );
}