abstract final class ApiConstants {
  static const baseUrl = 'https://app.kilo.ai';
  static const wsUrl = 'wss://ingest.kilosessions.ai/api/user/web';
  static const getToken = '/api/trpc/activeSessions.getToken';
  static const listActiveSessions = '/api/trpc/activeSessions.list';
  static const getSessionMessages = '/api/trpc/cliSessionsV2.getSessionMessages';
  static const openRouterModels = '/api/openrouter/models';
  static const deviceAuthCodes = '/api/device-auth/codes';
  static const profileUsage = '/api/profile/usage';
  static const profileBalance = '/api/profile/balance';
  static const profileMe = '/api/profile';
}
