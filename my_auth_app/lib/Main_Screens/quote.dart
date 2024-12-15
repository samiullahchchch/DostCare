import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DailyQuoteScreen extends StatefulWidget {
  @override
  _DailyQuoteScreenState createState() => _DailyQuoteScreenState();
}

class _DailyQuoteScreenState extends State<DailyQuoteScreen> {
  String quote = "Fetching today's quote...";
  String author = "";
  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  List<Map<String, String>> quoteHistory = [];
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    fetchRandomQuote();
  }

  void fetchRandomQuote() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      var snapshot = await firestore.collection('quotes').get();
      var randomIndex = Random().nextInt(snapshot.docs.length);
      var quoteData = snapshot.docs[randomIndex].data();
      setState(() {
        quote = quoteData['quote'];
        author = quoteData['author'];
        currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
        quoteHistory.add({
          'date': currentDate,
          'quote': quote,
        });
      });
    } catch (e) {
      print('Error fetching quote: $e');
    }
  }

  void saveToFavorites() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please log in to save favorites.')),
      );
      return;
    }

    String userId = user.uid;

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('favourites')
          .add({
        'quote': quote,
        'author': author,
        'date_saved': DateTime.now(),
      });

      setState(() {
        isFavorite = true;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quote added to your favorites!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving to favorites: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Inspiration',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      
        body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDAE2F8), Color(0xFFD6A4A4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      '"$quote"',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.indigoAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      '- $author',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigoAccent,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    SizedBox(height: 10.0),
                    IconButton(
                      onPressed: isFavorite ? null : saveToFavorites,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.grey,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Quote History',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigoAccent,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: min(3, quoteHistory.length),
                  itemBuilder: (context, index) {
                    final quoteData =
                        quoteHistory[quoteHistory.length - 1 - index];
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 3.0,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${quoteData['date']}',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey[600],
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '"${quoteData['quote']}"',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}
