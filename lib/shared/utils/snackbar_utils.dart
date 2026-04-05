import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

enum SnackbarType {
  info,
  warning,
  error,
}

void showAppSnackbar(
  BuildContext context, {
  required String message,
  SnackbarType type = SnackbarType.info,
  VoidCallback? onAction,
  String? actionLabel,
}) {
  final color = switch (type) {
    SnackbarType.info => AppColors.success,
    SnackbarType.warning => AppColors.warning,
    SnackbarType.error => AppColors.error,
  };

  final icon = switch (type) {
    SnackbarType.info => Icons.info_outline,
    SnackbarType.warning => Icons.warning_amber,
    SnackbarType.error => Icons.error_outline,
  };

  final duration = switch (type) {
    SnackbarType.info => const Duration(seconds: 3),
    SnackbarType.warning => const Duration(seconds: 5),
    SnackbarType.error => const Duration(seconds: 5),
  };

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.surface,
      duration: duration,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: color.withOpacity(0.3)),
      ),
      action: onAction != null && actionLabel != null
          ? SnackBarAction(
              label: actionLabel,
              textColor: color,
              onPressed: onAction,
            )
          : null,
    ),
  );
}

Future<void> showAuthErrorDialog(BuildContext context, String message) async {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      icon: const Icon(
        Icons.error_outline,
        color: AppColors.error,
        size: 48,
      ),
      title: const Text(
        'Authentication Error',
        style: TextStyle(color: AppColors.textPrimary),
      ),
      content: Text(
        message,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            context.go('/login');
          },
          child: const Text(
            'Sign In',
            style: TextStyle(color: AppColors.primary),
          ),
        ),
      ],
    ),
  );
}
