import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> allQuotes = []; // Store all quotes from Firestore
  List<String> filteredQuotes = []; // Store filtered quotes based on search query

  @override
  void initState() {
    super.initState();
    _fetchQuotes(); // Fetch quotes from Firestore when the screen loads
  }

  Future<void> _fetchQuotes() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('quotes').get();

      List<String> quotes = snapshot.docs
          .map((doc) => doc['quote'] as String) // Assuming the field is named 'quote'
          .toList();

      setState(() {
        allQuotes = quotes;
        filteredQuotes = quotes; // Initially show all quotes
      });
    } catch (e) {
      print('Error fetching quotes: $e');
    }
  }

  void _filterQuotes(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredQuotes = allQuotes;
      } else {
        filteredQuotes = allQuotes
            .where((quote) => quote.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDAE2F8), Color(0xFFD6A4A4)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search quotes...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: _filterQuotes, // Filter quotes as the user types
              ),
            ),
            Expanded(
              child: filteredQuotes.isEmpty
                  ? const Center(
                      child: Text(
                        'No quotes found.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      itemCount: filteredQuotes.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 4.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            filteredQuotes[index],
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                            ),
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

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
