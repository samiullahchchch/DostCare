import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
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
              "Edit Your Profile",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Name Field
            TextField(
              decoration: InputDecoration(
                labelText: "write new username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            // Save Button
            MouseRegion(
              onEnter: (_) {
                // Change button color on hover
                // This will change the color from white to its opposite on hover
              },
              onExit: (_) {
                // Change back to the original color
              },
              child: ElevatedButton(
                onPressed: () {
                  // Add save functionality here if needed
                  Navigator.pop(context); // Navigate back to HomePage
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 118, 250, 255),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: const Text("Save Changes"),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
