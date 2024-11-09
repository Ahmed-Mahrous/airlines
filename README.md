# AirlineBook

**AirlineBook** is a Flutter application that provides users with information on airlines worldwide. It features a list of all airlines, the ability to mark favorites, a search function to find airlines by name, and supports both dark and light theme modes.

## Features

- **Display all airlines**: View a list of airlines from around the globe.
- **Favorites**: Mark airlines as favorites for quick access.
- **Search**: Easily search for airlines by name.
- **Theme Modes**: Switch between light and dark themes.

## Architecture

This application is developed using the **Model-View-ViewModel (MVVM)** pattern to maintain a clean, structured, and testable codebase.
The app uses **flutter_bloc** for state management and implements **dependency injection** with `get_it` to manage dependencies effectively.
## Packages Used

| Package          | Purpose                                                                                                                                                             |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `go_router`      | Used for routing and navigation throughout the app, making it easier to manage screen transitions.                                                                  |
| `equatable`      | Used for implementing equality in the `AirlineModel`, ensuring that the airline objects are compared properly.                                                          |
| `dio`            | Used for making network requests to fetch airline data. `dio` provides a flexible and efficient way to handle API requests.                                        |
| `flutter_bloc`   | Manages state across the app with a reactive approach, simplifying complex state management and improving app performance.                                          |
| `get_it`         | Implements dependency injection, allowing for a clean separation of dependencies and easier management of services within the app.                                  |
| `url_launcher`   | Enables opening external URLs, such as airline websites, directly from the app.                                                                                     |
| `hive`           | Provides lightweight local storage for caching airline data, allowing offline access and reducing the need for repeated API calls.                                  |
| `shared_preferences` | Stores user preferences, such as theme mode selection, persistently, so the app remembers the user’s choice between light and dark mode on relaunch.           |
| `hive_flutter`          | Integrates `hive` with Flutter, providing a Flutter-specific API for using Hive in Flutter applications.                                                             |
| `cached_network_image`  | Used to display network images with caching, ensuring fast loading times and reducing bandwidth usage.                                                              |
| `flutter_launcher_icons`| Provides a simple way to generate app icons for Android and iOS.                                                                                                   |
| `fluttertoast`          | Displays simple toast messages in the app for quick feedback.                                                                                                      |
| `flutter_svg`           | Used for displaying SVG images within the app, providing a scalable and customizable way to render vector images.                                                    |
| `dartz`                 | A functional programming library for Dart, offering tools such as Option, Either, and other data types.                                                              |
| `hive_generator`        | Provides code generation for Hive, making it easier to work with Hive boxes and models.                                                                             |
| `build_runner`          | Used to run code generation tools, such as `hive_generator`, to generate the necessary files for Hive.                                                               |
| `analyzer`              | A static code analysis tool that helps ensure code quality by checking for errors, warnings, and best practices.                                                     |

