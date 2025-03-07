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

  void _getNewQuote() async {
    print('Fetching new quote...');
    try {
      final quote = await QuoteService.fetchRandomQuote();
      print('Quote fetched: $quote');
      setState(() {
        _quote = quote['content'];
        _author = quote['author'];
      });
    } catch (e) {
      print('Failed to fetch quote: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Quote Generator'),
      ),
      body: Center(
        child: QuoteCard(quote: _quote, author: _author),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getNewQuote,
        tooltip: 'New Quote',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}