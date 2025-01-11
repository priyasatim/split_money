import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddExpensesScreen extends StatefulWidget {
  @override
  _AddExpensesScreenState createState() => _AddExpensesScreenState();
}

class _AddExpensesScreenState extends State<AddExpensesScreen> {
  // Controller for TextField inputs
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // Selected option for 'Paid By'
  String _paidBy = 'Me';

  // DatePicker initial date
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // To make the bottom sheet take minimal space
        children: [
          AppBar(
            title: const Text('Add Expenses'),
            automaticallyImplyLeading: false,
            // Disable automatic back button
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          const SizedBox(height: 16),
          // Date Picker Field
          GestureDetector(
            onTap: () => _selectDate(context), // Open Date Picker when tapped
            child: AbsorbPointer(
              child: TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  border: OutlineInputBorder(),
                  hintText: 'Select a date',
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Note Field
          TextField(
            controller: _noteController,
            decoration: const InputDecoration(
              labelText: 'Note',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),

          // Amount Field
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Amount',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),

          // Paid By Option (Radio Buttons)
          Row(
            children: [
              Text(
                'Paid By: ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Radio<String>(
                      value: 'Me',
                      groupValue: _paidBy,
                      onChanged: (value) {
                        setState(() {
                          _paidBy = value!;
                        });
                      },
                    ),
                    const Text('Me'),
                    Radio<String>(
                      value: 'Equally',
                      groupValue: _paidBy,
                      onChanged: (value) {
                        setState(() {
                          _paidBy = value!;
                        });
                      },
                    ),
                    const Text('Equally'),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Save Button
          ElevatedButton(
            onPressed: () {
              // Handle saving the expense logic
              String note = _noteController.text;
              String amount = _amountController.text;
              String paidBy = _paidBy;

              // Display the data or save it to a database, etc.
              print('Note: $note');
              print('Amount: $amount');
              print('Paid By: $paidBy');
              Navigator.of(context)
                  .pop(); // Close the bottom sheet after saving
            },
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 16.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple,
              minimumSize: Size(double.infinity,
                  50), // Text color (overrides the TextStyle color)
            ),
          ),
        ],
      ),
    );
  }

  // Method to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = "${_selectedDate.toLocal()}"
            .split(' ')[0]; // Format date to YYYY-MM-DD
      });
    }
  }
}
