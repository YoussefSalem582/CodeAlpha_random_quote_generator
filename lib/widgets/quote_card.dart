import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;
  final bool isFavorite;
  final bool isRead;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onReadToggle;

  const QuoteCard({
    super.key,
    required this.quote,
    required this.author,
    required this.isFavorite,
    required this.isRead,
    required this.onFavoriteToggle,
    required this.onReadToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10,
      shadowColor: Colors.black54,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [Color.fromRGBO(142, 142, 142, 1.0), Color.fromRGBO(1, 174, 185, 1.0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              quote,
              style: const TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontFamily: 'SofadiOne',
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 1.0),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 34),
            Text(
              '- $author',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Ex01',
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black45,
                    offset: Offset(2.0, 1.0),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Share.share('$quote - $author');
                  },
                  icon: const Icon(Icons.share, color: Colors.white),
                  label: const Text('Share', style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: onFavoriteToggle,
                ),
                IconButton(
                  icon: Icon(
                    isRead ? Icons.check_box : Icons.check_box_outline_blank,
                    color: isRead ? Colors.green : Colors.white,
                  ),
                  onPressed: onReadToggle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}