import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookServiceScreen extends StatefulWidget {
  @override
  _BookServiceScreenState createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _pickDateTime() async {
    // Open Date Picker
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      // Open Time Picker
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          selectedDate = date;
          selectedTime = time;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Service"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xFF16423C), // Primary color
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Details
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6A9C89).withOpacity(0.1), // Secondary color
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://via.placeholder.com/80',
                      height: 60,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Filter Replacement",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Duration (30 min)",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
            SizedBox(height: 16),

            // Booking Date & Slot
            Text("Booking Date & Slot",
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: _pickDateTime,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF16423C)), // Primary color
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null || selectedTime == null
                          ? "Choose Date & Time"
                          : "${selectedDate!.toLocal()} - ${selectedTime!.format(context)}",
                      style: TextStyle(
                        color: selectedDate == null || selectedTime == null
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                    Icon(Icons.calendar_today,
                        color: Color(0xFF16423C)), // Primary color
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Address Section
            Text("Your Address", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6A9C89).withOpacity(0.1), // Secondary color
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.location_on,
                      color: Color(0xFF16423C)), // Primary color
                  SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter your address",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: () {}, child: Text("Choose From Map")),
                TextButton(
                    onPressed: () {}, child: Text("Use Current Location")),
              ],
            ),
            SizedBox(height: 16),

            // Price Details
            Text("Price Detail", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6A9C89).withOpacity(0.1), // Secondary color
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _priceDetailRow("Price", "\$15.00 x 1 = \$15.00"),
                  _priceDetailRow("Subtotal", "\$15.00"),
                  _priceDetailRow("Tax", "\$4.75"),
                  Divider(color: Colors.grey),
                  _priceDetailRow("Total Amount", "\$19.75", bold: true),
                  SizedBox(height: 8),
                  Text(
                    "Wallet Balance: \$5,117.80",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.go(
                      '/home/servicesList/serviceDetails/booking/bookingConfirmation');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF16423C), // Primary color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                ),
                child: Text(
                  "Confirm",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _priceDetailRow(String label, String value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
          Text(value,
              style: TextStyle(
                  fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
