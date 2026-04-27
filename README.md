<div align="center">

<!-- LOGO / BANNER -->
<img src="assets/icons/app_logo.png" alt="REPORT Logo" width="96" height="96" />

<h1>REPORT</h1>

<p><strong>Regional e-Portal for Operation &amp; Request Tracking</strong></p>

<p>
  A production-grade, cross-platform Flutter application for streamlining<br/>
  regional operations, work-order management, and real-time field reporting.
</p>

<br/>

<!-- BADGES -->
<p>
  <img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-≥3.8-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Architecture-Clean%20Architecture-6C47FF?style=for-the-badge" alt="Clean Architecture"/>
  <img src="https://img.shields.io/badge/State-BLoC%20%2F%20Cubit-13B9FD?style=for-the-badge" alt="BLoC"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-success?style=for-the-badge" alt="Platform"/>
</p>

<p>
  <img src="https://img.shields.io/badge/Monitoring-Sentry-362D59?style=for-the-badge&logo=sentry&logoColor=white" alt="Sentry"/>
  <img src="https://img.shields.io/badge/Push%20Notif-Firebase%20Messaging-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/i18n-Bahasa%20Indonesia%20%7C%20English-10B981?style=for-the-badge" alt="i18n"/>
  <img src="https://img.shields.io/badge/license-Proprietary-red?style=for-the-badge" alt="License"/>
</p>

<br/>

---

</div>

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [Architecture](#architecture)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [Environment Configuration](#environment-configuration)
- [Code Generation](#code-generation)
- [Running the App](#running-the-app)
- [Internationalization](#internationalization)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

**REPORT** is an enterprise Flutter application built to digitize and centralize regional operational workflows. It enables field officers, supervisors, and administrators to submit, track, and resolve work orders and operational reports — all from a single, unified mobile or web interface.

Designed with a **production-first mindset**, REPORT ships with robust offline support, end-to-end error monitoring via Sentry, push notifications via Firebase Cloud Messaging, QR/barcode scanning, rich PDF export, and a built-in real-time chat system.

```
Target Platforms  : Android (SDK 21+) · iOS · Web
Primary Language  : Dart ≥ 3.8.0
Architecture      : Clean Architecture · BLoC / Cubit · Offline-first
Backend           : REST API (Retrofit + Dio) · Firebase Cloud Messaging
```

---

## Key Features

| Feature | Description |
|---|---|
| 📋 **Operational Reports** | Submit, update, and track field reports with file & image attachments |
| 🔍 **QR / Barcode Scanning** | Identify assets and locations instantly via `mobile_scanner` |
| 💬 **Real-time Chat** | Built-in messaging system powered by `flutter_chat_ui` |
| 📅 **Calendar & Scheduling** | Visual scheduling interface via `table_calendar` |
| 📄 **PDF Export** | Generate formatted PDF reports directly on-device |
| 🔔 **Push Notifications** | Firebase Cloud Messaging for real-time operational alerts |
| 🌐 **Offline-first** | Multi-layer local storage (Hive + SQLite + SharedPreferences) |
| 🌍 **Multilingual** | Indonesian (default) and English via `slang` i18n |
| 📊 **Dashboard** | Sidebar navigation with role-based views via `flutter_side_menu` |
| 🔒 **Secure Config** | Environment variables protected via `envied` code generation |

---

## Architecture

REPORT follows **Clean Architecture** principles with a strict separation of concerns across three layers:

```
┌─────────────────────────────────────────────────────────┐
│                    Presentation Layer                   │
│          Widgets · Pages · BLoC / Cubit · Routes        │
│                   (auto_route v10)                      │
├─────────────────────────────────────────────────────────┤
│                      Domain Layer                       │
│          Use Cases · Entities · Repository Contracts    │
│                  (Pure Dart — no Flutter)               │
├─────────────────────────────────────────────────────────┤
│                       Data Layer                        │
│    Repository Impl · DTOs · Remote Sources · Local DB   │
│       (Retrofit · Dio · Hive · SQLite · Sentry)         │
└─────────────────────────────────────────────────────────┘
```

**State management** is handled exclusively by `flutter_bloc` (BLoC/Cubit pattern). Immutable state and event classes are generated via `freezed`. Dependency injection is managed by `get_it` + `injectable`, with bindings registered through code generation at build time.

**Routing** uses `auto_route` with a fully code-generated, type-safe route tree — no magic strings anywhere in navigation.

---

## Tech Stack

### Core

| Category | Package | Version |
|---|---|---|
| State Management | `flutter_bloc` | ^9.1.1 |
| Immutable Models | `freezed` + `freezed_annotation` | ^3.2.3 |
| Dependency Injection | `get_it` + `injectable` | ^8.2.0 / ^2.5.1 |
| Routing | `auto_route` | ^10.1.2 |
| Responsive UI | `flutter_screenutil` | ^5.9.3 |
| Component Library | `shadcn_flutter` | ^0.0.44 |
| Form Validation | `formz` | ^0.8.0 |

### Networking

| Category | Package | Version |
|---|---|---|
| HTTP Client | `dio` | ^5.9.0 |
| Type-safe API | `retrofit` | ^4.7.2 |
| Debug Logging | `pretty_dio_logger` | ^1.4.0 |
| Error Monitoring | `sentry_flutter` | ^9.6.0 |

### Storage

| Category | Package | Version |
|---|---|---|
| Key-value Cache | `hive` + `hive_flutter` | ^2.2.3 |
| Relational Local DB | `sqflite` | ^2.4.2 |
| Lightweight Settings | `shared_preferences` | ^2.5.3 |

### Features

| Category | Package | Version |
|---|---|---|
| QR / Barcode | `mobile_scanner` | ^7.1.2 |
| Push Notifications | `firebase_messaging` | ^16.0.1 |
| PDF Generation | `pdf` | ^3.11.3 |
| In-app Chat | `flutter_chat_ui` + `flutter_chat_core` | ^2.0.0 |
| Calendar | `table_calendar` | ^3.2.0 |
| Image Picker | `image_picker` | ^1.2.0 |
| File Picker | `file_picker` | ^10.3.3 |
| Network Image Cache | `cached_network_image` | ^3.4.1 |
| Loading Overlay | `flutter_easyloading` | ^3.0.5 |

### Developer Tooling

| Category | Package |
|---|---|
| Code Generation Runner | `build_runner` |
| Route Generation | `auto_route_generator` |
| DI Generation | `injectable_generator` |
| API Generation | `retrofit_generator` |
| Asset Generation | `flutter_gen_runner` |
| i18n Generation | `slang_build_runner` |
| Env Var Generation | `envied_generator` |
| Test Mocking | `mocktail` |

---

## Project Structure

```
report/
├── assets/
│   ├── color/
│   │   └── colors.xml              # Design token color definitions
│   ├── fonts/
│   │   └── Poppins/                # Full weight range (100–900)
│   ├── i18n/
│   │   ├── id.json                 # Indonesian strings (base locale)
│   │   └── en.json                 # English strings
│   ├── icons/
│   │   └── app_logo.png            # App launcher icon
│   └── images/                     # Static image assets
│
├── lib/
│   ├── gen/                        # ⚙️  AUTO-GENERATED — do not edit manually
│   │   ├── assets.gen.dart         # Type-safe asset references
│   │   ├── colors.gen.dart         # Type-safe color references
│   │   └── i18n/
│   │       └── translations.g.dart # Generated i18n translations
│   │
│   ├── src/
│   │   ├── core/                   # Shared infrastructure
│   │   │   ├── di/                 # Dependency injection setup
│   │   │   ├── router/             # auto_route configuration
│   │   │   ├── theme/              # App theme & design tokens
│   │   │   ├── network/            # Dio client, interceptors
│   │   │   ├── storage/            # Hive, SQLite, SharedPrefs helpers
│   │   │   ├── error/              # Failure classes, Sentry config
│   │   │   └── widget/             # Shared reusable widgets
│   │   │
│   │   └── features/               # Feature modules (vertical slices)
│   │       ├── auth/               # Authentication
│   │       ├── dashboard/          # Main dashboard & sidebar
│   │       ├── report/             # Report submission & tracking
│   │       ├── chat/               # In-app messaging
│   │       ├── scanner/            # QR / barcode scanning
│   │       ├── calendar/           # Scheduling & calendar view
│   │       ├── profile/            # User profile management
│   │       └── notification/       # Push notification handling
│   │
│   └── main.dart                   # App entry point
│
├── analysis_options.yaml           # Lint rules (flutter_lints)
├── slang.yaml                      # i18n configuration
├── flutter_launcher_icons.yaml     # Launcher icon configuration
├── pubspec.yaml                    # Dependencies & asset declarations
└── README.md
```

Each feature module follows the same internal structure:

```
features/report/
├── data/
│   ├── datasource/       # Remote (Retrofit) & local (Hive/SQLite) sources
│   ├── dto/              # Data Transfer Objects (json_serializable)
│   └── repository/       # Repository implementations
├── domain/
│   ├── entity/           # Core business entities (Freezed)
│   ├── repository/       # Abstract repository contracts
│   └── usecase/          # Single-responsibility use cases
└── presentation/
    ├── bloc/             # BLoC / Cubit + States + Events
    ├── page/             # Full-page screens
    └── widget/           # Feature-scoped widgets
```

---

## Getting Started

### Prerequisites

Ensure the following are installed before proceeding:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **≥ 3.x** (stable channel)
- [Dart SDK](https://dart.dev/get-dart) **≥ 3.8.0**
- Android Studio / Xcode (for native platform builds)
- A valid `.env` file (see [Environment Configuration](#environment-configuration))

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Ibrahimkayyis/Report.git
cd Report

# 2. Install dependencies
flutter pub get

# 3. Run code generation (required before first build)
dart run build_runner build --delete-conflicting-outputs

# 4. Generate launcher icons
dart run flutter_launcher_icons
```

---

## Environment Configuration

REPORT uses [`envied`](https://pub.dev/packages/envied) to safely inject environment variables at compile time. Secrets are **never** stored in source code.

Create a `.env` file at the project root:

```env
# .env  — DO NOT COMMIT THIS FILE
API_BASE_URL=https://your-api-domain.com/api/v1
SENTRY_DSN=https://your-sentry-dsn@sentry.io/project-id
```

> **Note:** `.env` is listed in `.gitignore`. Never commit it to version control.

After creating `.env`, re-run code generation to regenerate the `Env` class:

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Code Generation

This project relies heavily on code generation. Always run the following after modifying any annotated class (routes, DTOs, Freezed models, DI bindings, i18n files):

```bash
# One-shot generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode (recommended during active development)
dart run build_runner watch --delete-conflicting-outputs
```

**Generated files are committed to the repository** to ensure reproducible builds in CI environments. Do not edit any file inside `lib/gen/` or any `*.g.dart` / `*.freezed.dart` file manually.

---

## Running the App

```bash
# Development (debug mode)
flutter run

# Specific device
flutter run -d <device-id>

# Release build — Android
flutter build apk --release

# Release build — iOS
flutter build ipa --release

# Web
flutter build web --release
```

---

## Internationalization

REPORT supports **Bahasa Indonesia** (default) and **English**, managed by [`slang`](https://pub.dev/packages/slang).

Translation files live in `assets/i18n/`:

```
assets/i18n/
├── id.json    ← Base locale (Indonesian)
└── en.json    ← English translations
```

After editing any translation file, regenerate the translation class:

```bash
dart run slang
# or via build_runner watch (automatically picked up)
```

Usage in code:

```dart
import 'package:report/gen/i18n/translations.g.dart';

// Anywhere in the widget tree
Text(t.common.submit)
Text(t.report.title)
```

---

## Contributing

This is a proprietary internal project. External contributions are not accepted at this time.

For internal contributors:

1. Branch from `master` using the convention `feat/`, `fix/`, or `chore/` prefixes.
2. Ensure `flutter analyze` returns zero warnings before opening a pull request.
3. Run `dart run build_runner build --delete-conflicting-outputs` after any model or route changes.
4. Do not commit `.env`, generated secrets, or any file inside `android/app/google-services.json`.

---

## License

Copyright © 2024–2025 Ibrahimkayyis. All rights reserved.

This software and its source code are proprietary and confidential. Unauthorized copying, modification, distribution, or use of this software, in whole or in part, is strictly prohibited without the prior written consent of the copyright owner.

---

<div align="center">

<br/>

Built with ❤️ using [Flutter](https://flutter.dev)

<br/>

<img src="https://img.shields.io/badge/Made%20with-Flutter-02569B?style=flat-square&logo=flutter" alt="Made with Flutter"/>
&nbsp;
<img src="https://img.shields.io/badge/Powered%20by-Clean%20Architecture-6C47FF?style=flat-square" alt="Clean Architecture"/>
&nbsp;
<img src="https://img.shields.io/badge/Monitored%20by-Sentry-362D59?style=flat-square&logo=sentry" alt="Sentry"/>

</div>
