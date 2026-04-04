import 'package:flutter/material.dart';
import '../../../core/models/message.dart';
import '../../../shared/theme/app_colors.dart';
import 'message_bubble.dart';

class MessageList extends StatefulWidget {
  final List<StoredMessage> messages;
  final bool isStreaming;

  const MessageList({super.key, required this.messages, required this.isStreaming});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final _scrollController = ScrollController();
  bool _showScrollToBottom = false;
  bool _autoScroll = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didUpdateWidget(covariant MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_autoScroll && widget.messages.length != oldWidget.messages.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    }
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final atBottom = maxScroll - currentScroll < 100;
    setState(() {
      _showScrollToBottom = !atBottom;
      _autoScroll = atBottom;
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
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
    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: widget.messages.length,
          itemBuilder: (context, index) {
            return MessageBubble(message: widget.messages[index]);
          },
        ),
        if (_showScrollToBottom)
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton.small(
              onPressed: () {
                _autoScroll = true;
                _scrollToBottom();
              },
              backgroundColor: AppColors.surfaceElevated,
              child: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
