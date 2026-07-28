# FRESH FOOD TRACKER – Food Freshness & Waste Tracker

A Flutter application for tracking food expiration dates, organizing fridge items, and building better food-consumption habits.

---

## 🚀 Project Overview

**Fresh Food Tracker** helps users monitor the food stored in their fridge and reduce unnecessary food waste.

The application provides four main areas:

- **Fridge**
  - organize food in a six-slot fridge
  - assign an expiration date to each item
  - view freshness with color-coded indicators
  - eat or throw away stored food
- **Eating History**
  - view previously eaten food
  - see the total number of eaten items
  - see the most recently eaten item
- **Trash History**
  - view previously discarded food
  - track the total number of discarded items
  - see the most recently discarded item
- **Settings**
  - switch between light and dark themes
  - switch between English and Turkish
  - reset all locally stored activity

All application data is stored locally on the device. No account, backend, or internet connection is required.

---

## 🧱 Tech Stack

### Application

- Flutter
- Dart
- Material 3
- Feature-based folder structure

### State Management & Navigation

- Flutter Riverpod
- `AsyncNotifier` and `FutureProvider`
- GoRouter

### Local Storage

- SQLite with `sqflite`
- DAO and repository layers
- Shared Preferences

### Localization & Media

- Flutter localization generation
- English and Turkish translations
- `intl` date formatting
- `audioplayers` sound effects
- Local image and audio assets

### Architecture

- Feature layer
- Provider layer
- Service layer
- Repository layer
- DAO layer
- Local SQLite database

---

## ✨ Core Features

- **Six-Slot Fridge**
  - each slot can store one food item
  - empty slots can be filled through a food-selection dialog
  - expiration dates are selected with a date picker
  - all slot data is persisted locally

- **Freshness Tracking**
  - green status for fresh food
  - orange status when two days or fewer remain
  - red status for expired food
  - remaining days are calculated automatically

- **Food Actions**
  - eating food moves it to eating history
  - throwing food away moves it to trash history
  - expired food cannot be eaten
  - completed actions remove the item from its fridge slot
  - eat and trash actions include sound feedback

- **History & Statistics**
  - eating and trash records are stored separately
  - history is ordered from newest to oldest
  - total activity counts are calculated automatically
  - the latest eaten and discarded items are highlighted

- **Theme Preferences**
  - light theme
  - dark theme
  - saved theme preference
  - Material 3 components and custom color schemes

- **Localization**
  - English interface
  - Turkish interface
  - saved language preference
  - localized food names, actions, messages, and statistics

- **Database Reset**
  - clears every fridge slot
  - clears eating history
  - clears trash history
  - preserves the default food catalog

---

## 🍎 Default Food Catalog

The local database is initialized with:

- Apple
- Banana
- Milk
- Cheese
- Egg
- Honey
- Watermelon
- Bread

Each food includes a matching local image asset and a fallback Material icon.

---

## ⏳ Expiration Logic

Food status is calculated from the selected expiration date:

```text
More than 2 days remaining  → Fresh
0 to 2 days remaining      → Expiring Soon
Past expiration date       → Expired
```

Expired items can be moved to trash but cannot be marked as eaten.

---

## ⚙️ Installation

### Requirements

- Flutter `3.16.0` or newer
- Dart SDK `3.0.0` or newer
- Android Studio or Xcode
- An emulator, simulator, or physical device

### Setup

Open the project directory:

```bash
cd fresh_food_tracker-main
```

Install dependencies:

```bash
flutter pub get
```

Check available devices:

```bash
flutter devices
```

Run the application:

```bash
flutter run
```

Run on a specific device:

```bash
flutter run -d <device-id>
```

---

## 📱 Platform Notes

The repository contains Flutter platform projects for Android, iOS, macOS, Windows, Linux, and Web.

The current database implementation uses the standard `sqflite` package and is primarily configured for:

- Android
- iOS
- macOS

Windows, Linux, and Web require a compatible SQLite implementation or another persistence adapter.

---

## 📁 Project Structure

```text
lib
├── core
│   ├── database        # SQLite setup, tables, and seed data
│   ├── l10n            # English and Turkish localization
│   ├── router          # GoRouter routes
│   └── theme           # Light, dark, and component themes
├── data
│   ├── dao             # Direct database operations
│   ├── enum            # Expiration status
│   ├── model           # Application data models
│   ├── provider        # Riverpod providers and notifiers
│   ├── repository      # Data access abstraction
│   └── service         # Fridge, settings, and sound logic
├── features
│   ├── fridge          # Food slots and expiration actions
│   ├── home            # Main navigation dashboard
│   ├── settings        # Theme, language, and database reset
│   ├── stomach         # Eating history and statistics
│   └── trash           # Trash history and statistics
├── shared
│   ├── utils           # Date and food presentation helpers
│   └── widgets         # Reusable dialogs and state widgets
├── main.dart
└── main_widget.dart
```

---

## 💾 Local Data Model

The SQLite database contains four tables:

- `foods`
  - default food catalog
  - image keys
  - default/custom food flag
- `fridge_slots`
  - six fixed fridge positions
  - selected food
  - added and expiration dates
- `eaten_history`
  - eaten food snapshots
  - eating and expiration dates
- `trash_history`
  - discarded food snapshots
  - trash and expiration dates

Theme and language preferences are stored separately with Shared Preferences.

---

## 🛠️ Development Commands

Format the source code:

```bash
dart format lib test
```

Run static analysis:

```bash
flutter analyze
```

Run tests:

```bash
flutter test
```

Build an Android APK:

```bash
flutter build apk
```

Build the iOS application:

```bash
flutter build ios
```

---

## 📌 Notes

- The application works offline and stores its data on the device.
- Theme and language selections remain active after restarting the application.
- Database reset requires user confirmation.
- Local images and sound effects are declared in `pubspec.yaml`.
- Generated files and build outputs are excluded from the repository.
- This project demonstrates Flutter UI development, local persistence, state management, navigation, localization, and layered data architecture.

---

## 📄 License

This repository was developed for educational and portfolio purposes.
