# assigment
A new Flutter project.

Assumptions & Enhancements

API Endpoint: The API used is https://jsonplaceholder.typicode.com/posts.
MVVM Pattern: The project follows the MVVM architecture for better code organization and maintainability.
Provider for State Management: The app uses provider for state management, making it scalable.
Error Handling: If an error occurs (network failure, API issue), 
a friendly error message is displayed instead of crashing.
or use http package for api request

lib/
│── main.dart            # Entry point of the application
│── models/
│   ├── post_model.dart        # Data model for API response
│── viewmodels/
│   ├── post_view_model.dart # Handles business logic and API calls
│── views/
│   ├── post_screen.dart # UI screen displaying the data
│── services/
│   ├── post_api_service.dart # Responsible for making API requests

dependencies:
flutter:
sdk: flutter
http: ^1.3.0
provider: ^6.1.2

