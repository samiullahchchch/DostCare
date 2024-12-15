import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_auth_app/Main_Screens/FavouriteQuotesScreen.dart';

class SettingsScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _logout(BuildContext context) async {
  try {
    await _auth.signOut();
    Navigator.of(context).pushReplacementNamed('/login'); // Navigate to login page
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error logging out: $e')),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Back arrow icon
          onPressed: () {
            Navigator.of(context)
                .pushReplacementNamed('/home'); // Navigate to homepage
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDAE2F8), Color(0xFFD6A4A4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGradientButton(
                    text: 'Favourite Quotes',
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FavouriteQuotesScreen(),
                        ),
                      );
                    },
                    width:
                        constraints.maxWidth * 0.8, // Responsive button width
                  ),
                  SizedBox(height: 20), // Add spacing between buttons
                  _buildGradientButton(
                    text: 'Logout',
                    onPressed: () => _logout(context),
                    width:
                        constraints.maxWidth * 0.8, // Responsive button width
                    gradientColors: [
                      const Color.fromARGB(255, 136, 227, 255),
                      const Color.fromARGB(255, 48, 6, 161)
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildGradientButton({
    required String text,
    required VoidCallback onPressed,
    required double width,
    List<Color> gradientColors = const [Colors.blue, Colors.purple],
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent, // Remove button's shadow
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
