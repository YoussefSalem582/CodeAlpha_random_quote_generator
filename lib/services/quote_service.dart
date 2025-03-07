import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class QuoteService {
  static Future<Map<String, dynamic>> fetchRandomQuote() async {
    final response = await http.get(Uri.parse(Constants.apiUrl));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load quote');
    }
  }
}