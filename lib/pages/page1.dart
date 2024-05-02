import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:untitled3/pages/page3.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? _selectedDate;
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Select Date and Time',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(
                'Select Date',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Select Time',
                  style: Theme.of(context).textTheme.bodyLarge!),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              _selectedDate != null
                  ? 'Selected Date: ${DateFormat('dd-MM-yy').format(_selectedDate!)}'
                  : 'No date selected!',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: Text(
              'Selected Time: ${_selectedTime.format(context)}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: _selectedDate != null
                ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Page3(selectedDate: _selectedDate!),
                ),
              );
            }
                : null, 
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blue,
            ),
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
