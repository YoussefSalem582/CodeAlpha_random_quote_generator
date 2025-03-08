# Random Quote Generator

A Flutter application that generates random quotes, allows searching, categorizing, and managing favorite quotes. Built with a clean UI and seamless user experience.

## Features

- **Random Quote Generation**: Fetch random quotes from various categories.
- **Search Quotes**: Search for specific quotes using keywords.
- **Category Filtering**: Filter quotes by categories like Inspire, Love, Life, Humor, etc.
- **Favorites Management**: Bookmark favorite quotes and access them in a dedicated screen.
- **Mark as Read**: Track which quotes you've read with a checkmark.
- **Share Quotes**: Share quotes directly from the app via social media or messaging apps.
- **Responsive UI**: Beautiful gradients, custom fonts, and adaptive layouts.

## Screenshots

<img src="https://github.com/user-attachments/assets/7f3a1573-de37-4dcc-8e41-59d13a44236a" width="240" />
<img src="https://github.com/user-attachments/assets/cad9ee5f-f8cb-4af4-b698-5da764692919" width="240" />
<img src="https://github.com/user-attachments/assets/2917e9c0-4a57-46d0-af00-98a4225032dd" width="240" />
<img src="https://github.com/user-attachments/assets/67d2627e-c05b-401d-9435-3ddaa0847259" width="240" />


## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/quote-generator.git
   cd quote-generator
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## Usage

- **Home Screen**:
  - Tap the refresh button (bottom-right) to generate a new random quote.
  - Use the dropdown to select a category.
  - Type a query in the search bar to find specific quotes.
  - Click the heart icon to add/remove quotes from favorites.
  - Mark quotes as read using the checkbox icon.
  - Share quotes using the share button.

- **Favorites Screen**:
  - Accessible via the heart icon in the app bar.
  - View all favorited quotes in a scrollable list.
  - Navigate back using the back arrow.

## API Reference

This app uses the [Quotable API](https://api.quotable.io) to fetch quotes. 

## Dependencies

- `http`: For making API requests.
- `share_plus`: For sharing quotes externally.
- Flutter packages: `material`, `cupertino` (for iOS compatibility).

*(Ensure these are added to your `pubspec.yaml`.)*

## Contributing

Contributions are welcome! 
1. Fork the project.
2. Create a feature branch (`git checkout -b feature/amazing-feature`).
3. Commit changes (`git commit -m 'Add amazing feature'`).
4. Push to the branch (`git push origin feature/amazing-feature`).
5. Open a Pull Request.

## License

Distributed under the MIT License. See `LICENSE` for details.

## Acknowledgments

- [Quotable API](https://github.com/lukePeavey/quotable) for providing the quote data.
- Flutter community for packages and resources.
```
