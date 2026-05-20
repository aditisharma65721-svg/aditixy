import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          // 👤 Profile Section
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://i.imgur.com/BoN9kdC.png",
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "John Doe",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "johndoe@example.com",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // 📦 Options List
          Expanded(
            child: ListView(
              children: [
                profileTile(Icons.person, "Edit Profile"),
                profileTile(Icons.location_on, "Saved Address"),
                profileTile(Icons.shopping_bag, "My Orders"),
                profileTile(Icons.favorite, "Wishlist"),
                profileTile(Icons.payment, "Payment Methods"),
                profileTile(Icons.settings, "Settings"),
                profileTile(Icons.help, "Help & Support"),
                profileTile(Icons.logout, "Logout"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Reusable Tile Widget
  Widget profileTile(IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.redAccent),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
