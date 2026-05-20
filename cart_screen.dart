import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // 🧺 Sample cart items
  List<Map<String, dynamic>> cartItems = [
    {"name": "Pizza", "price": 200, "qty": 1},
    {"name": "Burger", "price": 120, "qty": 1},
    {"name": "Biryani", "price": 180, "qty": 1},
    {"name": "Biryani", "price": 180, "qty": 1},
    {"name": "Biryani", "price": 180, "qty": 1},
  ];

  int getTotal() {
    int total = 0;
    for (var item in cartItems) {
      total += (item["price"] * item["qty"]) as int;
    }
    return total;
  }

  void increaseQty(int index) {
    setState(() {
      cartItems[index]["qty"]++;
    });
  }

  void decreaseQty(int index) {
    setState(() {
      if (cartItems[index]["qty"] > 1) {
        cartItems[index]["qty"]--;
      }
    });
  }

  void removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: const Color(0xFFFF5722),
      ),

      body: cartItems.isEmpty
          ? const Center(
        child: Text(
          "Cart is Empty 🛒",
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        children: [

          // 🧺 CART ITEMS LIST
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(item["name"]),
                    subtitle: Text("₹${item["price"]}"),

                    // ➕➖ QUANTITY
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () => decreaseQty(index),
                        ),

                        Text("${item["qty"]}"),

                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () => increaseQty(index),
                        ),

                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeItem(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // 💰 TOTAL SECTION
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "Total: ₹${getTotal()}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF5722),
                  ),
                  onPressed: () {},
                  child: const Text("Checkout"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
