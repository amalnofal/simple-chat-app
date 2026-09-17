# Scholar Chat App 💬

A simple, real-time group chat mobile application built with **Flutter** and **Firebase**. The app allows users to create accounts, log in, and exchange messages instantly in a shared global chat room. 

State management is handled efficiently using **Cubit** to keep the business logic clean, direct, and separated from the UI.

## ✨ Features

* **User Authentication:** Secure email and password registration and login using Firebase Authentication.
* **Real-time Messaging:** Send and receive messages instantly using Cloud Firestore streams.
* **State Management:** Implemented `AuthCubit` for seamless and predictable authentication state transitions (Loading, Authenticated, Unauthenticated, Failure).
* **Clean Folder Structure:** Codebase organized into cubit, models, pages, repositories, and widgets for maintainability and scalability.
* **Custom UI Components:** Reusable widgets for text fields, buttons, and chat bubbles.
* **Responsive Feedback:** Interactive UI with loading indicators (`modal_progress_hud_nsn`) and customized SnackBars for error handling and success messages.

## 🛠️ Tech Stack

* **Framework:** [Flutter](https://flutter.dev/)
* **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc) (Cubit)
* **Backend as a Service (BaaS):** Firebase
  * Firebase Authentication
  * Cloud Firestore
* **Architecture:** Feature-based / Layered Architecture (Models, Repositories, Cubit, UI)

## 📸 Screenshots

<div align="center">

### Auth Screens

| Login | Register |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/ef561392-0b88-4706-9d6e-7b294c898234" width="220"> | <img src="https://github.com/user-attachments/assets/e201a659-ff7c-45cb-8eab-f87867e6b085" width="220"> |

### Real-time Chat Demo

<img src="https://github.com/user-attachments/assets/37588549-179d-4ca3-913d-959fce8388cc" width="500" alt="Real-time Chat Demo">

</div>

## 📂 Folder Structure

```text
lib/
├── cubit/              # State management classes (AuthCubit, AuthState)
├── helper/             # Global helper functions (e.g., SnackBars)
├── models/             # Data models (UserModel, Message)
├── pages/              # UI Screens (Login, Register, Chat)
├── repositories/       # Data layer handling Firebase calls
├── widgets/            # Reusable UI components
├── constants.dart      # Global constants (colors, keys)
├── firebase_options.dart 
└── main.dart           # App entry point
