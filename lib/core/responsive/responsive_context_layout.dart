import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenSize {
  small(300),
  normal(400),
  large(600),
  extraLarge(1200);

  const ScreenSize(this.size);

  final double size;
}

enum DeviceSegment { mobileWeb, desktopWeb, other }

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

  ScreenSize get screenSize {
    final currentSize = switch (currentDevice) {
      DeviceSegment.mobileWeb ||
      DeviceSegment.desktopWeb => MediaQuery.sizeOf(this).width,
      _ => MediaQuery.sizeOf(this).shortestSide,
    };
    if (kDebugMode) print('CURRENT SIZE: $currentSize');

    return switch (currentSize) {
      _ when currentSize > ScreenSize.extraLarge.size => ScreenSize.extraLarge,
      _ when currentSize > ScreenSize.large.size => ScreenSize.large,
      _ when currentSize > ScreenSize.normal.size => ScreenSize.normal,
      _ => ScreenSize.small,
    };
  }

  bool get isMobileFromResponsive => screenSize != ScreenSize.extraLarge;
}
