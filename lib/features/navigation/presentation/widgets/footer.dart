import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/helpers/constants.dart';
import 'package:flutter_conf_colombia/styles/flutter_conf_latam_icons_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isRow = getValueForScreenType(
      context: context,
      mobile: false,
      tablet: true,
      desktop: true,
    );

    Widget socialNetworks() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FlutterConfLatamIcons.facebook,
                size: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15.0),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FlutterConfLatamIcons.instagram,
                size: 25,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 15.0),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FlutterConfLatamIcons.twitter,
                size: 25,
                color: Colors.white,
              ),
            ),
          ],
        );

    Widget copyright() => const Center(
          child: Text(
            '© 2023 Flutter Conf Latam',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        );

    Widget flutterConfLogo() => Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              FlutterConfLatamIcons.flutteconflatam_text,
              size: 40,
              color: Colors.white,
            ),
            const SizedBox(width: 15.0),
            SvgPicture.asset(
              '${Constants.imagesPath}/FlutterLogo_White.svg',
              width: 40,
              height: 40,
            ),
          ],
        );

    return ColoredBox(
      color: Colors.black,
      child: isRow
          ? SizedBox(
              height: 160.0,
              child: Stack(
                children: [
                  Positioned(
                    left: 85.0,
                    bottom: 0.0,
                    top: 0.0,
                    child: socialNetworks(),
                  ),
                  Align(
                    child: flutterConfLogo(),
                  ),
                  Positioned(
                    right: 85.0,
                    bottom: 0.0,
                    top: 0.0,
                    child: copyright(),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                const SizedBox(height: 40.0),
                flutterConfLogo(),
                const SizedBox(height: 40.0),
                Transform.scale(
                  scale: 0.8,
                  child: socialNetworks(),
                ),
                const SizedBox(height: 40.0),
                copyright(),
                const SizedBox(height: 20.0),
              ],
            ),
    );
  }
}
