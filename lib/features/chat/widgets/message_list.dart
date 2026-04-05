import 'package:flutter/material.dart';
import '../../../core/models/message.dart';
import '../../../shared/theme/app_colors.dart';
import 'message_bubble.dart';

class MessageList extends StatefulWidget {
  final List<StoredMessage> messages;
  final bool isStreaming;
  final bool hasMore;
  final VoidCallback? onLoadMore;

  const MessageList({
    super.key,
    required this.messages,
    required this.isStreaming,
    this.hasMore = false,
    this.onLoadMore,
  });

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final _scrollController = ScrollController();
  bool _showScrollToBottom = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final offset = _scrollController.offset;
    final max = _scrollController.position.maxScrollExtent;

    // In a reversed list, offset 0 = bottom, max = top.
    // Load more when user scrolls near the top (old messages).
    if (offset > max - 200 && widget.hasMore && widget.onLoadMore != null) {
      widget.onLoadMore!();
    }

    final atBottom = offset < 100;
    if (_showScrollToBottom == atBottom) {
      setState(() => _showScrollToBottom = !atBottom);
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = widget.messages.length + (widget.hasMore ? 1 : 0);

    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          reverse: true,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            // In reverse mode, index 0 = last message (newest).
            // The "load more" indicator goes at the highest index (top of chat).
            if (widget.hasMore && index == itemCount - 1) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            }
            // Map reversed index back to message list order.
            final msgIndex = widget.hasMore
                ? widget.messages.length - 1 - index
                : widget.messages.length - 1 - index;
            final msg = widget.messages[msgIndex];
            return MessageBubble(key: ValueKey(msg.info.id), message: msg);
          },
        ),
        if (_showScrollToBottom)
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton.small(
              onPressed: _scrollToBottom,
              backgroundColor: AppColors.surfaceElevated,
              child: const Icon(Icons.keyboard_arrow_down, color: AppColors.textPrimary),
            ),
          ),
      ],
    );
  }
}
