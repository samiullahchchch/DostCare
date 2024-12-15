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
        child: LayoutBuilder(
          builder: (context, constraints) {
            return StreamBuilder<QuerySnapshot>(
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

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Favourite Quotes',
                          style: TextStyle(
                            fontSize: constraints.maxWidth > 600 ? 24 : 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columnSpacing: constraints.maxWidth > 600 ? 40 : 10,
                            columns: [
                              DataColumn(
                                label: Text(
                                  'Quote',
                                  style: TextStyle(
                                    fontSize:
                                        constraints.maxWidth > 600 ? 16 : 12,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Author',
                                  style: TextStyle(
                                    fontSize:
                                        constraints.maxWidth > 600 ? 16 : 12,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Actions',
                                  style: TextStyle(
                                    fontSize:
                                        constraints.maxWidth > 600 ? 16 : 12,
                                  ),
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
                                      width: constraints.maxWidth > 600
                                          ? 300
                                          : 150, // Dynamic width
                                      child: Text(
                                        data['quote'] ?? '',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: constraints.maxWidth > 600
                                              ? 14
                                              : 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      data['author'] ?? '',
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth > 600
                                            ? 14
                                            : 12,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    IconButton(
                                      icon:
                                          Icon(Icons.delete, color: Colors.red),
                                      onPressed: () =>
                                          _deleteFavourite(docId, context),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
