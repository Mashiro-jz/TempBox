# temp_box

TempBox is a innovative mobile app that provides instant access to temporary email addresses. Protect your privacy and avoid spam by using free, disposable mailboxes that automatically delete messages after a set period. Keep your personal inbox clean and secure with TempBox!


## Dependencies Overview
mailtm_client: ^1.1.0: API integration for temporary email services and message retrieval

flutter_riverpod: ^2.4.9: State management solution for app-wide data and business logic

shared_preferences: ^2.2.2: Local storage for persisting user settings and preferences

flutter_local_notifications: ^16.3.0: Local push notifications for new email alerts (SOON)

workmanager: ^0.5.1: Background tasks for periodic email checking and updates (SOON)

cached_network_image: ^3.3.0: Efficient image loading and caching for email attachments

intl: ^0.18.1: Date/time formatting and internationalization utilities

go_router: Moving on app


## Structure

lib/
├── main.dart
├── core/
│   ├── constants/          # Stałe wartości w appce
│   │   ├── app_constants.dart
│   │   └── ... 
│   ├── errors/             # Obsługa błędów (exceptions, failures)
│   ├── services/           # Globalne serwisy (np. powiadomienia) (SOON)
│   │   └── notification_service.dart
│   ├── theme/              # Motywy jasny/ciemny
│   │   ├── app_theme.dart
│   │   ├── theme_repository.dart
│   │   └── app_palette.dart
│   ├── utils/              # Narzędzia (formatters, extensions)
│   │   ├── date_formatter.dart
│   │   └── context_extensions.dart
│   └── widgets/            # Widgety używane globalnie
│       ├── custom_app_bar.dart
│       └── ...
├── data/
│   ├── datasources/        # Źródła danych (lokalne i zdalne)
│   │   ├── local/          
│   │   │   ├── settings_local_data_source.dart # SharedPrefs
│   │   │   └── ...
│   │   └── remote/         
│   │       └── mailtm_remote_data_source.dart  # Opakowanie mailtm_client
│   ├── models/             # Data Layer: Modele danych (JSON)
│   │   ├── account_model.dart
│   │   ├── message_model.dart
│   │   └── ...
│   └── repositories/       # Implementacje repozytoriów
│       ├── account_repository_impl.dart
│       ├── message_repository_impl.dart
│       ├── settings_repository_impl.dart
│       └── ...
├── domain/
│   ├── entities/           # Business Layer: Encje (czysty Dart)
│   │   ├── account_entity.dart
│   │   ├── message_entity.dart
│   │   └── ...
│   ├── repositories/       # Interfejsy repozytoriów (abstrakcje)
│   │   ├── account_repository.dart
│   │   ├── message_repository.dart
│   │   ├── settings_repository.dart
│   │   └── ...
│   └── usecases/           # Casuchy użycia (logika biznesowa)
│       ├── get_account_info_usecase.dart
│       ├── get_messages_usecase.dart
│       ├── delete_message_usecase.dart
│       ├── check_for_new_messages_usecase.dart # Dla powiadomień!
│       └── ...
└── presentation/
    ├── pages/              # Ekrany (Full UI)
    │   ├── login_page.dart
    │   ├── mailbox_page.dart
    │   ├── message_detail_page.dart
    │   ├── settings_page.dart
    │   ├── auth_page.dart
    │   └── register_page.dart
    ├── providers/          # Stan zarządzany (Riverpod)
    │   ├── account_provider.dart
    │   ├── message_list_provider.dart
    │   ├── theme_provider.dart
    │   └── ...
    ├── widgets/            # Widgety używane tylko w presentation
    │   ├── message_tile.dart
    │   ├── attachment_gallery.dart
    │   └── ...
    └── routing/            # Nawigacja
        └── app_router.dart

