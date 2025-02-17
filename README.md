# Nüfus360

A cross-platform mobile application for visualizing global demographic data, ethnic groups, and migration patterns.

## Features

- Interactive map visualization with demographic data overlays
- Historical population trends and statistics
- Ethnic group distribution analysis
- Migration pattern visualization
- Data insights with interactive charts and graphs

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Firebase account and project setup
- Android Studio / Xcode for mobile development

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/nufus360.git
```

2. Install dependencies:
```bash
cd nufus360
flutter pub get
```

3. Configure Firebase:
   - Create a new Firebase project
   - Add Android and iOS apps to your Firebase project
   - Download and add the configuration files:
     - Android: `google-services.json` to `android/app/`
     - iOS: `GoogleService-Info.plist` to `ios/Runner/`

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
  ├── constants/     # App constants and configuration
  ├── models/        # Data models
  ├── services/      # Business logic and API services
  ├── utils/         # Utility functions and helpers
  ├── views/         # UI screens
  ├── viewmodels/    # Screen-specific logic
  ├── widgets/       # Reusable UI components
  └── main.dart      # App entry point
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
