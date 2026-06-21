# ☁️ Flutter Firebase Auth & Firestore App

Welcome to the Week 5 deliverable of my Flutter Development Internship with **DevelopersHub Corporation**. This project marks the transition from front-end UI into full-stack mobile engineering. 

This repository contains a complete, secure user authentication workflow built with Flutter and Firebase. It demonstrates the seamless integration of Firebase Authentication for handling user sessions and Cloud Firestore as a NoSQL backend to securely store, retrieve, and manage dynamic user profile data.

## ✨ Features & Highlights

* **Secure Authentication:** Engineered a complete Login and Sign-up workflow using `FirebaseAuth` (Email/Password).
* **Real-Time Database Integration:** Utilizes `Cloud Firestore` (NoSQL) to securely save and fetch user-specific data (Name and Email) upon account creation and login.
* **Separation of Concerns (Architecture):** Abstracted all backend logic away from the UI into a dedicated `AuthService` class for scalable, clean code.
* **Robust State Management:** Handles loading states (spinners) and displays user-friendly error messages for invalid credentials or network issues.
* **Dynamic Routing:** Automatically routes authenticated users to a protected Profile Screen and unauthenticated users back to the Login Screen.

## 📂 Project Architecture

lib/
│
├── main.dart                      # App entry point & Firebase initialization
├── firebase_options.dart          # Auto-generated Firebase configuration
├── services/
│   └── auth_service.dart          # Handles all Auth and Firestore API calls
└── screens/
    ├── login_screen.dart          # UI for existing user authentication
    ├── signup_screen.dart         # UI for new account creation
    └── profile_screen.dart        # Protected route fetching Firestore data

## 📥 Prerequisites & Downloads

To run this full-stack project locally, you will need to download and install the following tools:
**Flutter SDK**: The core framework required to run the code.
**Node.js (npm)**: Required to install the official Firebase CLI for backend communication.
**Visual Studio**: (For Windows Desktop users only). You must install the "Desktop development with C++" workload and the Windows 10/11 SDK to compile Firebase's native C++ engine.

## 🚀 Getting Started

Follow these steps to run the application on your local machine:
1. **Clone the Repository**
    git clone https://github.com/talhakhan363/flutter_firebase_auth
    cd flutter-firebase-auth
2. **Fetch Dependencies**
    flutter pub get
3. **Firebase Configuration (Optional but Recommended)**
    This repository contains my specific firebase_options.dart file. If you wish to connect this app to your own Firebase backend to see the data populate in your own console:
    Delete the existing firebase_options.dart file.
    Install the Firebase CLI: npm install -g firebase-tools
    Log in to your account: firebase login
    Configure your project: dart pub global run flutterfire_cli:flutterfire configure
4. **Run the Application**
    (Note: The first time you build a Firebase project for Windows Desktop, it may take 5-10 minutes to compile the C++ dependencies. Subsequent builds will be fast.)
    flutter run

## 👨‍💻 Author

Muhammad Talha Khan
Software Engineering Undergraduate, UBIT Class of 2026
Flutter Developer | Project Management Memeber (MLSA/GDSC)
GitHub: @talhakhan363
LinkedIn: https://www.linkedin.com/in/muhammad-talha-khan-298941212


