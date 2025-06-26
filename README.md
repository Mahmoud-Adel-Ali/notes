# 📝 Notes App

A sleek and efficient **Flutter application** for creating, managing, and organizing personal notes. Built with **Hive** for offline local storage, **BLoC** for scalable state management, and supports **scheduled local notifications** using WorkManager and timezone-aware scheduling.

---

---

## ✨ Features

- ✅ Create, edit, and delete notes
- ✅ Offline-first architecture using Hive local database
- ✅ Schedule reminders with local notifications
- ✅ Background task support via WorkManager
- ✅ Custom notification sound & timezone support
- ✅ Clean UI with custom fonts and responsive design
- ✅ State management using the BLoC pattern

---

## 🧱 Architecture Overview

This project follows a clean, layered architecture:

- **Presentation Layer**: UI widgets & screens using `flutter_bloc`
- **Business Logic Layer (BLoC)**: Event-driven state management
- **Data Layer**: Hive for persistent local storage
- **Services Layer**: Notifications, timezones, background workers

---

## 🧰 Tech Stack & Dependencies

| Package | Purpose |
|--------|--------|
| [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | State management (BLoC) |
| [`hive`](https://pub.dev/packages/hive) + [`hive_flutter`](https://pub.dev/packages/hive_flutter) | Local key-value database |
| [`flutter_local_notifications`](https://pub.dev/packages/flutter_local_notifications) | Schedule local alerts |
| [`workmanager`](https://pub.dev/packages/workmanager) | Run background tasks |
| [`flutter_timezone`](https://pub.dev/packages/flutter_timezone) | Handle device timezones |
| [`modal_progress_hud_nsn`](https://pub.dev/packages/modal_progress_hud_nsn) | Loading overlay widgets |
| [`intl`](https://pub.dev/packages/intl) | Date/time formatting |
| [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons) | App launcher customization |
| `Poppins` Font | Smooth and modern UI typography |

---

## 📁 Folder Structure

```bash
lib/
├── blocs/           # BLoC logic and states
├── models/          # Hive data models
├── screens/         # UI screens
├── services/        # Notification & background service handlers
├── widgets/         # Reusable UI components
├── main.dart        # Entry point

---

## 📦 Assets Used

```bash
assets/
├── fonts/
│   └── Poppins-Regular.ttf
├── images/
│   └── (add illustrations if any)
├── sounds/
│   └── notification_sound.mp3

# Clone the project
git clone https://github.com/Mahmoud-Adel-Ali/notes.git
cd notes_app

# Get dependencies
flutter pub get

# Generate Hive TypeAdapters
flutter pub run build_runner build

# Run the app
flutter run

