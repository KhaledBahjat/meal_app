# Meal App


Meal App is a Flutter application designed for creating, saving, and viewing meal recipes. It provides a simple and intuitive interface for users to manage their personal recipe book locally on their device. The app features an onboarding experience for new users and stores all meal data using a local SQLite database.

## Features

- **Onboarding Experience**: A guided introduction for first-time users, explaining the app's functionality.
- **Add Meals**: An easy-to-use form to add new meals with details such as name, image URL, rating, cooking time, and a description.
- **Browse Recipes**: The home screen displays a visually appealing grid of all saved meals.
- **Meal Details**: View detailed information for each meal, including a larger image and full description.
- **Local Database Storage**: All recipes are saved locally on the device using `sqflite`, ensuring data is private and accessible offline.
- **Responsive UI**: The interface is designed to adapt to different screen sizes using `flutter_screenutil`.

## Technology Stack

- **Framework**: Flutter
- **Language**: Dart
- **Database**: `sqflite` for local SQL database storage.
- **Routing**: `go_router` for declarative navigation.
- **UI Packages**:
    - `carousel_slider` & `dots_indicator` for the onboarding screen.
    - `cached_network_image` to efficiently load and cache images from URLs.
    - `flutter_screenutil` for creating a responsive UI.
- **Preferences**: `shared_preferences` to manage the onboarding state.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- You need to have the Flutter SDK installed on your machine. For instructions, see the [official Flutter documentation](https://flutter.dev/docs/get-started/install).

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/khaledbahjat/meal_app.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd meal_app
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the application:**
    ```sh
    flutter run
    ```

## Project Structure

The project's code is organized within the `lib` directory, following a feature-first approach.

```
lib/
├── core/
│   ├── routing/      # App navigation and route configuration (GoRouter)
│   ├── themes/       # Centralized theme data (colors, text styles, assets)
│   └── widget/       # Common reusable widgets
├── screens/
│   ├── add_meals/    # UI and logic for adding a new meal
│   ├── home/         # Home screen UI, data models, and database helper
│   ├── meal_details/ # Screen for displaying details of a single meal
│   └── on_bording_screen/ # Onboarding flow for new users
└── main.dart         # Main entry point of the application
