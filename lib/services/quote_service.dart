import 'dart:convert';
import 'dart:io';
import '../utils/constants.dart';

class QuoteService {
  static Future<Map<String, dynamic>> fetchRandomQuote() async {
    final client = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    final request = await client.getUrl(Uri.parse(Constants.apiUrl));
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}