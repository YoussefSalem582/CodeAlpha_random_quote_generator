import 'dart:io';
import 'package:flutter/material.dart';
import '../widgets/quote_card.dart';
import '../model/quote.dart';

class FavoriteQuotesScreen extends StatelessWidget {
  final List<Quote> _favoriteQuotes;

  const FavoriteQuotesScreen({
    super.key,
    required List<Quote> favoriteQuotes,
  }) : _favoriteQuotes = favoriteQuotes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Favorite Quotes',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(1, 174, 185, 1.0),
        flexibleSpace: Platform.isIOS
            ? null
            : Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: _favoriteQuotes.length,
          itemBuilder: (context, index) {
            final quote = _favoriteQuotes[index];
            return QuoteCard(
              quote: quote.content,
              author: quote.author,
              isFavorite: quote.isFavorite,
              isRead: quote.isRead,
              onFavoriteToggle: () {},
              onReadToggle: () {},
            );
          },
        ),
      ),
    );
  }
}