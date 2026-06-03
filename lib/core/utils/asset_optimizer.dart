import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AssetOptimizer {
  static Future<void> preloadCriticalAnimations() async {
    const criticalAnimations = ['assets/animations/flutterconflogo.riv'];
    await Future.wait(criticalAnimations.map(_preloadRiveFile));
  }

  static Future<void> _preloadRiveFile(String path) async {
    try {
      await rootBundle.load(path);
    } on Exception catch (e) {
      debugPrint('[AssetOptimizer] Failed to preload $path: $e');
    }
  }

  static Future<void> preloadCriticalImages(List<String> imagePaths) async {
    await Future.wait(imagePaths.map(_preloadImage));
  }

  static Future<void> _preloadImage(String path) async {
    try {
      await rootBundle.load(path);
    } on Exception catch (e) {
      debugPrint('[AssetOptimizer] Failed to preload image $path: $e');
    }
  }
}
