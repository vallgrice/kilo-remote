import 'package:flutter/material.dart';
import '../../../core/models/permission.dart';
import '../../../shared/theme/app_colors.dart';

class PermissionCardWidget extends StatefulWidget {
  final PermissionRequest permission;
  final Future<void> Function(String requestId, String response) onRespond;

  const PermissionCardWidget({
    super.key,
    required this.permission,
    required this.onRespond,
  });

  @override
  State<PermissionCardWidget> createState() => _PermissionCardWidgetState();
}

class _PermissionCardWidgetState extends State<PermissionCardWidget> {
  String? _pending;

  Future<void> _respond(String response) async {
    if (_pending != null) return;
    setState(() => _pending = response);
    try {
      await widget.onRespond(widget.permission.requestId, response);
    } catch (_) {
      if (mounted) setState(() => _pending = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final command = widget.permission.metadata['command'] as String?;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(12),
        border: const Border(left: BorderSide(color: AppColors.warning, width: 4)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.shield, size: 18, color: AppColors.warning),
                const SizedBox(width: 8),
                Text(
                  widget.permission.permission,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                ),
                const SizedBox(width: 8),
                const Text(
                  'permission request',
                  style: TextStyle(fontSize: 12, color: AppColors.textSecondary),
                ),
              ],
            ),
            if (widget.permission.patterns.isNotEmpty) ...[
              const SizedBox(height: 12),
              const Text('Patterns', style: TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: widget.permission.patterns.map((p) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(p, style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
                )).toList(),
              ),
            ],
            if (command != null) ...[
              const SizedBox(height: 12),
              const Text('Command', style: TextStyle(fontSize: 11, color: AppColors.textSecondary, fontWeight: FontWeight.w500)),
              const SizedBox(height: 4),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(command, style: const TextStyle(fontSize: 12, fontFamily: 'monospace')),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              children: [
                _ActionButton(
                  label: 'Allow Once',
                  color: AppColors.success,
                  isPending: _pending == 'once',
                  disabled: _pending != null,
                  onTap: () => _respond('once'),
                ),
                const SizedBox(width: 8),
                _ActionButton(
                  label: 'Always Allow',
                  color: AppColors.textSecondary,
                  isPending: _pending == 'always',
                  disabled: _pending != null,
                  onTap: () => _respond('always'),
                ),
                const SizedBox(width: 8),
                _ActionButton(
                  label: 'Deny',
                  color: AppColors.error,
                  isPending: _pending == 'reject',
                  disabled: _pending != null,
                  onTap: () => _respond('reject'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final bool isPending;
  final bool disabled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.color,
    required this.isPending,
    required this.disabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: ElevatedButton(
        onPressed: disabled ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color == AppColors.textSecondary ? AppColors.surface : color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          textStyle: const TextStyle(fontSize: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: color == AppColors.textSecondary
                ? const BorderSide(color: AppColors.border)
                : BorderSide.none,
          ),
        ),
        child: isPending
            ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
            : Text(label),
      ),
    );
  }
}
