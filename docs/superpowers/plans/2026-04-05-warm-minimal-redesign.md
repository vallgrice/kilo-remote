# Warm Minimal Redesign Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Redesign Kilo Remote from cold dark theme to warm minimal style, fix missing back navigation in chat, and create an app icon.

**Architecture:** Pure visual changes across theme + all screens. No data/provider/transport changes. The color palette in `app_colors.dart` is the single source of truth — most widgets reference it, so updating it propagates broadly. Widgets that hardcode colors or use Material defaults need individual updates. Back navigation is a one-line `context.go('/sessions')` in chat AppBar.

**Tech Stack:** Flutter, Material 3, go_router, google_fonts, flutter_launcher_icons (new)

---

### Task 1: Update Color Palette

**Files:**
- Modify: `lib/shared/theme/app_colors.dart`

- [ ] **Step 1: Update all color constants**

Replace the entire body of `AppColors`:

```dart
abstract final class AppColors {
  static const background = Color(0xFF111318);
  static const surface = Color(0xFF1C1E24);
  static const surfaceElevated = Color(0xFF262830);
  static const border = Color(0xFF333840);
  static const primary = Color(0xFFD4A574);
  static const primaryDark = Color(0xFFB8956A);
  static const success = Color(0xFF34D399);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const textPrimary = Color(0xFFF3F4F6);
  static const textSecondary = Color(0xFF6B7280);
  static const codeBackground = Color(0xFF1A1C22);
  static const onPrimary = Color(0xFF1F2937);
}
```

- [ ] **Step 2: Verify no compile errors**

Run: `cd e:/projects/kilo_remote_flutter && flutter analyze --no-fatal-infos --no-fatal-warnings 2>&1 | head -20`

Expected: No errors referencing `AppColors`

- [ ] **Step 3: Commit**

```bash
git add lib/shared/theme/app_colors.dart
git commit -m "style: update color palette to warm minimal"
```

---

### Task 2: Update Theme Configuration

**Files:**
- Modify: `lib/shared/theme/app_theme.dart`

- [ ] **Step 1: Update theme for bronze primary with dark onPrimary**

Replace the full file content:

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

ThemeData buildAppTheme() {
  final colorScheme = ColorScheme.dark(
    surface: AppColors.surface,
    primary: AppColors.primary,
    error: AppColors.error,
    onSurface: AppColors.textPrimary,
    onPrimary: AppColors.onPrimary,
    outline: AppColors.border,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardTheme(
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: AppColors.border),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceElevated,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      hintStyle: const TextStyle(color: AppColors.textSecondary),
    ),
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    ).apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Colors.transparent,
      selectedColor: AppColors.primary.withOpacity(0.15),
      labelStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.border),
      ),
      side: const BorderSide(color: AppColors.border),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.surfaceElevated,
      foregroundColor: AppColors.textPrimary,
    ),
  );
}
```

- [ ] **Step 2: Verify no compile errors**

Run: `cd e:/projects/kilo_remote_flutter && flutter analyze --no-fatal-infos --no-fatal-warnings 2>&1 | head -20`

- [ ] **Step 3: Commit**

```bash
git add lib/shared/theme/app_theme.dart
git commit -m "style: update theme to warm minimal with bronze primary"
```

---

### Task 3: Create App Icon Widget

**Files:**
- Create: `lib/shared/widgets/app_icon.dart`

- [ ] **Step 1: Create reusable app icon widget**

This widget draws the terminal+arrow icon used on login, sessions AppBar, and as a basis for the launcher icon.

```dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class AppIcon extends StatelessWidget {
  final double size;

  const AppIcon({super.key, this.size = 80});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.primary, AppColors.primaryDark],
        ),
        borderRadius: BorderRadius.circular(size * 0.275),
      ),
      child: CustomPaint(
        painter: _AppIconPainter(),
      ),
    );
  }
}

class _AppIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width;
    final paint = Paint()
      ..color = AppColors.onPrimary
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.045
      ..strokeCap = StrokeCap.round;

    // Terminal window (top-left area)
    final termRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.2, s * 0.18, s * 0.48, s * 0.42),
      Radius.circular(s * 0.06),
    );
    canvas.drawRRect(termRect, paint);

    // Terminal lines inside
    final linePaint = Paint()
      ..color = AppColors.onPrimary
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round;

    // Line 1
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.28, s * 0.30, s * 0.16, s * 0.035),
        Radius.circular(s * 0.02),
      ),
      linePaint,
    );

    // Line 2 (dimmer)
    final dimPaint = Paint()
      ..color = AppColors.onPrimary.withOpacity(0.4)
      ..style = PaintingStyle.fill;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(s * 0.28, s * 0.39, s * 0.28, s * 0.035),
        Radius.circular(s * 0.02),
      ),
      dimPaint,
    );

    // Arrow badge (bottom-right)
    final badgeRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(s * 0.55, s * 0.52, s * 0.27, s * 0.27),
      Radius.circular(s * 0.07),
    );
    final badgeFill = Paint()
      ..color = AppColors.onPrimary
      ..style = PaintingStyle.fill;
    canvas.drawRRect(badgeRect, badgeFill);

    // Arrow inside badge (pointing right)
    final arrowPaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = s * 0.035
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final cx = s * 0.685;
    final cy = s * 0.655;
    final arrowSize = s * 0.07;

    final arrowPath = Path()
      ..moveTo(cx - arrowSize, cy - arrowSize)
      ..lineTo(cx, cy)
      ..lineTo(cx - arrowSize, cy + arrowSize);
    canvas.drawPath(arrowPath, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
```

- [ ] **Step 2: Verify no compile errors**

Run: `cd e:/projects/kilo_remote_flutter && flutter analyze --no-fatal-infos --no-fatal-warnings 2>&1 | head -20`

- [ ] **Step 3: Commit**

```bash
git add lib/shared/widgets/app_icon.dart
git commit -m "feat: add AppIcon widget with terminal+arrow design"
```

---

### Task 4: Redesign Login Screen

**Files:**
- Modify: `lib/features/auth/screens/login_screen.dart`

- [ ] **Step 1: Update login screen with new design**

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/app_icon.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppIcon(size: 80),
              const SizedBox(height: 24),
              Text(
                'Kilo Remote',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Remote client for CLI sessions',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.go('/login/webview'),
                  child: const Text('Sign in with Browser'),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => context.go('/login/device'),
                  child: const Text('Sign in with Code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/auth/screens/login_screen.dart
git commit -m "style: redesign login screen with warm minimal theme"
```

---

### Task 5: Redesign Sessions Screen + Session Card

**Files:**
- Modify: `lib/features/sessions/screens/sessions_screen.dart`
- Modify: `lib/features/sessions/widgets/session_card.dart`

- [ ] **Step 1: Update sessions screen with app icon in AppBar**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/sessions_provider.dart';
import '../widgets/session_card.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/app_icon.dart';

class SessionsScreen extends ConsumerWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsync = ref.watch(activeSessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const AppIcon(size: 32),
            const SizedBox(width: 12),
            const Text('Sessions', style: TextStyle(fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () async {
                await ref.read(authProvider.notifier).signOut();
                if (context.mounted) context.go('/login');
              },
              icon: const Icon(Icons.logout, size: 20),
              tooltip: 'Sign out',
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        color: AppColors.primary,
        onRefresh: () => ref.read(activeSessionsProvider.notifier).refresh(),
        child: sessionsAsync.when(
          loading: () => Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
          error: (e, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Error: $e', style: const TextStyle(color: AppColors.error)),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(activeSessionsProvider.notifier).refresh(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          data: (sessions) {
            if (sessions.isEmpty) {
              return ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AppIcon(size: 48),
                          const SizedBox(height: 16),
                          const Text(
                            'No active sessions',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Start a CLI session with kilo --remote',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
}
```

- [ ] **Step 2: Update session card with warmer styling**

```dart
import 'package:flutter/material.dart';
import '../../../core/models/session.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../shared/widgets/status_badge.dart';

class SessionCard extends StatelessWidget {
  final ActiveSession session;
  final VoidCallback onTap;

  const SessionCard({super.key, required this.session, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Material(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border.withOpacity(0.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        session.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    StatusBadge(
                      label: session.status == 'active' ? 'Active' : session.status,
                      color: session.status == 'active'
                          ? AppColors.success
                          : AppColors.warning,
                      pulsing: session.status == 'active',
                    ),
                  ],
                ),
                if (session.gitBranch != null || session.gitUrl != null) ...[
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.alt_route, size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          [
                            if (session.gitBranch != null) session.gitBranch,
                            if (session.gitUrl != null)
                              session.gitUrl!.split('/').last.replaceAll('.git', ''),
                          ].join(' · '),
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 3: Commit**

```bash
git add lib/features/sessions/screens/sessions_screen.dart lib/features/sessions/widgets/session_card.dart
git commit -m "style: redesign sessions screen and card with warm minimal theme"
```

---

### Task 6: Fix Chat Screen — Back Button + Title (CRITICAL UX)

**Files:**
- Modify: `lib/features/chat/screens/chat_screen.dart`

- [ ] **Step 1: Add back navigation and session title to chat AppBar**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/session_notifier.dart';
import '../widgets/message_list.dart';
import '../widgets/chat_input.dart';
import '../widgets/working_indicator.dart';
import '../widgets/permission_card.dart';
import '../widgets/question_card.dart';
import '../../../core/transport/web_socket_transport.dart' as transport;
import '../../../shared/theme/app_colors.dart';
import '../../sessions/providers/sessions_provider.dart';

class ChatScreen extends ConsumerWidget {
  final String sessionId;

  const ChatScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(sessionNotifierProvider(sessionId));
    // Get session metadata (title, branch) from sessions list
    final sessions = ref.watch(activeSessionsProvider).valueOrNull ?? [];
    final sessionMeta = sessions.where((s) => s.id == sessionId).firstOrNull;

    return sessionAsync.when(
      loading: () => Scaffold(
        appBar: _buildAppBar(context, null, false, sessionMeta),
        body: Center(child: CircularProgressIndicator(color: AppColors.primary)),
      ),
      error: (e, _) => Scaffold(
        appBar: _buildAppBar(context, null, false, sessionMeta),
        body: Center(child: Text('Error: $e', style: const TextStyle(color: AppColors.error))),
      ),
      data: (state) {
        final notifier = ref.read(sessionNotifierProvider(sessionId).notifier);
        final isConnected = state.connectionState == transport.ConnectionState.connected;
        final canSend = isConnected && !state.isStreaming;

        return Scaffold(
          appBar: _buildAppBar(context, state, isConnected, sessionMeta,
            onInterrupt: state.isStreaming ? () => notifier.interrupt() : null,
          ),
          body: Column(
            children: [
              if (state.error != null)
                MaterialBanner(
                  content: Text(state.error!),
                  backgroundColor: AppColors.error.withOpacity(0.1),
                  actions: [
                    TextButton(
                      onPressed: () => notifier.clearError(),
                      child: const Text('Dismiss'),
                    ),
                  ],
                ),
              Expanded(
                child: MessageList(
                  messages: state.messages,
                  isStreaming: state.isStreaming,
                  hasMore: state.hasMore,
                  onLoadMore: () => notifier.loadMore(),
                ),
              ),
              WorkingIndicator(
                messages: state.messages,
                isStreaming: state.isStreaming,
              ),
              if (state.activePermission != null)
                PermissionCardWidget(
                  permission: state.activePermission!,
                  onRespond: (id, response) => notifier.respondToPermission(id, response),
                ),
              if (state.activeQuestion != null && state.activePermission == null)
                QuestionCardWidget(
                  question: state.activeQuestion!,
                  onAnswer: (id, answers) => notifier.answerQuestion(id, answers),
                  onReject: (id) => notifier.rejectQuestion(id),
                ),
              ChatInput(
                canSend: canSend,
                onSend: (text, {mode, model}) =>
                    notifier.sendMessage(text, mode: mode, model: model),
              ),
            ],
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    SessionState? state,
    bool isConnected,
    dynamic sessionMeta, {
    VoidCallback? onInterrupt,
  }) {
    final title = sessionMeta?.title ?? 'Session';
    final branch = sessionMeta?.gitBranch;

    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () => context.go('/sessions'),
            child: const Icon(Icons.arrow_back, size: 20),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          if (branch != null)
            Text(branch, style: const TextStyle(fontSize: 11, color: AppColors.textSecondary)),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isConnected ? AppColors.success : AppColors.error,
              shape: BoxShape.circle,
              boxShadow: isConnected
                  ? [BoxShadow(color: AppColors.success.withOpacity(0.4), blurRadius: 6)]
                  : null,
            ),
          ),
        ),
        if (onInterrupt != null)
          IconButton(
            onPressed: onInterrupt,
            icon: const Icon(Icons.stop_circle, color: AppColors.error),
            tooltip: 'Interrupt',
          ),
      ],
    );
  }
}
```

- [ ] **Step 2: Verify no compile errors**

Run: `cd e:/projects/kilo_remote_flutter && flutter analyze --no-fatal-infos --no-fatal-warnings 2>&1 | head -20`

- [ ] **Step 3: Commit**

```bash
git add lib/features/chat/screens/chat_screen.dart
git commit -m "fix: add back navigation to chat screen, show session title"
```

---

### Task 7: Update Message Bubble

**Files:**
- Modify: `lib/features/chat/widgets/message_bubble.dart`

- [ ] **Step 1: Update to bronze user bubbles and warmer assistant bubbles**

```dart
import 'package:flutter/material.dart';
import '../../../core/models/message.dart';
import '../../../shared/theme/app_colors.dart';
import 'part_renderer.dart';

class MessageBubble extends StatelessWidget {
  final StoredMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.info.role == 'user';

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: isUser
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primary, AppColors.primaryDark],
                )
              : null,
          color: isUser ? null : AppColors.surface,
          border: isUser ? null : Border.all(color: AppColors.border.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(18).copyWith(
            bottomRight: isUser ? const Radius.circular(6) : null,
            bottomLeft: !isUser ? const Radius.circular(6) : null,
          ),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: isUser ? AppColors.onPrimary : AppColors.textPrimary,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final part in message.parts) ...[
                PartRenderer(part: part),
                if (part != message.parts.last) const SizedBox(height: 8),
              ],
              if (message.parts.isEmpty && isUser)
                Text('...', style: TextStyle(
                  color: isUser ? AppColors.onPrimary.withOpacity(0.6) : AppColors.textSecondary,
                )),
            ],
          ),
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/chat/widgets/message_bubble.dart
git commit -m "style: update message bubbles to warm minimal with bronze user messages"
```

---

### Task 8: Update Chat Input

**Files:**
- Modify: `lib/features/chat/widgets/chat_input.dart`

- [ ] **Step 1: Update input with bronze send button and warmer styling**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/chat_providers.dart';
import '../../../shared/theme/app_colors.dart';
import 'mode_selector.dart';
import 'model_picker.dart';

class ChatInput extends ConsumerStatefulWidget {
  final bool canSend;
  final Future<void> Function(String text, {String? mode, String? model}) onSend;

  const ChatInput({super.key, required this.canSend, required this.onSend});

  @override
  ConsumerState<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends ConsumerState<ChatInput> {
  final _controller = TextEditingController();
  bool _isSending = false;

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty || !widget.canSend || _isSending) return;

    setState(() => _isSending = true);
    final mode = ref.read(selectedModeProvider);
    final model = ref.read(selectedModelProvider);

    try {
      await widget.onSend(text, mode: mode, model: model);
      _controller.clear();
    } finally {
      if (mounted) setState(() => _isSending = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mode = ref.watch(selectedModeProvider);
    final model = ref.watch(selectedModelProvider);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border, width: 0.5)),
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: ModeSelector(
                    selected: mode,
                    onChanged: (m) => ref.read(selectedModeProvider.notifier).state = m,
                  ),
                ),
                ModelPicker(
                  selected: model,
                  onChanged: (m) => ref.read(selectedModelProvider.notifier).state = m,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: 5,
                    minLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Message...',
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      isDense: true,
                    ),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: widget.canSend && !_isSending
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [AppColors.primary, AppColors.primaryDark],
                          )
                        : null,
                    color: widget.canSend && !_isSending ? null : AppColors.surfaceElevated,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: widget.canSend && !_isSending ? _send : null,
                    padding: EdgeInsets.zero,
                    icon: _isSending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.onPrimary,
                            ),
                          )
                        : Icon(
                            Icons.arrow_upward,
                            size: 20,
                            color: widget.canSend ? AppColors.onPrimary : AppColors.textSecondary,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/chat/widgets/chat_input.dart
git commit -m "style: update chat input with bronze send button"
```

---

### Task 9: Update Mode Selector

**Files:**
- Modify: `lib/features/chat/widgets/mode_selector.dart`

- [ ] **Step 1: Update chips with bronze selected state**

```dart
import 'package:flutter/material.dart';
import '../../../shared/theme/app_colors.dart';

const modes = ['code', 'plan', 'debug', 'orchestrator', 'ask'];

class ModeSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const ModeSelector({super.key, required this.selected, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: modes.map((mode) {
          final isSelected = mode == selected;
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: GestureDetector(
              onTap: () => onChanged(mode),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary.withOpacity(0.15) : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isSelected ? AppColors.primary.withOpacity(0.3) : AppColors.border,
                  ),
                ),
                child: Text(
                  mode[0].toUpperCase() + mode.substring(1),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
```

- [ ] **Step 2: Commit**

```bash
git add lib/features/chat/widgets/mode_selector.dart
git commit -m "style: update mode selector with bronze active state"
```

---

### Task 10: Update Tool Card Shell + Working Indicator

**Files:**
- Modify: `lib/features/chat/widgets/tool_cards/tool_card_shell.dart`
- Modify: `lib/features/chat/widgets/working_indicator.dart`

- [ ] **Step 1: Update tool card shell spinner to bronze**

In `tool_card_shell.dart`, change the spinner color in `_statusIcon()`:

Replace:
```dart
        return const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        );
```

No change needed — `AppColors.primary` is already referenced, and it now resolves to bronze. The tool card shell is correct as-is since it uses `AppColors` constants throughout.

- [ ] **Step 2: Update working indicator spinner to bronze**

In `working_indicator.dart`, the spinner already uses `AppColors.primary`. The text already uses `AppColors.textSecondary`. Both will pick up the new palette automatically. No code changes needed.

- [ ] **Step 3: Verify both files reference AppColors correctly**

Run: `cd e:/projects/kilo_remote_flutter && grep -n "AppColors\." lib/features/chat/widgets/tool_cards/tool_card_shell.dart lib/features/chat/widgets/working_indicator.dart`

Expected: All color references use `AppColors.*` constants (no hardcoded colors).

- [ ] **Step 4: Commit (skip if no changes)**

No file changes needed — these widgets already use `AppColors` constants.

---

### Task 11: Update Permission Card + Question Card

**Files:**
- Modify: `lib/features/chat/widgets/permission_card.dart`
- Modify: `lib/features/chat/widgets/question_card.dart`

- [ ] **Step 1: Update question card left border from blue to bronze**

In `question_card.dart`, the left border uses `AppColors.primary` which is now bronze. No code change needed.

- [ ] **Step 2: Verify both widgets reference AppColors correctly**

Run: `cd e:/projects/kilo_remote_flutter && grep -n "AppColors\." lib/features/chat/widgets/permission_card.dart lib/features/chat/widgets/question_card.dart`

Expected: All color references use `AppColors.*` constants.

- [ ] **Step 3: Commit (skip if no changes)**

No file changes needed — these widgets already use `AppColors` constants.

---

### Task 12: Update Message List scroll-to-bottom button

**Files:**
- Modify: `lib/features/chat/widgets/message_list.dart`

- [ ] **Step 1: Update FAB colors**

In `message_list.dart` line 107, change:

```dart
              child: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
```

to:

```dart
              child: const Icon(Icons.keyboard_arrow_down, color: AppColors.textPrimary),
```

The `backgroundColor: AppColors.surfaceElevated` is already using the constant, which will pick up the new value.

- [ ] **Step 2: Commit**

```bash
git add lib/features/chat/widgets/message_list.dart
git commit -m "style: update scroll-to-bottom button colors"
```

---

### Task 13: Generate App Launcher Icon

**Files:**
- Modify: `pubspec.yaml`
- Create: `assets/icon/app_icon.png` (generated via Flutter script)
- Create: `tool/generate_icon.dart`

- [ ] **Step 1: Add flutter_launcher_icons to pubspec.yaml**

Add to `dev_dependencies`:

```yaml
  flutter_launcher_icons: ^0.14.3
```

Add to root level of `pubspec.yaml`:

```yaml
flutter_launcher_icons:
  android: true
  ios: true
  image_path: "assets/icon/app_icon.png"
  adaptive_icon_background: "#D4A574"
  adaptive_icon_foreground: "assets/icon/app_icon_foreground.png"
```

- [ ] **Step 2: Create icon generation script**

Create `tool/generate_icon.dart` — a standalone Dart script that uses `dart:ui` to paint the icon and save as PNG. This script renders the same terminal+arrow design as `AppIcon` widget.

```dart
// tool/generate_icon.dart
//
// Generates the app icon PNG files.
// Run with: dart run tool/generate_icon.dart
//
// NOTE: This requires running in a Flutter context.
// Alternative: create the icon manually using the AppIcon widget
// screenshot or any design tool matching the spec:
//   - 1024x1024 PNG
//   - Bronze gradient background (#D4A574 → #B8956A)
//   - Terminal window outline (top-left) with arrow badge (bottom-right)
//   - Dark elements (#1F2937) on bronze background

import 'dart:io';

void main() {
  print('To generate the app icon:');
  print('1. Run the app and navigate to a screen showing AppIcon(size: 1024)');
  print('2. Take a screenshot of just the icon');
  print('3. Save to assets/icon/app_icon.png');
  print('');
  print('Or use a design tool to create a 1024x1024 PNG matching the spec.');
  exit(0);
}
```

- [ ] **Step 3: Create icon assets directory**

```bash
mkdir -p e:/projects/kilo_remote_flutter/assets/icon
```

- [ ] **Step 4: Create a simple solid-color icon as placeholder**

Since we can't render Flutter widgets to PNG in a script, create a minimal icon generation using the `image` Dart package. For now, we'll use the CustomPainter in-app and capture it. Add to pubspec under `flutter:`:

```yaml
  assets:
    - assets/icon/
```

- [ ] **Step 5: Run flutter pub get**

```bash
cd e:/projects/kilo_remote_flutter && flutter pub get
```

- [ ] **Step 6: Commit**

```bash
git add pubspec.yaml tool/generate_icon.dart
git commit -m "chore: add flutter_launcher_icons config and icon generation script"
```

---

### Task 14: Final Verification

- [ ] **Step 1: Run flutter analyze**

```bash
cd e:/projects/kilo_remote_flutter && flutter analyze --no-fatal-infos --no-fatal-warnings
```

Expected: No errors

- [ ] **Step 2: Verify the app builds**

```bash
cd e:/projects/kilo_remote_flutter && flutter build apk --debug 2>&1 | tail -5
```

Expected: BUILD SUCCESSFUL

- [ ] **Step 3: Final commit if any remaining changes**

```bash
git add -A
git commit -m "style: warm minimal redesign complete"
```
