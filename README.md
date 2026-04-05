# Kilo Remote Flutter

Remote client for [Kilo CLI](https://github.com/Kilo-Org/kilo) - a Flutter mobile application for iOS and Android.

This application is designed to work with the [Kilo CLI](https://github.com/Kilo-Org/kilo) to provide a mobile interface for managing CLI sessions.

## Features

- **Sessions Management** - View and manage active Kilo CLI sessions remotely
- **Real-time Chat** - Send messages and receive responses from AI models
- **Model Selection** - Choose between OpenRouter models or your own API keys (BYOK)
- **Usage Statistics** - Track requests, tokens, and costs with a visual calendar
- **User Profile** - View profile information and manage API keys
- **Dark Theme** - Optimized dark UI for comfortable use

## Requirements

- Flutter SDK 3.5.4+
- Android SDK
- Java 17 (for Android builds)
- Android device or emulator

## Getting Started

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Build

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release
```

### 3. Run on Device

```bash
# Install on connected device
adb install -r build/app/outputs/flutter-apk/app-release.apk
```

## Project Structure

```
lib/
├── core/                      # Core functionality
│   ├── api/                   # API client and endpoints
│   ├── models/                # Data models (Freezed)
│   └── transport/             # WebSocket transport
├── features/                  # Feature modules
│   ├── auth/                  # Authentication (login, device auth, webview)
│   ├── byok/                  # Bring Your Own Key management
│   ├── chat/                  # Chat screen and components
│   ├── profile/               # User profile and settings
│   └── sessions/              # Sessions list and management
└── shared/                    # Shared utilities
    ├── router/                # go_router configuration
    ├── theme/                 # App colors and theme
    ├── utils/                 # Utilities (snackbars)
    └── widgets/               # Reusable widgets
```

## Architecture

This app follows **Riverpod** for state management and **Freezed** for immutable data models.

### State Management

```dart
// FutureProvider for async data
final sessionsProvider = FutureProvider<List<Session>>((ref) async {
  return ref.read(repositoryProvider).getSessions();
});

// AsyncNotifierProvider for complex state
final sessionNotifierProvider = AsyncNotifierProvider<SessionNotifier, SessionState>(() {
  return SessionNotifier.new;
});
```

### Data Flow

1. **Repository** - Handles API calls via Dio
2. **Provider** - Manages state with Riverpod
3. **UI** - Consumes state via `ref.watch()` and displays

## Development

### Code Generation

After modifying models, regenerate code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Code Analysis

```bash
flutter analyze --no-fatal-infos --no-fatal-warnings
```

### Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/path/to/test.dart
```

## API Integration

The app communicates with Kilo backend via:

- **REST API** - tRPC endpoints for CRUD operations
- **WebSocket** - Real-time message streaming

### tRPC Format

```dart
// Queries use GET with batch format
dio.get(endpoint, queryParameters: {
  'batch': '1',
  'input': '{"0":{"field":"value"}}'
});

// Mutations use POST
dio.post(endpoint, data: {
  'batch': '1',
  'input': '{"0":{"field":"value"}}'
});
```

## Tech Stack

| Category | Technology |
|----------|------------|
| Framework | Flutter |
| State Management | Riverpod |
| Data Models | Freezed |
| HTTP Client | Dio |
| Routing | go_router |
| WebSocket | web_socket_channel |
| Secure Storage | flutter_secure_storage |
| Markdown Rendering | flutter_markdown |

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run analysis and tests
5. Submit a pull request

## Resources

- [Flutter Documentation](https://docs.flutter.dev)
- [Riverpod Documentation](https://riverpod.dev)
- [Freezed Documentation](https://freezed.dev)

## License

Private - All rights reserved
