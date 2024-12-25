import 'package:flutter/material.dart';

class OrdersHistoryScreen extends StatelessWidget {
  const OrdersHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF16423C),
        foregroundColor: Colors.white,
        title: const Text('Order History'),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFC4DAD2),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          itemCount: 10, // Replace with dynamic count for real data
          separatorBuilder: (context, index) => const SizedBox(height: 16.0),
          itemBuilder: (context, index) {
            return OrderHistoryItem(
              orderId: '#ORD00${index + 1}',
              date: '12/1${index % 10}/2024',
              total: '\$${(index + 1) * 25.50}',
              status: index % 2 == 0 ? 'Delivered' : 'Pending',
            );
          },
        ),
      ),
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  final String orderId;
  final String date;
  final String total;
  final String status;

  const OrderHistoryItem({
    Key? key,
    required this.orderId,
    required this.date,
    required this.total,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDelivered = status == 'Delivered';

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderId,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF16423C),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                total,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF16423C),
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: isDelivered
                      ? const Color(0xFF6A9C89)
                      : Colors.orange[300],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
