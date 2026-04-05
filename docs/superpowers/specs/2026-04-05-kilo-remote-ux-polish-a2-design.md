# Spec: Kilo Remote Flutter — Visual UX (A2: Bottom Navigation + Enhanced Empty States)

**Date:** 2026-04-05
**Sub-Project:** A2 — Visual UX: Bottom Navigation + Enhanced Empty States
**Status:** Draft

## Overview

Add bottom navigation (2 tabs: Sessions + Profile) and enhanced empty state illustrations using custom SVG files.

## Components

### 1. Bottom Navigation Shell

**Location:** `lib/shared/widgets/bottom_nav_shell.dart`

**Architecture:**
- `IndexedStack` + `BottomNavigationBar`
- Preserves state when switching tabs
- Two tabs: Sessions, Profile
- Custom `AppIcon` for Sessions tab, `Icons.person` for Profile tab

**Behavior:**
- Initial route: Sessions tab
- Tab switching preserves scroll position and state in each tab
- AppBar moved from individual screens to shell

### 2. Enhanced Empty States

**Location:** `assets/illustrations/*.svg`

**SVG Illustrations** (warm minimal theme, bronze primary #D4A574):
| Screen | SVG File | Content |
|--------|----------|---------|
| Sessions (empty) | `empty_sessions.svg` | Terminal icon with subtle animation concept |
| Chat (no messages) | `empty_chat.svg` | Chat bubble with arrow |
| Profile (no usage) | `empty_usage.svg` | Bar chart/stats visualization |

**Updated EmptyState Widget:**
```dart
class EmptyState extends StatelessWidget {
  // existing props...
  final bool useIllustration; // NEW: Use SVG illustration instead of icon container
}
```

When `useIllustration: true`, display SVG instead of _buildIllustration container.

### 3. Navigation Changes

**`app_router.dart`:**
- Home route becomes `/home` (BottomNavShell)
- `/sessions` → `/home` (redirects to sessions tab)
- `/profile` → `/home` (redirects to profile tab)
- `/chat/:sessionId` remains as-is (chat screen)

**`main.dart`:**
- Change home from `SessionsScreen` to `BottomNavShell`

## Screen Modifications

### Sessions Screen
- Remove AppBar (now in shell)
- Keep RefreshIndicator, ListView, empty state

### Profile Screen
- Remove AppBar (now in shell)
- Keep ListView with profile sections

### Chat Screen
- No changes (chat is not in bottom nav)

## Files to Create

| File | Purpose |
|------|---------|
| `lib/shared/widgets/bottom_nav_shell.dart` | IndexedStack + BottomNavigationBar |
| `assets/illustrations/empty_sessions.svg` | Custom SVG for sessions empty state |
| `assets/illustrations/empty_chat.svg` | Custom SVG for chat empty state |
| `assets/illustrations/empty_usage.svg` | Custom SVG for usage empty state |
| `lib/shared/widgets/empty_state.dart` | Add useIllustration prop |

## Files to Modify

| File | Change |
|------|--------|
| `lib/shared/router/app_router.dart` | Add home route with bottom nav |
| `lib/main.dart` | Change home to BottomNavShell |
| `lib/features/sessions/screens/sessions_screen.dart` | Remove AppBar |
| `lib/features/profile/screens/profile_screen.dart` | Remove AppBar |
| `pubspec.yaml` | Add flutter_svg dependency, assets |

## Implementation Order

1. Add flutter_svg dependency
2. Add SVG assets to pubspec.yaml
3. Create bottom_nav_shell.dart
4. Create SVG illustrations
5. Update empty_state.dart to support SVG
6. Update app_router.dart for bottom nav
7. Update main.dart
8. Remove AppBar from Sessions screen
9. Remove AppBar from Profile screen

## Dependencies

- `flutter_svg` — For rendering SVG illustrations
