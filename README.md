# Flutter Dating App UI Assignment

A Flutter-based dating application UI developed as part of a technical assignment.

The application focuses on recreating the provided reference design with a strong emphasis on UI accuracy, reusable components, smooth interactions, responsive layouts, and clean architecture.

---

## 📱 Features

### Home Screen
- Profile discovery cards
- Swipe left/right interaction
- Stacked profile card animation
- Dynamic user data from RandomUser API
- Profile images
- User name and age
- Location
- Trust score
- Reply time
- About section
- The Basics section
- Profile image section
- Simple pleasures section
- Interests & hobbies
- Pull-to-refresh
- Loading state
- Error state

### Other Screens
- Date Now
- Admirers
- Chat
- Events

All screens include working navigation through the bottom navigation bar.

---

## 🌐 API Integration

The Home Screen uses the following API:

`https://randomuser.me/api/?results=20`

The API is used to dynamically populate:

- Profile images
- Names
- Age
- Gender
- Location
- User profiles

No API integration is used for the other screens as per the assignment requirements.

---

## 🏗️ Architecture

The project follows a clean and maintainable architecture using **BLoC** for state management.

```text
lib/
│
├── core/
│   ├── constants/
│   └── theme/
│
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
│
├── domain/
│   └── repositories/
│
├── presentation/
│   ├── bloc/
│   │   └── home/
│   │
│   ├── screens/
│   │
│   └── widgets/
│
└── main.dart
