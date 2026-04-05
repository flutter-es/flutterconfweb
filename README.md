# Flutter Conf Latam Web

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Official website for Flutter Conf Latam - The premier Flutter conference in Latin America.

## Overview

Flutter Conf Latam Web is the public-facing website for the conference, built with Flutter Web. It provides information
about speakers, schedule, venue, sponsors, and ticket sales.

## Features

| Feature             | Description                                                   |
|---------------------|---------------------------------------------------------------|
| **Home**            | Hero section, event features, novelties, and collaborations   |
| **Speakers**        | Browse speakers with detailed profiles and social links       |
| **Schedule**        | Interactive schedule with sessions, workshops, and activities |
| **Venue**           | Event location with maps, amenities, and travel tips          |
| **Pricing**         | Ticket tiers and pricing information                          |
| **Gallery**         | Photo gallery from previous events                            |
| **Organizers**      | Meet the team and allied communities                          |
| **Contact**         | Contact form and social media links                           |
| **Privacy & Terms** | Legal documents (Privacy Policy, Terms of Service)            |

## Prerequisites

Before getting started, make sure you have the following installed:

- **Flutter SDK**: 3.41.0 or higher
- **Dart SDK**: >=3.11.0 <4.0.0
- **Firebase CLI**: For deployment and Firebase configuration
  ```bash
  npm install -g firebase-tools
  ```
- **Google Chrome**: To run the application in development mode

## Project Structure

```
lib/
├── core/
│   ├── dependencies.dart          # Signal initialization
│   ├── responsive/                # Responsive utilities
│   └── widgets/                   # Reusable UI components
│       ├── card/                  # Card components
│       ├── container/             # Layout containers
│       ├── image/                 # Image widgets
│       ├── section/               # Page sections
│       └── text/                  # Text components
├── features/                      # Feature modules
│   ├── contact/                   # Contact page
│   ├── gallery/                   # Photo gallery
│   ├── home/                      # Landing page
│   ├── organizers/                # Organizers & communities
│   ├── pricing/                   # Ticket pricing
│   ├── privacy_terms/             # Legal pages
│   ├── schedule/                  # Event schedule
│   ├── speakers/                  # Speakers listing & details
│   └── venue/                     # Venue information
├── l10n/                          # Localization
│   ├── arb/                       # Translation files (en, es)
│   └── gen/                       # Generated localization
└── main.dart                      # Entry point
```

## Initial Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd flutterconfweb
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure Firebase

This project uses Firebase services provided by `flutter_conf_backend`:

- Firebase Authentication
- Data Connect (SQL Database)
- Firebase Storage
- Firebase Hosting

> **Note:** Firebase data sources and initialization are handled by the `flutter_conf_backend` package.
> This project only needs to generate the `firebase_options.dart` file.

#### Configuration steps:

1. Create a project in [Firebase Console](https://console.firebase.google.com/) (or use an existing one)

2. Login to Firebase CLI:
   ```bash
   firebase login
   ```

3. Configure FlutterFire to generate `firebase_options.dart`:
   ```bash
   # Install FlutterFire CLI if you don't have it
   dart pub global activate flutterfire_cli

   # Configure Firebase for the project
   flutterfire configure \
     --project=<PROJECT_ID> \
     --out=lib/firebase_options.dart \
     --platforms=web
   ```

### 4. Configure environment variables (keys.json)

The project uses a `keys.json` file to store configuration variables. This file is required for building the
application.

Create a `keys.json` file in the root directory with the following structure:

```json
{
  "COUNTRY_PAGE_URL": "https://example.com/country-page",
  "TICKET_PAGE_URL": "https://example.com/tickets",
  "CFP_FORM_URL": "https://example.com/call-for-papers",
  "APP_STORE_URL": "https://apps.apple.com/app/your-app-id",
  "GOOGLE_APP_URL": "https://play.google.com/store/apps/details?id=your.package.name",
  "VENUE_MAP_URL": "https://maps.google.com/your-venue-location",
  "CONTACT_EMAIL": "contact@example.com",
  "FCL_PRIVACY_POLICY_URL": "https://example.com/privacy-policy"
}
```

**Important**: Replace all example values with your actual URLs and configuration.

**Note**: This file should not be committed to version control if it contains sensitive information. Add it to
`.gitignore` if necessary.

### 5. Generate localization files

```bash
flutter gen-l10n
```

## Development

### Running the app

```bash
flutter run -d chrome --dart-define-from-file=keys.json
```

### Running with Firebase Emulators

For local development with mock data, use Firebase Emulators:

1. Navigate to the `flutter_conf_backend` directory and start emulators:
   ```bash
   cd ../flutter_conf_backend
   firebase emulators:start
   ```

2. Run the web app (it will automatically connect to emulators in debug mode):
   ```bash
   flutter run -d chrome --dart-define-from-file=keys.json
   ```

> **Note:** The app automatically uses Firebase emulators when running in debug mode (see `lib/bootstrap.dart:37`).
> Emulator configuration is handled by `flutter_conf_backend` package.

### Build for production

```bash
flutter build web --release --dart-define-from-file=keys.json
```

Compiled files will be generated in `build/web/`

## Deployment to Firebase Hosting

### 1. Configure Firebase Hosting

Hosting configuration is located in `firebase.json` and includes:

- Cache control for JavaScript files
- Rewrites for SPA routing
- Public directory: `build/web`

### 2. Build and deploy

```bash
# Build the application
flutter build web --release --no-tree-shake-icons --dart-define-from-file=keys.json

# Deploy to Firebase Hosting
firebase deploy --project <PROJECT_ID> --only hosting
```

## Architecture

This project follows Clean Architecture principles with Signals for state management:

```
┌─────────────────────────────────────────────────────────────────┐
│                    flutter_conf_latam (web)                     │
│                      (Presentation Layer)                       │
│                                                                 │
│  • Pages and Widgets                                            │
│  • Signals State Management                                     │
│  • Routing with go_router                                       │
│  • Responsive Design                                            │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    flutter_conf_backend                         │
│              (Firebase Data Source Implementations)             │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    flutter_conf_core                            │
│          (Domain Layer - Interfaces, Entities, Repositories)    │
└─────────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    flutter_conf_common                          │
│              (Result type, Exceptions, Utilities)               │
└─────────────────────────────────────────────────────────────────┘
```

## Main Dependencies

| Package                | Purpose                       |
|------------------------|-------------------------------|
| `signals`              | Reactive state management     |
| `go_router`            | Navigation and routing        |
| `flutter_conf_core`    | Domain layer and repositories |
| `flutter_conf_backend` | Firebase implementations      |
| `flutter_conf_common`  | Shared utilities              |
| `cached_network_image` | Image caching                 |
| `flutter_animate`      | Animations                    |
| `google_fonts`         | Google Fonts integration      |
| `rive`                 | Interactive animations        |
| `shared_preferences`   | Local storage for preferences |

## Localization

The project supports multiple languages:

- English (en)
- Spanish (es)

Translation files are located at:

- `lib/l10n/arb/intl_en.arb`
- `lib/l10n/arb/intl_es.arb`

### Adding new translations

1. Edit the `.arb` files in `lib/l10n/arb/`
2. Regenerate localization files:
   ```bash
   flutter gen-l10n
   ```

## Related Packages

| Package                                                                      | Description                                       |
|------------------------------------------------------------------------------|---------------------------------------------------|
| [`flutter_conf_common`](https://github.com/flutter-es/flutter_conf_common)   | Core utilities, Result type, exceptions           |
| [`flutter_conf_core`](https://github.com/flutter-es/flutter_conf_core)       | Domain layer - Interfaces, entities, repositories |
| [`flutter_conf_backend`](https://github.com/flutter-es/flutter_conf_backend) | Firebase implementations                          |

## Troubleshooting

### Flutter SDK not found

Verify that Flutter is installed correctly and in your PATH:

```bash
flutter doctor
```

### l10n errors

Regenerate localization files:

```bash
flutter gen-l10n
```

### Firebase issues

Make sure you have executed:

```bash
flutterfire configure
```

### keys.json not found

Ensure you have created the `keys.json` file in the root directory as described in the configuration section.

## Contributing

1. Create a branch from `main`
2. Make your changes
3. Run analysis: `flutter analyze`
4. Create a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg

[license_link]: https://opensource.org/licenses/MIT

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg

[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
