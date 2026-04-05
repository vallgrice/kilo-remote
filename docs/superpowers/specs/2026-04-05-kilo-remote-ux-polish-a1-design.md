# Spec: Kilo Remote Flutter — UX Polish (A1: Empty States + Error Handling)

**Date:** 2026-04-05
**Sub-Project:** A1 — UX Polish: Empty States + Error Handling
**Status:** Draft

## Overview

Add consistent empty state illustrations and error handling (snackbars + dialogs) across all screens.

## Components

### 1. Empty State Widget

**Location:** `lib/shared/widgets/empty_state.dart`

**Props:**
- `icon` — IconData (e.g., Icons.inbox, Icons.chat_bubble_outline)
- `title` — String (e.g., "No sessions yet")
- `subtitle` — String? (optional description)
- `action` — VoidCallback? (optional action button)

**Visual:**
- Custom illustrated SVG matching warm minimal theme (bronze primary #D4A574)
- Centered layout
- Title in TextPrimary (#F3F4F6), subtitle in TextSecondary (#6B7280)

**Usage Locations:**
| Screen | Icon | Title | Subtitle |
|--------|------|-------|----------|
| Sessions (empty) | `Icons.terminal` | "No sessions yet" | "Start your first CLI session" |
| Chat (no messages) | `Icons.chat_bubble_outline` | "Start the conversation" | "Send a message to begin" |
| Profile (no usage) | `Icons.bar_chart` | "No usage data" | "Usage will appear here" |

### 2. Error Snackbar

**Location:** `lib/shared/widgets/error_snackbar.dart` (or `lib/shared/utils/snackbar_utils.dart`)

**Types:**
| Type | Icon | Color | Duration |
|------|------|-------|----------|
| Info | `Icons.info_outline` | Success (#34D399) | 3s |
| Warning | `Icons.warning_amber` | Warning (#F59E0B) | 5s |
| Error | `Icons.error_outline` | Error (#EF4444) | 5s + action |
| Auth | Dialog modal | — | No auto-dismiss |

**API:**
```dart
void showAppSnackbar(
  BuildContext context, {
  required String message,
  SnackbarType type = SnackbarType.info,
  VoidCallback? onAction,
  String? actionLabel,
})
```

**Behavior:**
- Top snackbar (avoids collision with chat input at bottom)
- Auto-dismiss based on type
- Optional action button for errors (e.g., "Retry")
- Swipe to dismiss

**Auth Failure Dialog:**
```dart
void showAuthErrorDialog(BuildContext context, String message)
```
- Modal dialog with icon, message, "Sign In" button
- No auto-dismiss, requires user action

## Screen Integration

### Sessions Screen
- Empty state when `activeSessions` is empty
- Error snackbar on refresh failure

### Chat Screen
- Empty state when session has no messages (first message)
- Error snackbar on message send failure, WebSocket errors

### Profile Screen
- Empty state when usage stats unavailable
- Error snackbar on profile/balance fetch failure

## Implementation Order

1. Create `empty_state.dart` widget
2. Create `snackbar_utils.dart` with `showAppSnackbar()`
3. Create `auth_error_dialog.dart`
4. Integrate into Sessions Screen
5. Integrate into Chat Screen
6. Integrate into Profile Screen

## Dependencies

- `flutter_svg` (if using SVG for illustrations) or custom `CustomPainter`
- No new dependencies needed (SnackBar is built-in)

## Files to Create

| File | Purpose |
|------|---------|
| `lib/shared/widgets/empty_state.dart` | Reusable empty state widget |
| `lib/shared/utils/snackbar_utils.dart` | Error snackbar helpers |

## Files to Modify

| File | Change |
|------|--------|
| `lib/features/sessions/screens/sessions_screen.dart` | Add empty state, error handling |
| `lib/features/chat/screens/chat_screen.dart` | Add empty state, error handling |
| `lib/features/profile/screens/profile_screen.dart` | Add empty state, error handling |
