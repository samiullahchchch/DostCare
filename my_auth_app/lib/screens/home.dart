import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add the logo here

            const Text(
              'Welcome to Our App',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Your one-stop solution for managing your needs.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Login'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Signup'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
