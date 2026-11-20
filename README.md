# Luma Album

A cross-platform photo album manager built with Flutter.

## SDK baseline

- Flutter 3.50.0 stable
- Dart 3.14.0 (bundled with Flutter)

## Architecture

- MVVM + Riverpod
- Feature-first structure
- GoRouter

## Platforms

- Android
- iOS
- Windows

## Build Android APK

```bash
flutter pub get
flutter analyze
flutter test
flutter build apk --release
```

The GitHub Actions workflow builds a release APK and uploads it as an artifact.