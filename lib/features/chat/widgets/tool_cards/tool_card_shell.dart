import 'package:flutter/material.dart';
import '../../../../core/models/tool_state.dart';
import '../../../../shared/theme/app_colors.dart';

class ToolCardShell extends StatefulWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? badge;
  final ToolStatus status;
  final bool defaultExpanded;
  final Widget? child;

  const ToolCardShell({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.badge,
    required this.status,
    this.defaultExpanded = false,
    this.child,
  });

  @override
  State<ToolCardShell> createState() => _ToolCardShellState();
}

class _ToolCardShellState extends State<ToolCardShell> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.defaultExpanded;
  }

  Widget _statusIcon() {
    switch (widget.status) {
      case ToolStatus.pending:
      case ToolStatus.running:
        return const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: AppColors.primary,
          ),
        );
      case ToolStatus.completed:
        return Icon(widget.icon, size: 16, color: AppColors.textSecondary);
      case ToolStatus.error:
        return const Icon(Icons.error_outline, size: 16, color: AppColors.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  _statusIcon(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: widget.subtitle != null
                        ? Text(
                            widget.subtitle!,
                            style: const TextStyle(
                              fontSize: 13,
                              fontFamily: 'monospace',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.textSecondary,
                            ),
                          ),
                  ),
                  if (widget.badge != null) ...[
                    const SizedBox(width: 4),
                    widget.badge!,
                  ],
                  const SizedBox(width: 4),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(
                      Icons.expand_more,
                      size: 16,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_expanded && widget.child != null) ...[
            const Divider(height: 1, color: AppColors.border),
            Padding(
              padding: const EdgeInsets.all(12),
              child: widget.child!,
            ),
          ],
        ],
      ),
    );
  }
}
