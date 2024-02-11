import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const DialogBox({
    super.key,
    this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 50,
        vertical: 30,
      ),
      shape: OutlineInputBorder(
        borderSide: BorderSide(
          color: tileColor,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: bgColor,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                label: Text(
                  "Add a new task",
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: "Cancel",
                  onPressed: onCancel,
                ),
                const SizedBox(
                  width: 8,
                ),
                MyButton(
                  text: "Save",
                  onPressed: onSave,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
