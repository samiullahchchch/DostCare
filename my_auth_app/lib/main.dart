import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/signup_screen.dart';
import 'screens/login_screen.dart';
import 'screens/forget_password.dart';
// import 'screens/home.dart'; // Import the real home screen
import 'package:firebase_core/firebase_core.dart';
import 'Main_Screens/homepage.dart';
import 'Main_Screens/edit_profile_screen.dart';
import 'Main_Screens/achievements_screen.dart';
import 'Main_Screens/quote.dart';
import 'Main_Screens/settings_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Main_Screens/upload.dart'; // Import your upload file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBHU8gRx6jnx86ukCmiw4DX-fYv8WuHozs",
            authDomain: "main-93015.firebaseapp.com",
            projectId: "main-93015",
            storageBucket: "main-93015.firebasestorage.app",
            messagingSenderId: "707502331787",
            appId: "1:707502331787:web:a7618c5b3937214dadc18e",
            measurementId: "G-LM3HMTNY08"));
  } else {
    await Firebase.initializeApp();
  }

  // storeQuotes(); // Call the function to store quotes
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DostCare App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(), // Use the welcome screen as the initial screen
      routes: {
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),
        '/forgot-password': (context) => ForgotPasswordScreen(),
        // App main routes
        '/home': (context) =>
            const HomePage(), // Navigates to the main home page
        '/edit-profile': (context) => const EditProfileScreen(),
        '/achievements': (context) => const AchievementsScreen(),
        '/quote': (context) => DailyQuoteScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100), // Add spacing at the top
            Center(
              child: Image.asset(
                'logo.png', // Replace with the correct path to your logo
                height: 300, // Adjust height for your logo
                width: 300,  // Adjust width for your logo
              ),
            ),
            const SizedBox(height: 1), // Space between logo and content
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to DostCare',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: const Text('Go to Signup'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Go to Login'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
