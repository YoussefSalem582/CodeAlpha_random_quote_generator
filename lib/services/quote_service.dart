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

    try {
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        return Quote.fromJson(json.decode(responseBody));
      } else {
        throw Exception('Failed to load quote');
      }
    } catch (e) {
      throw Exception('Failed to load quote: $e');
    }
  }

  static Future<List<Quote>> searchQuotes(String query) async {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    final url = '${Constants.apiUrl}?query=$query';

    try {
      final request = await client.getUrl(Uri.parse(url));
      final response = await request.close();

      if (response.statusCode == 200) {
        final responseBody = await response.transform(utf8.decoder).join();
        final List<dynamic> jsonList = json.decode(responseBody)['results'];
        return jsonList.map((json) => Quote.fromJson(json)).toList();
      } else {
        throw Exception('Failed to search quotes');
      }
    } catch (e) {
      throw Exception('Failed to search quotes: $e');
    }
  }
}