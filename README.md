# 📝 Notes App

A clean and minimal Flutter application for managing and organizing personal notes with notification support, local storage, and offline capabilities.

---

## 🚀 Features

- 📥 Save, edit, and delete notes locally using Hive
- 🕒 Schedule and show local notifications
- 📦 Offline-first architecture using local storage
- ⏰ Background task support via WorkManager
- 🌐 Timezone-aware scheduling
- 🧱 Clean architecture with BLoC state management
- 🎨 Beautiful and responsive UI using custom fonts and assets

---

## 🛠️ Tech Stack

- **Flutter** 💙
- **BLoC** – State Management
- **Hive** – Lightweight key-value database
- **WorkManager** – Background task management
- **Flutter Local Notifications** – Scheduled alerts
- **Intl** – Date and time formatting
- **Timezone** – Handling time zones accurately
- **Modal Progress HUD** – For loading indicators

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
