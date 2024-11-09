# AirlineBook

**AirlineBook** is a Flutter application that provides users with information on airlines worldwide. It features a list of all airlines, the ability to mark favorites, a search function to find airlines by name, and supports both dark and light theme modes.

## Features

- **Display all airlines**: View a list of airlines from around the globe.
- **Favorites**: Mark airlines as favorites for quick access.
- **Search**: Easily search for airlines by name.
- **Theme Modes**: Switch between light and dark themes.

## Architecture

This application is developed using the **Model-View-ViewModel (MVVM)** pattern to maintain a clean, structured, and testable codebase.

## Packages Used

| Package          | Purpose                                                                                                                                                             |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `go_router`      | Used for routing and navigation throughout the app, making it easier to manage screen transitions.                                                                  |
| `equatable`      | Helps in implementing equality for Dart objects, which is useful for comparing state changes in the app.                                                           |
| `dio`            | Used for making network requests to fetch airline data. `dio` provides a flexible and efficient way to handle API requests.                                        |
| `flutter_bloc`   | Manages state across the app with a reactive approach, simplifying complex state management and improving app performance.                                          |
| `get_it`         | Implements dependency injection, allowing for a clean separation of dependencies and easier management of services within the app.                                  |
| `url_launcher`   | Enables opening external URLs, such as airline websites, directly from the app.                                                                                     |
| `hive`           | Provides lightweight local storage for caching airline data, allowing offline access and reducing the need for repeated API calls.                                  |
| `shared_preferences` | Stores user preferences, such as theme mode selection, persistently, so the app remembers the user’s choice between light and dark mode on relaunch.           |

## Development Process

The app follows best practices in Flutter development with MVVM architecture and state management using `flutter_bloc`. Dependency injection with `get_it` ensures modular and easily testable code.

## Demo

For a live demo of AirlineBook, [click here](#).
