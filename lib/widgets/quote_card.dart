import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteCard({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              quote,
              //style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '- $author',
              //style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Share.share('$quote - $author');
              },
              icon: const Icon(Icons.share),
              label: const Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}