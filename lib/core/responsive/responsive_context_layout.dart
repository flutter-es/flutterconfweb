import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenType { desktop, tablet, handset, watch }

enum DeviceSegment { mobileWeb, desktopWeb, other }

List<DeviceSegment> desktopSegments = [DeviceSegment.desktopWeb];

List<DeviceSegment> webSegments = [
  DeviceSegment.mobileWeb,
  DeviceSegment.desktopWeb,
];

DeviceSegment get currentDevice {
  return switch (defaultTargetPlatform) {
    TargetPlatform.android ||
    TargetPlatform.iOS when kIsWeb => DeviceSegment.mobileWeb,
    TargetPlatform.windows ||
    TargetPlatform.linux ||
    TargetPlatform.macOS when kIsWeb => DeviceSegment.desktopWeb,
    _ => DeviceSegment.other,
  };
}

extension AdaptiveLayoutContext on BuildContext {
  bool get isPortrait => MediaQuery.orientationOf(this) == Orientation.portrait;

  ScreenType get formFactor {
    return switch (MediaQuery.sizeOf(this).shortestSide) {
      >= 840 => ScreenType.desktop,
      >= 600 => ScreenType.tablet,
      >= 300 => ScreenType.handset,
      _ => ScreenType.watch,
    };
  }
}
