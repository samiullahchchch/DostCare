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

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        '/home': (context) => const HomePage(), // Navigates to the main home page
        '/edit-profile': (context) => const EditProfileScreen(),
        '/achievements': (context) => const AchievementsScreen(),
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
    );
  }
}