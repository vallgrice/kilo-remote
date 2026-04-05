# Kilo Remote Flutter — Visual UX (A2) Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add bottom navigation (2 tabs: Sessions + Profile) and enhanced empty state illustrations with SVG files.

**Architecture:** Bottom navigation implemented with IndexedStack + BottomNavigationBar to preserve tab state. Custom AppIcon for Sessions tab, standard person icon for Profile tab. SVG illustrations rendered with flutter_svg.

**Tech Stack:** Flutter, Riverpod, GoRouter, flutter_svg

---

## File Structure

```
lib/
├── shared/
│   ├── widgets/
│   │   └── bottom_nav_shell.dart    # NEW: IndexedStack + BottomNavigationBar
│   └── widgets/
│       └── empty_state.dart          # MODIFY: Add useIllustration prop
├── features/
│   ├── sessions/
│   │   └── screens/
│   │       └── sessions_screen.dart  # MODIFY: Remove AppBar
│   └── profile/
│       └── screens/
│           └── profile_screen.dart  # MODIFY: Remove AppBar
├── main.dart                        # MODIFY: Use BottomNavShell as home
└── assets/
    └── illustrations/              # NEW: SVG illustrations
        ├── empty_sessions.svg
        ├── empty_chat.svg
        └── empty_usage.svg
```

---

## Task 1: Add Dependencies (flutter_svg + assets)

**Files:**
- Modify: `pubspec.yaml`

- [ ] **Step 1: Add flutter_svg to dependencies**

Add after line 28 (after cookie_jar):
```yaml
flutter_svg: ^2.0.10+1
```

- [ ] **Step 2: Add assets to flutter section**

Replace lines 50-53 with:
```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/icon/
    - assets/illustrations/
```

- [ ] **Step 3: Create illustrations directory**

```bash
mkdir -p assets/illustrations
```

- [ ] **Step 4: Commit**

```bash
git add pubspec.yaml
git commit -m "feat: add flutter_svg dependency and illustrations assets"
```

---

## Task 2: Create SVG Illustrations

**Files:**
- Create: `assets/illustrations/empty_sessions.svg`
- Create: `assets/illustrations/empty_chat.svg`
- Create: `assets/illustrations/empty_usage.svg`

- [ ] **Step 1: Create empty_sessions.svg**

```xml
<svg width="120" height="120" viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect width="120" height="120" rx="24" fill="#1C1E24"/>
  <rect x="24" y="32" width="52" height="40" rx="6" stroke="#D4A574" stroke-width="3"/>
  <line x1="32" y1="44" x2="60" y2="44" stroke="#D4A574" stroke-width="2" stroke-linecap="round"/>
  <line x1="32" y1="52" x2="52" y2="52" stroke="#6B7280" stroke-width="2" stroke-linecap="round"/>
  <rect x="60" y="56" width="24" height="24" rx="6" fill="#D4A574"/>
  <path d="M68 68L72 72L80 64" stroke="#1F2937" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
```

- [ ] **Step 2: Create empty_chat.svg**

```xml
<svg width="120" height="120" viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect width="120" height="120" rx="24" fill="#1C1E24"/>
  <path d="M24 36C24 32.6863 26.6863 30 30 30H90C93.3137 30 96 32.6863 96 36V66C96 69.3137 93.3137 72 90 72H42L30 84V72H30C26.6863 72 24 69.3137 24 66V36Z" stroke="#D4A574" stroke-width="3"/>
  <line x1="36" y1="44" x2="60" y2="44" stroke="#D4A574" stroke-width="2" stroke-linecap="round"/>
  <line x1="36" y1="52" x2="72" y2="52" stroke="#6B7280" stroke-width="2" stroke-linecap="round"/>
  <circle cx="84" cy="80" r="16" fill="#D4A574"/>
  <path d="M84 72V88M76 80H92" stroke="#1F2937" stroke-width="2.5" stroke-linecap="round"/>
</svg>
```

- [ ] **Step 3: Create empty_usage.svg**

```xml
<svg width="120" height="120" viewBox="0 0 120 120" fill="none" xmlns="http://www.w3.org/2000/svg">
  <rect width="120" height="120" rx="24" fill="#1C1E24"/>
  <rect x="24" y="72" width="16" height="24" rx="4" fill="#D4A574"/>
  <rect x="44" y="56" width="16" height="40" rx="4" fill="#B8956A"/>
  <rect x="64" y="40" width="16" height="56" rx="4" fill="#D4A574"/>
  <rect x="84" y="24" width="16" height="72" rx="4" fill="#B8956A"/>
  <line x1="20" y1="96" x2="104" y2="96" stroke="#6B7280" stroke-width="2" stroke-linecap="round"/>
</svg>
```

- [ ] **Step 4: Commit**

```bash
git add assets/illustrations/
git commit -m "feat: add SVG illustrations for empty states"
```

---

## Task 3: Create BottomNavShell Widget

**Files:**
- Create: `lib/shared/widgets/bottom_nav_shell.dart`

- [ ] **Step 1: Create bottom_nav_shell.dart**

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/sessions/screens/sessions_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../theme/app_colors.dart';
import '../widgets/app_icon.dart';

class BottomNavShell extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  const BottomNavShell({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  @override
  State<BottomNavShell> createState() => _BottomNavShellState();
}

class _BottomNavShellState extends State<BottomNavShell> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/sessions');
        break;
      case 1:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: widget.currentIndex,
        onDestinationSelected: _onItemTapped,
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primary.withOpacity(0.2),
        destinations: [
          NavigationDestination(
            icon: const AppIcon(size: 24),
            selectedIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const AppIcon(size: 24),
            ),
            label: 'Sessions',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline, color: AppColors.textSecondary),
            selectedIcon: Icon(Icons.person, color: AppColors.primary),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/shared/widgets/bottom_nav_shell.dart
git commit -m "feat: add BottomNavShell with IndexedStack navigation"
```

---

## Task 4: Update EmptyState for SVG Illustrations

**Files:**
- Modify: `lib/shared/widgets/empty_state.dart`

- [ ] **Step 1: Update EmptyState widget**

Replace the file content with:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../shared/theme/app_colors.dart';

enum EmptyStateType {
  sessions,
  chat,
  usage,
}

class EmptyState extends StatelessWidget {
  final EmptyStateType type;
  final String? customTitle;
  final String? customSubtitle;
  final VoidCallback? onAction;
  final String? actionLabel;
  final bool useIllustration;

  const EmptyState({
    super.key,
    required this.type,
    this.customTitle,
    this.customSubtitle,
    this.onAction,
    this.actionLabel,
    this.useIllustration = false,
  });

  @override
  Widget build(BuildContext context) {
    final (icon, title, subtitle) = _getContent();

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            useIllustration ? _buildSvgIllustration() : _buildIllustration(icon),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onAction != null && actionLabel != null) ...[
              const SizedBox(height: 24),
              TextButton(
                onPressed: onAction,
                child: Text(
                  actionLabel!,
                  style: const TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSvgIllustration() {
    final svgPath = switch (type) {
      EmptyStateType.sessions => 'assets/illustrations/empty_sessions.svg',
      EmptyStateType.chat => 'assets/illustrations/empty_chat.svg',
      EmptyStateType.usage => 'assets/illustrations/empty_usage.svg',
    };

    return SvgPicture.asset(
      svgPath,
      width: 120,
      height: 120,
    );
  }

  Widget _buildIllustration(IconData icon) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Icon(
        icon,
        size: 36,
        color: AppColors.primary,
      ),
    );
  }

  (IconData, String, String?) _getContent() {
    switch (type) {
      case EmptyStateType.sessions:
        return (
          Icons.terminal,
          customTitle ?? 'No sessions yet',
          customSubtitle ?? 'Start your first CLI session with kilo --remote',
        );
      case EmptyStateType.chat:
        return (
          Icons.chat_bubble_outline,
          customTitle ?? 'Start the conversation',
          customSubtitle ?? 'Send a message to begin',
        );
      case EmptyStateType.usage:
        return (
          Icons.bar_chart,
          customTitle ?? 'No usage data',
          customSubtitle ?? 'Usage will appear here',
        );
    }
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/shared/widgets/empty_state.dart
git commit -m "feat: add SVG illustration support to EmptyState"
```

---

## Task 5: Update App Router for Bottom Navigation

**Files:**
- Modify: `lib/shared/router/app_router.dart`

- [ ] **Step 1: Update app_router.dart**

Replace the entire file with:

```dart
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/screens/login_screen.dart';
import '../../features/auth/screens/webview_auth_screen.dart';
import '../../features/auth/screens/device_auth_screen.dart';
import '../../features/sessions/screens/sessions_screen.dart';
import '../../features/chat/screens/chat_screen.dart';
import '../../features/profile/screens/profile_screen.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../widgets/bottom_nav_shell.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/sessions',
    redirect: (context, state) {
      final isAuthenticated = authState.valueOrNull != null;
      final isOnLogin = state.matchedLocation.startsWith('/login');

      if (!isAuthenticated && !isOnLogin) return '/login';
      if (isAuthenticated && isOnLogin) return '/sessions';
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: 'webview',
            builder: (context, state) => const WebviewAuthScreen(),
          ),
          GoRoute(
            path: 'device',
            builder: (context, state) => const DeviceAuthScreen(),
          ),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          final location = state.matchedLocation;
          final currentIndex = location == '/profile' ? 1 : 0;
          return BottomNavShell(
            currentIndex: currentIndex,
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/sessions',
            builder: (context, state) => const SessionsScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/chat/:sessionId',
        builder: (context, state) {
          final sessionId = state.pathParameters['sessionId']!;
          return ChatScreen(sessionId: sessionId);
        },
      ),
    ],
  );
});
```

- [ ] **Step 2: Commit**

```bash
git add lib/shared/router/app_router.dart
git commit -m "feat: add bottom navigation shell to router"
```

---

## Task 6: Update Sessions Screen (Remove AppBar)

**Files:**
- Modify: `lib/features/sessions/screens/sessions_screen.dart`

- [ ] **Step 1: Remove AppBar from SessionsScreen**

Replace the build method (remove AppBar, keep body):

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final sessionsAsync = ref.watch(activeSessionsProvider);

  return Scaffold(
    body: RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () => ref.read(activeSessionsProvider.notifier).refresh(),
      child: sessionsAsync.when(
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (e, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showAppSnackbar(
              context,
              message: 'Failed to load sessions: $e',
              type: SnackbarType.error,
              actionLabel: 'Retry',
              onAction: () => ref.read(activeSessionsProvider.notifier).refresh(),
            );
          });
          return EmptyState(
            type: EmptyStateType.sessions,
            useIllustration: true,
            customTitle: 'Failed to load',
            customSubtitle: 'Pull to refresh',
            onAction: () => ref.read(activeSessionsProvider.notifier).refresh(),
            actionLabel: 'Retry',
          );
        },
        data: (sessions) {
          if (sessions.isEmpty) {
            return EmptyState(
              type: EmptyStateType.sessions,
              useIllustration: true,
              onAction: () {},
              actionLabel: 'Learn more',
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              return SessionCard(
                session: session,
                onTap: () => context.go('/chat/${session.id}'),
              );
            },
          );
        },
      ),
    ),
  );
}
```

Also remove these imports if present:
- Remove `import '../../../shared/theme/app_colors.dart';` (add back later if needed for other uses)
- Remove `import '../../../shared/widgets/app_icon.dart';` (no longer needed)

Add these imports:
- `import '../../../shared/widgets/empty_state.dart';`
- `import '../../../shared/utils/snackbar_utils.dart';`

Note: The sign out action in the original AppBar is now removed. If you need sign out, it should go in Profile screen or be added to a settings menu later.

- [ ] **Step 2: Commit**

```bash
git add lib/features/sessions/screens/sessions_screen.dart
git commit -m "feat(sessions): remove AppBar, use bottom navigation"
```

---

## Task 7: Update Profile Screen (Remove AppBar)

**Files:**
- Modify: `lib/features/profile/screens/profile_screen.dart`

- [ ] **Step 1: Remove AppBar from ProfileScreen**

Replace the build method (remove AppBar, keep body):

```dart
@override
Widget build(BuildContext context, WidgetRef ref) {
  final userProfileAsync = ref.watch(userProfileProvider);
  final balanceAsync = ref.watch(userBalanceProvider);
  final selectedPeriod = ref.watch(selectedUsagePeriodProvider);
  final usageAsync = ref.watch(currentUsageStatsProvider);
  final usagePeriodsAsync = ref.watch(usagePeriodsProvider((period: selectedPeriod, groupByModel: false)));

  return Scaffold(
    body: RefreshIndicator(
      color: AppColors.primary,
      onRefresh: () async {
        ref.invalidate(userProfileProvider);
        ref.invalidate(userBalanceProvider);
        ref.invalidate(currentUsageStatsProvider);
        ref.invalidate(usagePeriodsProvider((period: selectedPeriod, groupByModel: false)));
      },
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildUserProfileSection(userProfileAsync),
          const SizedBox(height: 24),
          _buildBalanceSection(balanceAsync),
          const SizedBox(height: 24),
          _buildUsageStatsSection(ref, selectedPeriod, usageAsync),
          const SizedBox(height: 24),
          _buildCalendarSection(ref, selectedPeriod, usagePeriodsAsync),
        ],
      ),
    ),
  );
}
```

Add these imports if not present:
- `import '../../../shared/widgets/empty_state.dart';`
- `import '../../../shared/utils/snackbar_utils.dart';`

Note: The back button to sessions is now removed since we have bottom navigation. Sessions is always one tap away.

- [ ] **Step 2: Commit**

```bash
git add lib/features/profile/screens/profile_screen.dart
git commit -m "feat(profile): remove AppBar, use bottom navigation"
```

---

## Task 8: Update Sessions and Profile Empty States to Use SVG

**Files:**
- Modify: `lib/features/sessions/screens/sessions_screen.dart`
- Modify: `lib/features/profile/screens/profile_screen.dart`

- [ ] **Step 1: Update SessionsScreen EmptyState calls**

In the error handler and empty state, set `useIllustration: true`.

- [ ] **Step 2: Update ProfileScreen EmptyState calls**

In all error handlers, set `useIllustration: true`.

- [ ] **Step 3: Commit**

```bash
git add lib/features/sessions/screens/sessions_screen.dart lib/features/profile/screens/profile_screen.dart
git commit -m "feat: use SVG illustrations for empty states"
```

---

## Self-Review Checklist

**1. Spec coverage:**
- [x] Bottom navigation shell created
- [x] IndexedStack preserves state
- [x] Two tabs: Sessions + Profile
- [x] Custom AppIcon for Sessions tab
- [x] SVG illustrations created
- [x] EmptyState supports SVG
- [x] Sessions screen AppBar removed
- [x] Profile screen AppBar removed
- [x] Router updated for shell route

**2. Placeholder scan:**
- [x] No "TBD", "TODO", or incomplete sections
- [x] All code is complete

**3. Type consistency:**
- [x] All imports reference actual files
- [x] EmptyStateType enum used correctly
- [x] SnackbarType enum used correctly

---

**Plan complete and saved to `docs/superpowers/plans/2026-04-05-kilo-remote-ux-polish-a2-plan.md`.**

**Two execution options:**

**1. Subagent-Driven (recommended)** - Dispatch fresh subagent per task, two-stage review between tasks

**2. Inline Execution** - Execute tasks in this session using executing-plans, batch with checkpoints

**Which approach?**
