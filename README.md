# **Random Quote Generator - Flutter App**  

![Flutter Random Quote App](https://img.shields.io/badge/Flutter-3.0-blue.svg)  
A simple **Flutter application** that generates and displays random quotes. Users can **fetch new quotes** and **share** them on social media.

---

## **📌 Features**
✅ **Fetch Random Quotes** – Retrieves quotes using an API  
✅ **Share Quotes** – Easily share quotes via apps  
✅ **Clean UI** – Simple and elegant material design  
✅ **Responsive Design** – Works on both Android & iOS  

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

## **🛠 Installation**
1️⃣ **Clone the repository**  
```sh
git clone https://github.com/yourusername/random_quote_generator.git
cd random_quote_generator
```
2️⃣ **Install dependencies**  
```sh
flutter pub get
```
3️⃣ **Run the app**  
```sh
flutter run
```

---

## **📜 Dependencies**
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5      # Fetching quotes from API
  share_plus: ^7.0.2 # Sharing functionality
```

---

## **🚀 How It Works**
1. **Launch the app** – Initial message is displayed.  
2. **Tap "Get New Quote"** – Fetches a new random quote.  
3. **Quote appears** – Displays the quote with author name.  
4. **Tap "Share Quote"** – Opens the share dialog.  

---

## **📌 API Used**
- [Quotable API](https://api.quotable.io/random) - Provides random quotes.

---

## **📲 Screenshots**
<img src="screenshot1.png" width="300"> <img src="screenshot2.png" width="300">  

---

## **🛠 Troubleshooting**
| Issue                      | Solution |
|----------------------------|----------|
| App crashes on startup     | Run `flutter pub get` and check for errors. |
| Quotes not loading         | Check internet connection and API status. |
| Sharing not working        | Ensure `share_plus` package is installed. |

---

## **📜 License**
This project is **open-source** under the **MIT License**.
