import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../providers/auth_provider.dart';
import '../../../core/api/api_constants.dart';
import '../../../shared/theme/app_colors.dart';
import '../../../features/sessions/providers/sessions_provider.dart';

class WebviewAuthScreen extends ConsumerStatefulWidget {
  const WebviewAuthScreen({super.key});

  @override
  ConsumerState<WebviewAuthScreen> createState() => _WebviewAuthScreenState();
}

class _WebviewAuthScreenState extends ConsumerState<WebviewAuthScreen> {
  bool _isLoading = true;
  bool _handlingAuth = false;

  late final InAppWebViewSettings _settings;

  @override
  void initState() {
    super.initState();
    _settings = InAppWebViewSettings(
      javaScriptEnabled: true,
      // Equivalent to React Native's thirdPartyCookiesEnabled={true}
      thirdPartyCookiesEnabled: true,
      // Equivalent to React Native's sharedCookiesEnabled={true}
      sharedCookiesEnabled: true,
      // Chrome Mobile UA — no "wv" marker so Google won't block OAuth
      userAgent:
          'Mozilla/5.0 (Linux; Android 14; Pixel 8) AppleWebKit/537.36 '
          '(KHTML, like Gecko) Chrome/125.0.6422.165 Mobile Safari/537.36',
    );
  }

  Future<void> _checkForAuth(InAppWebViewController controller, Uri? url) async {
    if (_handlingAuth || url == null) return;
    final urlStr = url.toString();

    if (urlStr.contains('app.kilo.ai') &&
        !urlStr.contains('sign_in') &&
        !urlStr.contains('accounts.google')) {
      dev.log('[AUTH] Post-login page detected: $urlStr');
      _handlingAuth = true;
      if (mounted) setState(() {});

      try {
        // Extract cookies using InAppWebView's CookieManager
        final cookieManager = CookieManager.instance();
        final cookies = await cookieManager.getCookies(
          url: WebUri(ApiConstants.baseUrl),
        );

        final cookieString =
            cookies.map((c) => '${c.name}=${c.value}').join('; ');
        dev.log('[AUTH] Got ${cookies.length} cookies');

        final apiClient = ref.read(apiClientProvider);

        // Sync cookies to Dio
        if (cookieString.isNotEmpty) {
          final uri = Uri.parse(ApiConstants.baseUrl);
          await apiClient.cookieJar.setCookiesFromString(cookieString, uri);
          apiClient.setAuthCookie(cookieString);
        }

        // Fetch token via Dio (with cookies)
        final token = await apiClient.getToken();
        dev.log('[AUTH] Token fetched, length=${token.length}');

        await ref.read(authProvider.notifier).setToken(token);
        if (mounted) context.go('/sessions');
      } catch (e) {
        dev.log('[AUTH] Auth failed: $e');
        _handlingAuth = false;
        if (mounted) {
          setState(() {});
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Auth failed: $e'),
              backgroundColor: AppColors.error,
            ),
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
          InAppWebView(
            initialUrlRequest: URLRequest(
              url: WebUri('${ApiConstants.baseUrl}/users/sign_in'),
            ),
            initialSettings: _settings,
            onLoadStart: (controller, url) {
              dev.log('[AUTH] loadStart: $url');
              if (mounted) setState(() => _isLoading = true);
            },
            onLoadStop: (controller, url) {
              dev.log('[AUTH] loadStop: $url');
              if (mounted) setState(() => _isLoading = false);
              _checkForAuth(controller, url);
            },
          ),
          if (_isLoading || _handlingAuth)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
