import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

/// Base class containing a unified API for key-value pairs' storage.
/// This class provides low level methods for storing:
/// - Sensitive keys using [FlutterSecureStorage]
/// - Insensitive keys using [HiveInterface]
class KeyValueStorageBase {
  /// Private constructor
  const KeyValueStorageBase._();

  /// Instance of flutter secure storage
  static FlutterSecureStorage? _secureStorage;

  /// Singleton instance of KeyValueStorage Helper
  static KeyValueStorageBase? _instance;

  /// Get instance of this class
  static KeyValueStorageBase get instance =>
      _instance ??= const KeyValueStorageBase._();

  /// Initializer for shared prefs and flutter secure storage
  /// Should be called in main before runApp and
  /// after WidgetsBinding.FlutterInitialized(), to allow for synchronous tasks
  /// when possible.
  static Future<void> initialize() async {
    final Directory appDocumentDirectory =
        await getApplicationDocumentsDirectory();
    // Hive initialize
    await Hive.initFlutter(appDocumentDirectory.path);

    await Hive.openBox('settings');
    await Hive.openBox<bool?>('onboarding');

    // FlutterSecureStorage initialize
    _secureStorage ??= const FlutterSecureStorage();
  }

  /// Reads the decrypted value for the key from secure storage
  Future<String?> getEncrypted(String key) {
    try {
      return _secureStorage!.read(key: key);
    } on PlatformException {
      return Future<String?>.value();
    }
  }

  /// Sets the encrypted value for the key to secure storage
  Future<bool> setEncrypted(String key, String value) {
    try {
      _secureStorage!.write(key: key, value: value);
      return Future<bool>.value(true);
    } on PlatformException catch (_) {
      return Future<bool>.value(false);
    }
  }

  /// Erases encrypted keys
  Future<void> clearEncrypted() => _secureStorage!.deleteAll();

  /* ------------------ HIVE STORAGE ----------------------- */

  // Read the value for the key from common hive storage
  T? getItem<T>(String boxKey, {required dynamic key}) {
    try {
      final Box<T> hiveBox = Hive.box<T>(boxKey);

      return hiveBox.get(key);
    } on Exception {
      return null;
    }
  }

  /// Read the value for the key from common hive storage
  List<T>? getItems<T>(String boxKey, {int page = 1, int? limit}) {
    try {
      final Box<T> hiveBox = Hive.box<T>(boxKey);
      final int totalHiveItems = hiveBox.length;

      int itemCount = totalHiveItems;
      int start = 0;

      if (limit != null) {
        start = (page - 1) * limit;
        itemCount = min(totalHiveItems - start, limit);
      }

      final List<T> items = List<T?>.generate(
              itemCount, (int index) => hiveBox.getAt(start + index))
          .whereType<T>()
          .toList();

      return items;
    } on Exception {
      return null;
    }
  }

  /// Sets the value for the key (id) to common hive storage
  Future<void> saveItem<T>(String boxKey,
      {required dynamic key, required T value}) async {
    final Box<T> hiveBox = Hive.box<T>(boxKey);

    await hiveBox.put(key, value);
  }

  /// Saves all the key - value pairs in the [itemsMap] map.
  ///
  /// ```dart
  /// final itemsMap = {for (var item in items) item.id: item};
  /// KeyValueStorageBase.saveItems('BOX_KEY', itemsMap : itemsMap);
  /// ```
  Future<void> saveItems<T>(String boxKey,
      {required Map<dynamic, T> itemsMap}) async {
    final Box<dynamic> hiveBox = Hive.box<dynamic>(boxKey);

    await hiveBox.clear();
    await hiveBox.putAll(itemsMap);
  }

  /// Erases hive storage keys
  Future<void> clearBox() => Hive.deleteFromDisk();
}
