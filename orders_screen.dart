import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // 📦 Sample orders data
  List<Map<String, dynamic>> orders = [
    {
      "name": "Pizza",
      "price": 200,
      "status": "Delivered",
      "date": "25 Apr 2026"
    },
    {
      "name": "Burger",
      "price": 120,
      "status": "On the way",
      "date": "24 Apr 2026"
    },
    {
      "name": "Biryani",
      "price": 180,
      "status": "Delivered",
      "date": "23 Apr 2026"
    },
  ];

  Color getStatusColor(String status) {
    if (status == "Delivered") {
      return Colors.green;
    } else {
      return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Orders"),
        backgroundColor: const Color(0xFFFF5722),
      ),

      body: orders.isEmpty
          ? const Center(
        child: Text(
          "No Orders Yet 📦",
          style: TextStyle(fontSize: 18),
        ),
      )
          : ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.fastfood, color: Color(0xFFFF5722)),

              title: Text(order["name"]),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("₹${order["price"]}"),
                  Text(order["date"]),
                ],
              ),

              trailing: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: getStatusColor(order["status"]),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  order["status"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
