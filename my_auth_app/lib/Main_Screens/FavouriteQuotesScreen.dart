import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteQuotesScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _deleteFavourite(String docId, BuildContext context) async {
    try {
      final userId = _auth.currentUser?.uid;
      if (userId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User not logged in')),
        );
        return;
      }
      await _firestore
          .collection('users')
          .doc(userId)
          .collection('favourites')
          .doc(docId)
          .delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quote deleted successfully.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting quote: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final userId = _auth.currentUser?.uid;

    if (userId == null) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Navigate back to the settings screen
          Navigator.pop(context);
        },
      ),
      title: Text('User Not Logged In'),
    ),
    body: Center(
      child: Text('User not logged in'),
    ),
  );
}


    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Quotes'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFDAE2F8), Color(0xFFD6A4A4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream: _firestore
              .collection('users')
              .doc(userId)
              .collection('favourites')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error loading data'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No favourite quotes found.'));
            }

            final quotes = snapshot.data!.docs;

            return Center(
              child: Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Favourite Quotes',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DataTable(
                        columnSpacing: 10,
                        columns: const [
                          DataColumn(
                            label: Text(
                              'Quote',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Author',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Actions',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        rows: quotes.map((quote) {
                          final data = quote.data() as Map<String, dynamic>;
                          final docId = quote.id;
                          return DataRow(
                            cells: [
                              DataCell(
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    data['quote'] ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              DataCell(
                                Text(data['author'] ?? ''),
                              ),
                              DataCell(
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () =>
                                      _deleteFavourite(docId, context),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
