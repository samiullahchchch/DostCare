import 'package:flutter/material.dart';

class DailyQuotesScreen extends StatelessWidget {
  const DailyQuotesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily Quotes"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Today's Quote Section
            const Text(
              "Today's Motivational Quote",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFDAE2F8), Color(0xFFD6A4A4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "\"Success is not final, failure is not fatal: It is the courage to continue that counts.\"",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // History Section
            const Text(
              "Quote History",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // List of Past Quotes
            Expanded(
              child: ListView(
                children: const [
                  QuoteHistoryTile(
                    date: "2024-12-05",
                    quote:
                        "\"The only way to do great work is to love what you do.\"",
                  ),
                  QuoteHistoryTile(
                    date: "2024-12-04",
                    quote:
                        "\"Don't watch the clock; do what it does. Keep going.\"",
                  ),
                  QuoteHistoryTile(
                    date: "2024-12-03",
                    quote:
                        "\"Success is not the key to happiness. Happiness is the key to success.\"",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for Individual Quote History Item
class QuoteHistoryTile extends StatelessWidget {
  final String date;
  final String quote;

  const QuoteHistoryTile({
    Key? key,
    required this.date,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              quote,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
