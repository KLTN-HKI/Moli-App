# Moli App

FLutter doctor appointment - Moli

---

## Run app 🚀

```dart
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run --flavor=production --target="lib/main_production.dart" --dart-define="BASE_URL=www.production.com"
```

## Run build runner

```dart
flutter pub run build_runner watch
```

## Initial intl

```dart
flutter pub run intl_utils:generate
```

_\*Moli App works on iOS, Android, Web, and Windows._
