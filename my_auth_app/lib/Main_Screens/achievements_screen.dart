import 'package:flutter/material.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Achievements"),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDAE2F8), Color(0xFFD6A4A4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Achievements",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // List of Achievements
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.amber),
                    title: Text("First Quote Viewed"),
                  ),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.amber),
                    title: Text("5 Days Active"),
                  ),
                  ListTile(
                    leading: Icon(Icons.star, color: Colors.amber),
                    title: Text("First Chat Completed"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Back to Home Button
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to HomePage
              },
              child: const Text(
                "Go Back to Home",
                style: TextStyle(fontSize: 16, color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
