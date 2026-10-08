# Movie & Series Listing Application

A Flutter application built with Clean Architecture and BLoC/Cubit to display, filter, and search movies/series from TheMovieDB (TMDB) API.

---

## 🚀 How to Run

### Prerequisites
* Flutter SDK (Version >= 3.0.0)
* Dart SDK
* iOS Simulator / Android Emulator / Physical Device
* iOS Deployment Target: **15.0+** *(required for Xcode 15/16 compatibility)*

### Steps

1. **Clone the repository:**
   ```bash
   git clone https://github.com/GustiawanFN/the_movie_db
   cd the_movie_db
   ```

2. **Get dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the application:**
   ```bash
   flutter run
   ```

   *(Optional)* Use custom API key:
   ```bash
   flutter run --dart-define=TMDB_API_KEY=your_api_key_here
   ```

---

## 🏗️ Implementation & Design Decisions

### Architecture & Folder Structure
This application is built using **Clean Architecture** with a *feature-first* structure (`lib/features/movies/`):
* **Data Layer:** `ApiMovies` (remote datasource), `MovieModel` (JSON parsing), and `MoviesRepositoryImpl`.
* **Domain Layer:** `Movie` entity, `RatingCategory`, `MoviesRepository` abstraction, and `GetMovies` use case.
* **Presentation Layer:** `MoviesCubit` & `MoviesState` for state management, `MoviesScreen`, and reusable UI widgets.

### Client-Side Filtering & Searching
* **Zero Extra API Calls:** All data is fetched once upon opening the app.
* **Reactive Local Filtering:** Search query and rating category filter logic are combined in `MoviesState.filtered` getter. Changing query or rating chip emits a new state and updates the list instantly.

### Dynamic Rating Range Logic
* Implemented `RatingCategoryX.isMatch()` extension method to dynamically compute rating thresholds (`min` and `max`) using next-category references, preventing boundary edge-case bugs.

### Error Handling & UI States
* `AppException` handles network connectivity and HTTP error responses.
* UI manages `loading`, `failure` (with retry action), and `success` states (including empty state handling).