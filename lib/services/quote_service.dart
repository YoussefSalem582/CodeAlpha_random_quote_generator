import 'dart:convert';
import 'dart:io';
import '../model/quote.dart';
import '../utils/constants.dart';

class QuoteService {
  static Future<Quote> fetchRandomQuote({String? category}) async {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    final url = category != null
        ? '${Constants.apiUrl}?tags=$category'
        : Constants.apiUrl;

    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      return Quote.fromJson(json.decode(responseBody));
    } else {
      throw Exception('Failed to load quote');
    }
  }
}