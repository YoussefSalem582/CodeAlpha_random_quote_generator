import 'package:flutter/material.dart';
import '../services/quote_service.dart';
import '../widgets/quote_card.dart';
import 'favorite_quotes.dart';
import '../model/quote.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Quote? _quote;
  final List<Quote> _favoriteQuotes = [];
  String? _selectedCategory;
  final List<String> _categories = ['inspire', 'love', 'life', 'humor'];

  Future<void> _getNewQuote() async {
    print('Fetching new quote...');
    try {
      final Quote quote = await QuoteService.fetchRandomQuote(
        category: _selectedCategory,
      );
      print('Quote fetched: $quote');
      setState(() {
        _quote = quote;
      });
    } catch (e) {
      print('Failed to fetch quote: $e');
    }
  }

  void _toggleFavorite() {
    setState(() {
      if (_quote != null) {
        _quote!.isFavorite = !_quote!.isFavorite;
        if (_quote!.isFavorite) {
          _favoriteQuotes.add(_quote!);
        } else {
          _favoriteQuotes.removeWhere(
            (quote) => quote.content == _quote!.content,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Random Quote Generator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(1, 174, 185, 1.0),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.red),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          FavoriteQuotesScreen(favoriteQuotes: _favoriteQuotes),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: DropdownButton<String>(
                value: _selectedCategory,
                hint: const Text(
                  'Select Category',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                items: _categories.map((String category) {
                  return DropdownMenuItem<String>(
                    value: category,
                    child: Text(
                      category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
                dropdownColor: Colors.grey[900],
              ),
            ),
            Expanded(
              child: Center(
                child: AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  transitionBuilder: (
                    Widget child,
                    Animation<double> animation,
                  ) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: ScaleTransition(
                        scale: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      ),
                    );
                  },
                  child:
                      _quote != null
                          ? QuoteCard(
                            key: ValueKey<String>(_quote!.content),
                            quote: _quote!.content,
                            author: _quote!.author,
                            isFavorite: _quote!.isFavorite,
                            onFavoriteToggle: _toggleFavorite,
                          )
                          : const Text(
                            'Click the button to get a new quote!',
                            style: TextStyle(fontSize: 22),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getNewQuote,
        tooltip: 'New Quote',
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
