import 'package:flutter/foundation.dart';

extension Logger on Object? {
  void log() {
    if (kDebugMode) {
      print(this);
    }
  }
}
