import 'package:flutter/material.dart';
import '../services/quote_service.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _quote = 'Click the button to get a new quote!';
  String _author = '';

  Future<void> _getNewQuote() async {
    print('Fetching new quote...');
    try {
      final Map<String, dynamic> quote = await QuoteService.fetchRandomQuote();
      print('Quote fetched: $quote');
      setState(() {
        _quote = quote['content'] as String;
        _author = quote['author'] as String;
      });
    } catch (e) {
      print('Failed to fetch quote: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Quote Generator',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(1, 174, 185, 1.0),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child: QuoteCard(quote: _quote, author: _author)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getNewQuote,
        tooltip: 'New Quote',
        child: const Icon(Icons.refresh, color: Colors.white),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}