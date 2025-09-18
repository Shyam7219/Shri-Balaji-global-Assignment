# ShriBalaji Global Store

A modern Flutter e-commerce application built with GetX state management, featuring a clean architecture and responsive design.

## Features

-  **Product Catalog**: Browse products with search functionality
-  **Shopping Cart**: Add/remove items with real-time updates
-  **Dark/Light Theme**: Toggle between themes with persistence
-  **Responsive Design**: Works on phones, tablets, and web
-  **Offline Support**: Cached products for offline viewing
-  **Material Design 3**: Modern UI with smooth animations

## Architecture

This app follows Clean Architecture principles with:

- **Features**: Organized by domain (products, cart, theme)
- **Layers**: Presentation → Use Cases → Repositories → Data Sources
- **State Management**: GetX for reactive state management
- **Dependency Injection**: GetX dependency injection
- **Caching**: SharedPreferences for local storage

## Project Structure

```
lib/
├── core/
│   ├── bindings/         # Dependency injection setup
│   ├── constants/        # App-wide constants
│   ├── routes/          # Navigation routes
│   ├── services/        # Core services (cache, etc.)
│   └── utils/           # Utility functions
├── features/
│   ├── cart/            # Shopping cart feature
│   ├── products/        # Product catalog feature
│   └── theme/           # Theme management
└── main.dart           # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (>=2.18.0)
- Dart SDK
- VS Code
- iOS Simulator / Android Emulator

### How to Run the Project

1. **Install dependencies**
   ```bash
   flutter pub get
   ```

2. **Run the app**
   ```bash
   flutter run
   ```
   Or use your IDE's run button to start the app.

3. **For web development**
   ```bash
   flutter run -d chrome
   ```

### Available Commands

```bash
# Get dependencies
flutter pub get

# Run on specific platform
flutter run -d chrome          # Web
flutter run -d ios             # iOS Simulator
flutter run -d android         # Android Emulator

# Run tests
flutter test

# Analyze code
flutter analyze
```

## State Management Choice

### Why GetX?

This project uses **GetX** for state management, chosen for the following reasons:

#### **Simplicity & Productivity**
- **Minimal boilerplate**: GetX requires less code compared to other solutions
- **Fast development**: Quick implementation of reactive state management

#### **Performance**
- **Lightweight**: Small package size with minimal overhead
- **Efficient rebuilds**: Only rebuilds widgets that actually need updates
- **Memory efficient**: Automatic disposal of controllers when not needed

####  **All-in-One Solution**
- **State Management**: Reactive state with `.obs` and `GetBuilder`
- **Dependency Injection**: Built-in DI with `Get.put()` and `Get.find()`
- **Route Management**: Simple navigation with `Get.to()` and `Get.toNamed()`
- **Utils**: Snackbars, dialogs, and theme management


####  **Alternative Considerations**

While GetX was chosen for this project, other viable options include:
- **Bloc**: Great for complex state logic and testing
- **Riverpod**: Modern, compile-safe alternative to Provider

GetX was selected for this e-commerce app because it provides a complete solution with minimal setup, making it perfect for rapid prototyping and small to medium-sized applications.

## API Integration

The app uses the [Fake Store API](https://fakestoreapi.com/) for product data:

- **Endpoint**: `https://fakestoreapi.com/products`
- **Fallback**: Local sample data when offline
- **Caching**: Products cached locally for offline access

## Key Dependencies

- **get**: ^4.6.5 - State management, dependency injection, and routing
- **http**: ^1.5.0 - HTTP client for API calls
- **shared_preferences**: ^2.0.15 - Local storage for caching and theme persistence

## Features in Detail

### Product Catalog
- Grid layout with responsive design
- Search functionality with real-time filtering
- Product images with loading states and error handling
- Pull-to-refresh for data updates

### Shopping Cart
- Add/remove products with animations
- Real-time cart count and total calculation
- Persistent cart state across app sessions
- Clear cart functionality with confirmation

### Theme Management
- Light and dark theme support
- Theme persistence across app restarts
- Smooth theme transitions
- Material Design 3 color schemes

### Offline Support
- Cached product data for offline viewing
- Graceful error handling with user feedback
- Sample products as fallback data

## Testing

The app includes unit tests for:
- Controllers (ProductController, CartController, ThemeController)
- Use Cases (Cart operations)
- Business logic validation

Run tests with:
```bash
flutter test
```

## Performance Optimizations

- **Image Caching**: Network images cached with specified dimensions
- **Lazy Loading**: Products loaded efficiently with pagination support
- **Memory Management**: Proper disposal of controllers and streams
- **Build Optimization**: Const constructors and efficient rebuilds


---

**Built with  using Flutter and GetX**