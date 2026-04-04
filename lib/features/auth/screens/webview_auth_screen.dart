import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../providers/auth_provider.dart';
import '../../../core/api/api_constants.dart';

class WebviewAuthScreen extends ConsumerStatefulWidget {
  const WebviewAuthScreen({super.key});

  @override
  ConsumerState<WebviewAuthScreen> createState() => _WebviewAuthScreenState();
}

class _WebviewAuthScreenState extends ConsumerState<WebviewAuthScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _tokenFetched = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) => setState(() => _isLoading = true),
        onPageFinished: (url) {
          setState(() => _isLoading = false);
          _checkForAuth(url);
        },
      ))
      ..loadRequest(Uri.parse('${ApiConstants.baseUrl}/users/sign_in'));
  }

  Future<void> _checkForAuth(String url) async {
    if (_tokenFetched) return;
    // After login, user lands on dashboard or similar
    if (url.contains('app.kilo.ai') && !url.contains('sign_in')) {
      _tokenFetched = true;
      try {
        final repo = ref.read(authRepositoryProvider);
        // Extract cookies via JavaScript since WebViewCookieManager
        // does not support getCookies in webview_flutter 4.x.
        final cookieResult = await _controller
            .runJavaScriptReturningResult('document.cookie');
        final cookieString = cookieResult.toString().replaceAll('"', '');
        repo.apiClient.setAuthCookie(cookieString);

        final token = await repo.fetchTokenAfterWebViewLogin();
        await ref.read(authProvider.notifier).setToken(token);
        if (mounted) context.go('/sessions');
      } catch (e) {
        _tokenFetched = false;
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Auth failed: $e')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_isLoading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
