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
  final List<String> _categories = ['inspire', 'love', 'life', 'humor', 'wisdom', 'friendship', 'success'];
  List<Quote> _searchResults = [];
  bool _isSearching = false;
  String? _errorMessage;

  Future<void> _getNewQuote() async {
    setState(() {
      _errorMessage = null;
    });
    try {
      final Quote quote = await QuoteService.fetchRandomQuote(
        category: _selectedCategory,
      );
      setState(() {
        _quote = quote;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to fetch quote. Please try again.';
      });
    }
  }

  Future<void> _searchQuotes(String query) async {
    setState(() {
      _errorMessage = null;
    });
    try {
      final List<Quote> quotes = await QuoteService.searchQuotes(query);
      setState(() {
        _searchResults = quotes;
        _isSearching = true;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to search quotes. Please try again.';
      });
    }
  }

  void _toggleFavorite(Quote quote) {
    setState(() {
      quote.isFavorite = !quote.isFavorite;
      if (quote.isFavorite) {
        _favoriteQuotes.add(quote);
      } else {
        _favoriteQuotes.removeWhere((q) => q.content == quote.content);
      }
    });
  }

  void _toggleRead(Quote quote) {
    setState(() {
      quote.isRead = !quote.isRead;
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
                  builder: (context) => FavoriteQuotesScreen(favoriteQuotes: _favoriteQuotes),
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
              child: Column(
                children: [
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Search Quotes',
                      hintStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    onSubmitted: (query) {
                      _searchQuotes(query);
                    },
                  ),
                  const SizedBox(height: 14),
                  DropdownButton<String>(
                    value: _selectedCategory,
                    hint: const Text(
                      'Select Category',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(
                          category,
                          style: const TextStyle(color: Colors.white, fontSize: 18),
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
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: _errorMessage != null
                    ? Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                )
                    : _isSearching
                    ? ListView.builder(
                  itemCount: _searchResults.length,
                  itemBuilder: (context, index) {
                    final quote = _searchResults[index];
                    return QuoteCard(
                      key: ValueKey<String>(quote.content),
                      quote: quote.content,
                      author: quote.author,
                      isFavorite: quote.isFavorite,
                      isRead: quote.isRead,
                      onFavoriteToggle: () => _toggleFavorite(quote),
                      onReadToggle: () => _toggleRead(quote),
                    );
                  },
                )
                    : _quote != null
                    ? FadeTransition(
                  opacity: AlwaysStoppedAnimation(1.0),
                  child: QuoteCard(
                    key: ValueKey<String>(_quote!.content),
                    quote: _quote!.content,
                    author: _quote!.author,
                    isFavorite: _quote!.isFavorite,
                    isRead: _quote!.isRead,
                    onFavoriteToggle: () => _toggleFavorite(_quote!),
                    onReadToggle: () => _toggleRead(_quote!),
                  ),
                )
                    : const Text(
                  'Click the button to get a new quote!',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 100,
        height: 60,
        child: FloatingActionButton(
          onPressed: _getNewQuote,
          tooltip: 'New Quote',
          backgroundColor: Color.fromRGBO(95, 124, 138, 1.0),
          child: const Icon(Icons.refresh, color: Colors.white, size: 36),
        ),
      ),
    );
  }
}