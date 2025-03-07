# **Random Quote Generator - Flutter App**

This is a **Flutter app** that fetches and displays **random quotes**. Users can:
- Generate a new random quote by tapping a button.
- Share the quote via social media or other apps.

This app follows **clean architecture**, separating concerns using `screens`, `services`, `widgets`, and `utils`.

---

## **📂 Project Structure**

```
random_quote_generator/
│── lib/
│   │── main.dart                # Entry point of the application
│   │── screens/
│   │   │── home_screen.dart      # Home screen UI and logic
│   │── services/
│   │   │── quote_service.dart    # Fetches random quotes
│   │── widgets/
│   │   │── quote_card.dart       # UI component for displaying quotes
│   └── utils/
│       │── constants.dart        # App-wide constants (e.g., API URLs)
└── pubspec.yaml                  # Dependencies and assets
```

---

## **🚀 Features**
- **Random Quote Generation**: Fetches quotes from an API.
- **Sharing Quotes**: Easily share quotes via social media or messaging apps.
- **Elegant UI**: Simple and clean design with a material theme.
- **Responsive Design**: Works on both Android and iOS.

---

## **🛠 Dependencies (pubspec.yaml)**
This app uses the following dependencies:
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5      # For API requests
  share_plus: ^7.0.2 # For sharing quotes
```
To install dependencies, run:
```sh
flutter pub get
```

---

## **📌 How It Works**
1. **Launch the app** – Initial message is displayed.
2. **Tap "Get New Quote"** – Fetches a new random quote from the API.
3. **Quote appears** – Shows the quote along with the author's name.
4. **Tap "Share Quote"** – Opens a share dialog to share the quote.

---

## **📝 Code Breakdown**

### **1️⃣ main.dart (Entry Point)**
Initializes the app and sets up the `MaterialApp` theme.

```dart
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random Quote Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}
```

---

### **2️⃣ home_screen.dart (Main UI)**
Handles UI and user interactions.

```dart
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../services/quote_service.dart';
import '../widgets/quote_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _quote = "Click below to get a random quote!";
  String _author = "";

  void _fetchQuote() async {
    final quoteData = await QuoteService.getRandomQuote();
    setState(() {
      _quote = quoteData['quote'];
      _author = quoteData['author'];
    });
  }

  void _shareQuote() {
    final text = '$_quote - $_author';
    Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Quote Generator')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuoteCard(quote: _quote, author: _author),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchQuote,
                child: const Text("Get New Quote"),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _shareQuote,
                child: const Text("Share Quote"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

---

### **3️⃣ quote_service.dart (Fetching Quotes from API)**
Fetches random quotes using the `http` package.

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  static Future<Map<String, String>> getRandomQuote() async {
    final url = Uri.parse('https://api.quotable.io/random');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {
        "quote": data['content'],
        "author": data['author'],
      };
    } else {
      return {
        "quote": "Failed to fetch quote. Try again!",
        "author": "",
      };
    }
  }
}
```

---

### **4️⃣ quote_card.dart (Reusable UI Component)**
Displays quotes inside a styled card.

```dart
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  final String quote;
  final String author;

  const QuoteCard({super.key, required this.quote, required this.author});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              quote,
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "- $author",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}
```

---

### **5️⃣ constants.dart (Constants)**
Stores constants like the API URL.

```dart
const String quoteApiUrl = "https://api.quotable.io/random";
```

---

## **📲 Running the App**
Make sure Flutter is installed and set up. Then run:

```sh
flutter run
```

---

## **✨ Enhancements**
- **Offline Support**: Use `shared_preferences` to save quotes locally.
- **Theming**: Add dark mode support.
- **Animations**: Use `AnimatedOpacity` to create a smooth transition when changing quotes.

---

## **🛠 Troubleshooting**
| Issue                      | Solution |
|----------------------------|----------|
| App crashes on startup     | Run `flutter pub get` and check for errors. |
| Quotes not loading         | Check internet connection and API status. |
| Sharing not working        | Ensure the `share_plus` package is properly installed. |

---

## **📜 License**
This project is open-source under the **MIT License**.
#   C o d e A l p h a _ r a n d o m _ q u o t e _ g e n e r a t o r 
 
 