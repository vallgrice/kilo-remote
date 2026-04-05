# AGENTS.md

## Build Commands

```bash
# Analyze code (lint + typecheck)
flutter analyze --no-fatal-infos --no-fatal-warnings

# Build debug APK
flutter build apk --debug

# Build release APK
flutter build apk --release

# Install APK on device
adb install -r build/app/outputs/flutter-apk/app-release.apk

# Run code generators (freezed, json_serializable, riverpod_generator)
dart run build_runner build --delete-conflicting-outputs

# Run a single test
flutter test test/path/to/test.dart
```

## Project Structure

```
lib/
├── core/
│   ├── api/           # ApiClient, ApiConstants (tRPC endpoints)
│   ├── models/        # Freezed models (session, message, part, etc.)
│   └── transport/     # WebSocket transport, message reducer
├── features/
│   ├── auth/          # Login, device auth, webview auth
│   ├── byok/          # API keys management (data, providers, screens)
│   ├── chat/          # Chat screen, message bubbles, tool cards
│   ├── profile/       # Profile, usage stats
│   └── sessions/      # Sessions list, session card
└── shared/
    ├── router/        # go_router configuration
    ├── theme/         # AppColors, AppTheme
    ├── utils/         # Snackbar utilities
    └── widgets/       # EmptyState, AppIcon, StatusBadge
```

## Code Style

### Imports
- Use `package:` imports for external packages
- Use relative imports (`../../../`) for internal project files
- Group imports: external packages first, then internal packages, then relative imports
- Use `part` directive for generated files (e.g., `part 'model.freezed.dart'`)

### Naming Conventions
- **Classes**: PascalCase (e.g., `SessionNotifier`, `ByokKey`)
- **Files**: snake_case (e.g., `byok_repository.dart`, `session_card.dart`)
- **Constants**: camelCase for values (e.g., `apiConstants.baseUrl`)
- **Private members**: prefix with `_` (e.g., `_ref`, `_storage`)
- **Providers**: suffix with `Provider` (e.g., `byokKeysProvider`, `activeSessionsProvider`)

### Types
- Use Freezed for immutable data models with `@freezed` annotation
- Use `record` types for multiple return values: `Future<({Type1, Type2})>`
- Use `AsyncValue<T>` for async state in Riverpod providers
- Avoid `dynamic` - prefer explicit types

### State Management (Riverpod)
```dart
// Providers
final providerNameProvider = FutureProvider<Type>((ref) async { ... });
final providerNameNotifierProvider = AsyncNotifierProvider<Notifier, State>(Notifier.new);

// Notifiers use ref.read() inside methods, ref.watch() in build()
// Invalidate to refresh: _ref.invalidate(providerNameProvider);
```

### Error Handling
- Return empty collections on error (e.g., `return []`, `return {}`)
- Use try-catch in repository methods, let exceptions propagate
- Show errors via snackbar utility: `showAppSnackbar(context, message: e.toString(), type: SnackbarType.error)`
- Use pattern matching with `switch` for union types (freezed)

### tRPC API Calls
- **GET** for queries (list, fetch): `dio.get(endpoint, queryParameters: {'batch': '1', 'input': '{"0":{}}'})`
- **POST** for mutations (create, update, delete, setEnabled)
- Response parsing: `data[0]['result']['data']` for batch responses
- tRPC may wrap data in `'json'` field - check both patterns

### UI Components
- Use `AppColors` abstract class for all colors (dark theme: background #111318, surface #1C1E24)
- Use `Container` with `decoration: BoxDecoration(borderRadius: BorderRadius.circular())` for cards
- Use `Material` + `InkWell` for tappable areas
- Use `Expanded` children for equal-width flex layouts
- Text: use `TextStyle` with explicit font size, weight, color

### Markdown Rendering
- Use `flutter_markdown` package with `MarkdownBody`
- Customize via `MarkdownStyleSheet.copyWith()`
- Override `blockquote` and `codeblock` styles for dark theme

### Generated Files
- Freezed files: `*.freezed.dart`, `*.g.dart` - DO NOT EDIT
- Run `build_runner` after modifying models
- Models use `@freezed` and `@JsonKey` annotations
