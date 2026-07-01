# Chat App

A modern chat application built with Flutter and Firebase, designed to provide a simple and fast experience for sign-in, account registration, and messaging.

## Overview

This project is a chat app that supports:

- New account registration and login
- A clean and user-friendly chat interface
- Home, search, and chat screens
- Data storage using Firebase Authentication and Cloud Firestore

## Features

- Firebase Authentication
- Modern UI built with Material Design
- Navigation between main screens such as Login, Register, Home, Chat, and Search
- Ready for future expansion with features like real-time messaging, files, and audio

## Architecture

This project is structured using Clean Architecture principles and State Management to keep the codebase organized, maintainable, and scalable.

## Technologies Used

- Flutter
- Dart
- Firebase Core
- Firebase Auth
- Cloud Firestore
- Dio
- flutter_bloc

## Project Structure

```text
lib/
  main.dart
  core/
  features/
    auth/
    chat/
    home/
    search/
```

## Prerequisites

Before running the project, make sure you have:

- Flutter SDK installed
- Dart SDK installed
- A Firebase project ready
- Android/iOS/Web setup completed as needed

## Setup

1. Clone the repository:

```bash
git clone <repo-url>
cd chat_app
```

2. Install dependencies:

```bash
flutter pub get
```

3. Configure Firebase:

- Create a new Firebase project
- Add the app for Android/iOS/Web
- Download your configuration files and add them to the project
- Make sure the firebase_options.dart file is up to date

4. Run the app:

```bash
flutter run
```

## Important Notes

- If you face Firebase-related issues, verify that your configuration files are correct and match your project.
- More features can be added later, such as:
  - Direct messaging between users
  - Notifications
  - Images and attachments
  - User statuses

## Contributing

If you would like to contribute to this project, you can:

- Open a Pull Request
- Suggest UI or performance improvements
- Add new features

## License

This project is intended for development and learning purposes and can be modified as needed.
