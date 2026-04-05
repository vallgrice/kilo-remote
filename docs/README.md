# Kilo Remote — документация проекта

## Обзор

Kilo Remote — мобильное Flutter-приложение для удалённого управления CLI-сессиями Kilo. Приложение позволяет подключаться к активным сессиям, отправлять сообщения, обрабатывать запросы разрешений и взаимодействовать с AI-ассистентом в реальном времени.

## Архитектура

Приложение построено на принципах:
- **Riverpod** — управление состоянием
- **Go Router** — навигация
- **WebSocket** — коммуникация с сервером
- **Freezed** — модели данных

## Структура проекта

```
lib/
├── main.dart                 # Точка входа
├── core/
│   ├── api/                  # HTTP-клиент
│   │   ├── api_client.dart   # Dio-клиент с cookie-поддержкой
│   │   └── api_constants.dart # URL-константы
│   ├── transport/            # WebSocket-транспорт
│   │   ├── web_socket_transport.dart    # Основной транспорт
│   │   ├── message_reducer.dart        # Обработка сообщений
│   │   └── event_normalizer.dart       # Нормализация событий
│   └── models/               # Модели данных
│       ├── message.dart      # Сообщения
│       ├── part.dart         # Части сообщений
│       ├── session.dart      # Сессии
│       ├── permission.dart   # Запросы разрешений
│       ├── question.dart     # Вопросы
│       ├── tool_state.dart   # Состояние инструментов
│       └── events.dart       # События чата и сервиса
├── features/
│   ├── auth/                 # Аутентификация
│   │   ├── providers/auth_provider.dart
│   │   ├── data/auth_repository.dart
│   │   └── screens/          # login, webview, device auth
│   ├── sessions/            # Список сессий
│   │   ├── providers/sessions_provider.dart
│   │   └── screens/sessions_screen.dart
│   └── chat/                # Чат-интерфейс
│       ├── providers/session_notifier.dart
│       ├── screens/chat_screen.dart
│       └── widgets/          # UI-компоненты чата
└── shared/
    ├── router/app_router.dart
    └── theme/               # Темы и цвета
```

## API-эндпоинты

| URL | Назначение |
|-----|-------------|
| `wss://ingest.kilosessions.ai/api/user/web` | WebSocket |
| `GET /api/trpc/activeSessions.list` | Список активных сессий |
| `GET /api/trpc/activeSessions.getToken` | Получение токена |
| `GET /api/trpc/cliSessionsV2.getSessionMessages` | История сообщений |
| `POST /api/device-auth/codes` | Создание кода устройства |

## Аутентификация

Приложение поддерживает два способа входа:

1. **WebView-логин** — через браузер с последующим получением токена
2. **Device Auth** — аутентификация по коду (аналог GitHub Device Flow)

Токен хранится в `FlutterSecureStorage`.

## WebSocket-протокол

Транспорт поддерживает:
- Подписку на события сессии (`subscribe`)
- Отправку команд (`command`)
- Автоматическое переподключение с экспоненциальной задержкой
- Повторную загрузку снапшота при переподключении

**Типы сообщений:**
- `event` — события чата и сервиса
- `system` — системные события (heartbeat, disconnect)
- `response` — ответы на команды

## Поток данных

1. Пользователь выбирает сессию на экране списка
2. Создаётся `WebSocketTransport` с `MessageReducer`
3. При подключении загружается снапшот (история)
4. События нормализуются через `EventNormalizer`
5. UI обновляется через Riverpod (`SessionState`)

## Состояния подключения

```
disconnected → connecting → connected
                           ↘ reconnecting
```

## Модели данных

### Part (части сообщений)
- `text` — текстовый контент
- `tool` — вызов инструмента с состоянием
- `reasoning` — рассуждения модели
- `file` — файл/изображение
- `subtask` — подзадача

### ServiceEvent
- `PermissionAskedEvent` — запрос разрешения
- `QuestionAskedEvent` — вопрос пользователю
- `StoppedEvent` — сессия остановлена

## UI-компоненты

- **SessionCard** — карточка активной сессии
- **MessageList** — история сообщений
- **MessageBubble** — пузырь сообщения
- **ChatInput** — поле ввода с выбором модели/режима
- **PermissionCard** — обработка разрешений
- **QuestionCard** — обработка вопросов
- **ToolCards** — отображение вызовов инструментов (read, write, bash, grep, glob, edit, todo, list, web_search)

## Окружение и SDK

| Компонент | Расположение |
|-----------|-------------|
| Flutter SDK | `e:\flutter` |
| Android SDK | `e:\android-sdk` |
| JDK 17 | `e:\jdk17\jdk-17.0.18+8` |
| Проект | `e:\projects\kilo_remote_flutter` |

## Сборка и установка

### Переменные окружения

Для всех команд сборки нужно указывать:

```bash
JAVA_HOME="e:/jdk17/jdk-17.0.18+8" ANDROID_SDK_ROOT="e:/android-sdk"
```

### Debug-сборка

```bash
JAVA_HOME="e:/jdk17/jdk-17.0.18+8" ANDROID_SDK_ROOT="e:/android-sdk" e:/flutter/bin/flutter build apk --debug
```

APK появится в `build/app/outputs/flutter-apk/app-debug.apk`.

### Release-сборка

```bash
JAVA_HOME="e:/jdk17/jdk-17.0.18+8" ANDROID_SDK_ROOT="e:/android-sdk" e:/flutter/bin/flutter build apk --release
```

### Установка на устройство

**Через adb (рекомендуется):**

```bash
e:/android-sdk/platform-tools/adb.exe -s <DEVICE_ID> install -r build/app/outputs/flutter-apk/app-debug.apk
```

Текущее тестовое устройство: `ZY32LN8VZ7` (moto g86 5G, Android 16).

**Через flutter install:**

```bash
JAVA_HOME="e:/jdk17/jdk-17.0.18+8" ANDROID_SDK_ROOT="e:/android-sdk" e:/flutter/bin/flutter install -d <DEVICE_ID>
```

> **Важно:** `flutter install` по умолчанию ставит release-сборку (`app-release.apk`), даже если вы собирали debug. Для установки свежего debug-билда используйте `adb install`.

### Полная команда: сборка + установка

```bash
cd e:/projects/kilo_remote_flutter && \
JAVA_HOME="e:/jdk17/jdk-17.0.18+8" ANDROID_SDK_ROOT="e:/android-sdk" \
e:/flutter/bin/flutter build apk --debug && \
e:/android-sdk/platform-tools/adb.exe -s ZY32LN8VZ7 install -r build/app/outputs/flutter-apk/app-debug.apk
```

### Проверка подключённых устройств

```bash
e:/android-sdk/platform-tools/adb.exe devices
```

Если устройство показывает `unauthorized` — подтвердите подключение на телефоне, или:

```bash
e:/android-sdk/platform-tools/adb.exe kill-server
e:/android-sdk/platform-tools/adb.exe start-server
```

### Анализ кода

```bash
e:/flutter/bin/flutter analyze --no-fatal-infos --no-fatal-warnings
```

### Генерация кода (freezed/json_serializable)

```bash
e:/flutter/bin/dart run build_runner build --delete-conflicting-outputs
```

### Генерация иконки приложения

Исходник иконки: `assets/icon/app_icon.png` (1024x1024).

Перегенерация иконки из исходного скрипта:
```bash
e:/flutter/bin/dart run tool/generate_icon.dart
```

Генерация платформенных иконок:
```bash
e:/flutter/bin/dart run flutter_launcher_icons
```

Конфигурация в `pubspec.yaml` → секция `flutter_launcher_icons`.

## Дизайн

Приложение использует стиль **Warm Minimal** — тёплые серые тона с бронзовым акцентом.

### Палитра (`lib/shared/theme/app_colors.dart`)

| Токен | Значение | Назначение |
|-------|----------|------------|
| `background` | `#111318` | Фон приложения |
| `surface` | `#1C1E24` | Поверхности (карточки, AppBar) |
| `surfaceElevated` | `#262830` | Приподнятые поверхности |
| `border` | `#333840` | Границы |
| `primary` | `#D4A574` | Основной бронзовый акцент |
| `primaryDark` | `#B8956A` | Тёмный бронзовый (градиенты) |
| `onPrimary` | `#1F2937` | Текст на бронзовом фоне |
| `success` | `#34D399` | Успех / активный статус |
| `warning` | `#F59E0B` | Предупреждение |
| `error` | `#EF4444` | Ошибка |
| `textPrimary` | `#F3F4F6` | Основной текст |
| `textSecondary` | `#6B7280` | Вторичный текст |

### Иконка приложения

Терминальное окно + стрелка отправки на бронзовом градиенте. Генерируется программно через `tool/generate_icon.dart` с использованием пакета `image`.

### Шрифт

Google Fonts Inter — через пакет `google_fonts`.

## Зависимости

- `flutter_riverpod` — стейт-менеджмент
- `go_router` — маршрутизация
- `web_socket_channel` — WebSocket
- `dio` + `dio_cookie_manager` — HTTP-клиент с куками
- `flutter_secure_storage` — безопасное хранилище
- `freezed` + `json_serializable` — генерация кода
- `flutter_inappwebview` — WebView для аутентификации
- `flutter_markdown` — рендер Markdown в чате
- `google_fonts` — шрифт Inter
- `flutter_launcher_icons` — генерация иконок приложения