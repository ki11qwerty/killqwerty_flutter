# killqwerty_flutter
23.10 - 3ч
BloC - https://pub.dev/packages/flutter_bloc
День 1 — Setup проекта, монорепо и package-ы

Практика: создать repo, скелет: app, packages/core, packages/domain, packages/data, packages/features/transactions, features/habits; настроить .gitignore, README. День 2 — Dart: актуальный синтаксис, null-safety, sound null-safety
Практика: пройтись по моделям, включить null-safety, использовать late/required правильно. День 3 — Effective Dart: style, analysis_options, linting
Практика: подключить analysis_options, pedantic/Effective Dart правила, настроить CI lint job. День 4 — Pubspec & package management, работа с версии зависимостей
Практика: выделить общие утилиты в package/core, настроить локальные path-пакеты. День 5 — Code generation (build_runner, freezed, json_serializable)
Практика: настроить freezed для immutable моделей, генерировать fromJson/toJson. День 6 — Logging, error handling, Sentry/Crashlytics basics
Практика: интегрировать logger и базовую обработку ошибок, отправка логов в dev-mode. День 7 — Контроль: CI skeleton (GitHub Actions/Codemagic) + тестовый pipeline
Практика: настроить workflow, который собирает проект и запускает lint.
Контрольная точка недели 1: модульный проект, lint, codegen работают, CI собирает.

Неделя 2 — Архитектура, слои, dependency injection, state management
День 8 — Clean Architecture / Feature-based structure для Flutter

Практика: спроектировать слои (domain/usecases, data/repositories, presentation/bloc/riverpod) для транзакций. День 9 — Репозитории, data sources, error mapping
Практика: интерфейс репозитория, реализация локального и remote data source, mapping ошибок. День 10 — Dependency Injection: get_it & injectable (или Riverpod DI)
Практика: настроить get_it + injectable для автоматической генерации провайдеров. День 11 — State management: обзор (Bloc, Riverpod, Provider, GetX) — why & when
Практика: выбрать основную стратегию (если у вас опыт с Bloc — используйте Bloc) и реализовать базовую фичу через нее. День 12 — Bloc (flutter_bloc) — events, states, architecture
Практика: реализовать AddTransaction flow в Bloc, покрыть unit-тестом бизнес-логику. День 13 — Riverpod (hooks_riverpod / riverpod) — преимущества, providers, scopes
Практика: переписать один небольшой сервис (например, theme/provider) на Riverpod для сравнения. День 14 — State persistence & hydration
Практика: сохранить состояние пользовательского сеанса и последний фильтр списка транзакций.
Контрольная точка недели 2: рабочая архитектура с DI и выбранной стратегией управления состоянием, basic repo реализован.

Неделя 3 — UI, навигация, adaptivity, theming, i18n
День 15 — Flutter widgets deep dive: Stateless vs Stateful, keys, element tree

Практика: ревью и оптимизация нескольких виджетов, заменить Stateful на более оптимальные композиции. День 16 — Navigation 2.0 (Router API) и deep linking
Практика: реализовать навигацию через Router для list/detail/add с поддержкой deep link. День 17 — Responsive & adaptive UI (layout, MediaQuery, LayoutBuilder)
Практика: сделать адаптивный лэйаут для tablet/landscape; test on web. День 18 — Theming & dynamic color, accessibility
Практика: реализовать light/dark темы, high-contrast, support font-scaling, semantic labels. День 19 — Localization (intl, flutter_localizations)
Практика: добавить i18n (RU/EN), внешние строки, plural/format даты/валют. День 20 — Lists & performance (ListView, SliverList, lazy loading)
Практика: оптимизировать список транзакций, добавить pagination/infinite scroll. День 21 — Animations: implicit/explicit, Hero, staggered animations
Практика: анимировать добавление транзакции, переходы между экранами.
Контрольная точка недели 3: UI-ядро приложения на Flutter с навигацией, темингом, i18n и адаптивностью.

Неделя 4 — Асинхронность, потоки, isolate, data handling
День 22 — Futures, async/await, Streams, BroadcastStreams

Практика: реализовать поток для real-time обновлений списка (StreamController/BehaviorSubject). День 23 — RxDart overview (opcional) и когда использовать vs Streams
Практика: сделать debounce поиска транзакций. День 24 — Isolates & compute — heavy computations off-main
Практика: переместить тяжелую агрегацию статистики в isolate/compute. День 25 — Concurrency pitfalls, thread-safety, race conditions
Практика: проверить и обезопасить параллельные записи в локальную базу. День 26 — Caching strategies, offline-first, optimistic updates
Практика: реализовать offline-first логику: показываем локальные данные и синхронизируем. День 27 — Streams & State: integration with Bloc/Riverpod
Практика: интегрировать remote updates (WebSocket/Stream) в Bloc или provider. День 28 — Conflict resolution при синке (merge strategies)
Практика: спроектировать стратегию мерджа (LWW, CRDT-ish или manual merge).
Контрольная точка недели 4: корректная асинхронная обработка данных, heavy work в isolate, offline-first.

Неделя 5 — Persistence, database, paging
День 29 — Выбор persistence: Drift (moor), SQFlite, Hive — плюсы/минусы

Практика: выбрать (рекомендую Drift для SQL + миграций) и создать таблицы транзакций. День 30 — Migrations, queries, DAOs (Drift)
Практика: написать DAO/queries, покрыть тестом. День 31 — Secure storage & encryption (flutter_secure_storage, sqlcipher)
Практика: хранить токены и чувствительные данные шифровано. День 32 — Paging, lazy loading, efficient queries
Практика: реализовать пагинацию с Drift + local caching. День 33 — File & image handling, image caching (cached_network_image / flutter_cache_manager)
Практика: добавить аватар/картинки категорий с кэшем. День 34 — Sync engine: queue, retry, backoff, resumable uploads
Практика: реализовать очередь синхронизации и retry с экспоненциальным бэкоффом. День 35 — Контроль: тесты для DAOs, миграций и кэширования.
Контрольная точка недели 5: локальная БД, безопасность хранения, стабильный caching/paging.

Неделя 6 — Testing, CI/CD, релиз
День 36 — Unit testing в Dart (test), mocktail/Mockito

Практика: покрыть UseCases и репозитории unit-тестами. День 37 — Widget testing (flutter_test), golden tests
Практика: написать несколько widget-тестов и один golden test для экрана транзакций. День 38 — Integration test (integration_test, e2e)
Практика: e2e тест: пройти flow добавления транзакции. День 39 — CI/CD: GitHub Actions / Codemagic / Bitrise — настройка pipeline
Практика: расширить workflow: build debug/release, unit tests, widget tests. День 40 — Code signing, flavors, build variants, dart-define
Практика: настроить release flavors (dev/stage/prod) и signing для Android/iOS. День 41 — App Store / Play Store релиз: metainfo, screenshots, fastlane
Практика: подготовить fastlane lanes или Codemagic workflow (uploads to internal track). День 42 — Мониторинг релиза, feature flags (Firebase Remote Config / LaunchDarkly)
Практика: настроить remote config для фич-флагов, включить базовую аналитики.
Контрольная точка недели 6: CI собирает, тесты работают, релизный процесс настроен.

Неделя 7 — Performance, profiling, оптимизация
День 43 — Flutter DevTools: CPU, Memory, Performance

Практика: профайлить холодный старт и экран списка, найти hotspots. День 44 — Ререндеры & rebuilds: const widgets, keys, селективные rebuilds
Практика: оптимизировать горячие виджеты, добавить const, уменьшить rebuilds. День 45 — Rendering pipeline, layers, repaint boundary, compositing
Практика: использовать RepaintBoundary, проверить overdraw, raster cache. День 46 — Image optimization, caching, webp, decode pixels off-main
Практика: оптимизировать загрузку картинок, pre-cache, resize on decode. День 47 — Memory leaks, retaining objects, closure captures
Практика: найти и устранить утечку (обычно через long-lived Streams/listeners). День 48 — App startup optimization (deferred components, split AOT/JIT)
Практика: lazy-load heavy init, deferred imports для фич (if appropriate). День 49 — APK/AAB/Bundle size reduction, tree-shaking, obfuscation
Практика: собрать release, проанализировать размер, включить shrink/obfuscate.
Контрольная точка недели 7: приложение быстро стартует, профилируется, размер оптимизирован.

Неделя 8 — Platform channels, plugins, multiplatform, soft skills и интервью
День 50 — Platform integration: MethodChannel / EventChannel

Практика: реализовать native-плагин (или sample) для доступа к нативной функции (например, contacts). День 51 — Native plugins & federated plugins, FFI basics
Практика: создать простой plugin и опубликовать локально; посмотреть FFI пример (SQLite native). День 52 — Background tasks, alarms, background_fetch, WorkManager equivalents
Практика: реализовать background sync/reminders на Android и iOS. День 53 — Push Notifications (Firebase Messaging), deep links, app links
Практика: интегрировать FCM и обработку notification taps + navigation. День 54 — Multiplatform: Web & Desktop caveats
Практика: собрать и протестировать веб-версию, адаптировать UI/feature toggles. День 55 — Package publishing, Open-source readiness, docs
Практика: оформить один package (utils or small plugin), подготовить pub.dev-ready package (README, example). День 56 — Final polish, architecture docs, interview prep
Практика: собрать релиз/preview, записать demo, подготовить ADR по sync и security; составить 8–10 историй STAR для интервью.
Контрольная точка недели 8: полностью работающее приложение с multiplatform поддержкой, native-интеграциями, CI и тестами; готовое к демонстрации и релизу.

Рекомендованные темы/ресурсы (кратко)

Официальная документация: dart.dev, flutter.dev (codelabs).
State management: flutter_bloc docs, riverpod docs, provider docs.
Codegen: freezed, json_serializable, injectable.
Persistence: Drift (moor), Hive, flutter_secure_storage.
Testing: flutter_test, integration_test, mocktail.
CI/CD: GitHub Actions, Codemagic, Fastlane.
Performance: Flutter DevTools, статьи о rendering pipeline, talks на Flutter Engage/Google I/O.
Каналы/плагины: MethodChannel docs, plugin development guide.