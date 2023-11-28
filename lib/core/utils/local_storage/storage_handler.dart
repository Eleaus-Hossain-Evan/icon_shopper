import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core.dart';

final hiveProvider = Provider<StorageHandler>((_) => StorageHandler());

final hiveEventStreamProvider =
    StreamProvider.family<BoxEvent, String?>((ref, key) {
  return ref.watch(hiveProvider).getCacheBox().watch(key: key);
});

class StorageHandler {
  StorageHandler._();
  // static final StorageHandler _instance = StorageHandler._();
  // static StorageHandler get instance => _instance;

  late Box _cacheBox;

  StorageHandler() {
    // _init();
  }

  // Future<void> create() async {
  //   await instance._init();
  // }

  Box getCacheBox() {
    return _cacheBox;
  }

  Future<void> init() async {
    await Hive.initFlutter();
    _cacheBox = await Hive.openBox(AppStrings.cacheBox);
  }

  dynamic get(String tag, {dynamic defaultValue}) {
    return _cacheBox.get(tag, defaultValue: defaultValue);
  }

  void put(String tag, dynamic value) {
    _cacheBox.put(tag, value);
  }

  void delete(String tag) {
    _cacheBox.delete(tag);
  }
}
