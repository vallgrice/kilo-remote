# Kilo Remote — Warm Minimal Redesign + App Icon

## Overview

Full visual redesign of the Kilo Remote Flutter app from cold dark theme to "Warm Minimal" style (inspired by Claude.ai / ChatGPT). Includes UX fix for missing back navigation in chat, and a new app icon.

## Color Palette

| Token           | Old         | New         |
|-----------------|-------------|-------------|
| background      | `#0D0D0D`   | `#111318`   |
| surface         | `#1A1A1A`   | `#1C1E24`   |
| surfaceElevated | `#252525`   | `#262830`   |
| border          | `#333333`   | `#333840`   |
| primary         | `#3B82F6`   | `#D4A574`   |
| primaryDark     | —           | `#B8956A`   |
| success         | `#22C55E`   | `#34D399`   |
| warning         | `#F59E0B`   | `#F59E0B`   |
| error           | `#EF4444`   | `#EF4444`   |
| textPrimary     | `#FFFFFF`   | `#F3F4F6`   |
| textSecondary   | `#9CA3AF`   | `#6B7280`   |
| codeBackground  | `#1E1E1E`   | `#1A1C22`   |

- `onPrimary` changes from white to dark (`#1F2937`) since the bronze primary is light

## Screen Changes

### 1. Login Screen (`login_screen.dart`)

- Logo: replace blue square + terminal icon with the new app icon (terminal + arrow on bronze gradient, border-radius 22)
- Title: "Kilo Remote" stays, subtitle "Remote client for CLI sessions"
- Primary button "Sign in with Browser": bronze gradient background (`#D4A574` → `#B8956A`), dark text, border-radius 14
- Secondary button "Sign in with Code": transparent with `#333840` border, light text, border-radius 14
- Remove `Icons.language` and `Icons.devices` prefixes from buttons — cleaner without them

### 2. Sessions Screen (`sessions_screen.dart`, `session_card.dart`)

- AppBar: add small app icon (32x32) left of title, title "Sessions" instead of "Kilo Remote"
- Sign-out button: subtle rounded square background (`#1C1E24`)
- Session cards: border-radius 14, background `#1C1E24`, border `#262830`
- Status badge: smaller dot with glow effect (box-shadow), softer green `#34D399`
- Git info: use `⎇` or branch icon instead of `Icons.commit`
- Empty state: use the app icon instead of `Icons.terminal`

### 3. Chat Screen (`chat_screen.dart`) — CRITICAL UX FIX

- **Add back button** in AppBar — `←` icon in a rounded container, navigates to `/sessions`
- AppBar title: show session title (not "Remote Session") with git branch as subtitle
- Connection dot: keep, but use `#34D399` with subtle glow

### 4. Message Bubble (`message_bubble.dart`)

- User messages: bronze gradient background (`#D4A574` → `#B8956A`), dark text (`#1F2937`)
- Assistant messages: `#1C1E24` background, `#262830` border, light text
- Border radius: 18px with 6px on the "tail" corner (unchanged shape, just larger radius)
- No avatars (confirmed by user)

### 5. Chat Input (`chat_input.dart`)

- Container: `#1C1E24` background, `#1E2028` top border
- Text field: `#262830` fill, `#333840` border, border-radius 12
- Send button: 40x40 circle, bronze gradient, dark arrow-up icon
- Mode chips: selected = bronze tint background + bronze border + bronze text; unselected = transparent + `#333840` border + gray text

### 6. Mode Selector (`mode_selector.dart`)

- Selected chip: `rgba(212,165,116,0.15)` background, `rgba(212,165,116,0.3)` border, `#D4A574` text
- Unselected chip: transparent, `#333840` border, `#6B7280` text

### 7. Model Picker (`model_picker.dart`)

- Container: `#333840` border, `#9CA3AF` text

### 8. Tool Card Shell (`tool_card_shell.dart`)

- Background: `#1C1E24` (was surfaceElevated)
- Border: `#262830`
- Running spinner: bronze color instead of blue
- Status icons follow new color scheme

### 9. Working Indicator (`working_indicator.dart`)

- Spinner: bronze color
- Text: `#6B7280`

### 10. Permission Card (`permission_card.dart`)

- Left border: keep warning color
- "Allow Once" button: success color
- Background follows new surface colors

### 11. Question Card (`question_card.dart`)

- Left border: bronze (primary) instead of blue
- Background follows new surface colors

### 12. Status Badge (`status_badge.dart`)

- Colors updated via palette, no structural changes

### 13. Theme (`app_theme.dart`, `app_colors.dart`)

- Update all color constants in `AppColors`
- Add `primaryDark` constant
- `onPrimary` → `#1F2937`
- Update `ElevatedButton` style for bronze primary with dark foreground
- Update `ChipTheme` selected color

## App Icon

Style: Terminal window + send arrow on bronze gradient background.

- Generate as `assets/icon/app_icon.png` (1024x1024)
- Since we can't generate raster images in code, create the icon using Flutter's `CustomPainter` and export, or use a vector approach
- For now: create a simple adaptive icon using `flutter_launcher_icons` package with a solid bronze background and a simple terminal glyph
- Icon concept: rounded terminal window outline (top-left) with small arrow badge (bottom-right), on `#D4A574` → `#B8956A` gradient

## Files to Modify

1. `lib/shared/theme/app_colors.dart` — all color constants
2. `lib/shared/theme/app_theme.dart` — theme adjustments for bronze primary
3. `lib/features/auth/screens/login_screen.dart` — new icon, bronze buttons
4. `lib/features/sessions/screens/sessions_screen.dart` — app icon in AppBar, title
5. `lib/features/sessions/widgets/session_card.dart` — warmer card styling
6. `lib/features/chat/screens/chat_screen.dart` — **back button**, session title in AppBar
7. `lib/features/chat/widgets/message_bubble.dart` — bronze user bubbles
8. `lib/features/chat/widgets/chat_input.dart` — bronze send button, updated field
9. `lib/features/chat/widgets/mode_selector.dart` — bronze selected chip
10. `lib/features/chat/widgets/tool_cards/tool_card_shell.dart` — updated colors
11. `lib/features/chat/widgets/working_indicator.dart` — bronze spinner
12. `lib/features/chat/widgets/permission_card.dart` — updated surface colors
13. `lib/features/chat/widgets/question_card.dart` — bronze accent
14. `lib/shared/widgets/status_badge.dart` — no structural changes (picks up new palette)
15. `pubspec.yaml` — add `flutter_launcher_icons` dev dependency
16. New: `flutter_launcher_icons.yaml` or config in pubspec — icon generation config
17. New: `assets/icon/app_icon.png` — the icon source image

## Out of Scope

- No avatars on messages
- No search in sessions list
- No structural changes to data flow or providers
- No new screens or navigation routes (back button uses existing go_router)
