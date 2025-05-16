import 'dart:async'; // Added for Timer

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/core/widgets/button/fcl_button.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/adaptable_text.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutMain extends ConsumerWidget {
  const AboutMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final carouselImageUrls = <String>[
      Assets.images.udla.one,
      Assets.images.udla.two,
      Assets.images.udla.three,
    ];

    final venueInfoList = <({String text, String icon})>[
      (text: l10n.aboutVenueAddress, icon: Assets.images.icons.pinMap),
      (text: l10n.aboutVenueCapacity, icon: Assets.images.icons.people),
    ];

    return SectionContainer(
      spacing: 48,
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SizedBox(
            width: 1196,
            child: _ImageCarouselWidget(
              imageUrls: carouselImageUrls,
              height: 673, // Set specific height for the carousel
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Column(
          spacing: 24,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleSubtitleText(
              title: (
                text: l10n.aboutVenueName,
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge => 64,
                  ScreenSize.large => 48,
                  ScreenSize.normal || ScreenSize.small => 24,
                },
              ),
              subtitle: (
                text: l10n.aboutVenueDescription,
                size: switch (context.screenSize) {
                  ScreenSize.extraLarge || ScreenSize.large => 24,
                  ScreenSize.normal || ScreenSize.small => 16,
                },
              ),
              textAlign: TextAlign.start,
            ),
            Flex(
              spacing: 24,
              crossAxisAlignment: switch (context.screenSize) {
                ScreenSize.extraLarge => CrossAxisAlignment.center,
                _ => CrossAxisAlignment.start,
              },
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              direction: switch (context.screenSize) {
                ScreenSize.extraLarge => Axis.horizontal,
                _ => Axis.vertical,
              },
              children: <Widget>[
                Column(
                  spacing: 16,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (final item in venueInfoList)
                      Row(
                        spacing: 10,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox.square(
                            dimension: switch (context.screenSize) {
                              ScreenSize.extraLarge || ScreenSize.large => 32,
                              ScreenSize.normal || ScreenSize.small => 24,
                            },
                            child: SvgPicture.asset(item.icon),
                          ),
                          AdaptableText(
                            item.text,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: switch (context.screenSize) {
                                ScreenSize.extraLarge || ScreenSize.large => 24,
                                ScreenSize.normal || ScreenSize.small => 16,
                              },
                              fontWeight: FontWeight.w400,
                              color: FlutterLatamColors.white,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                FclButton.primary(
                  label: l10n.aboutVenueHowToArrive,
                  icon: SizedBox.square(
                    dimension: switch (context.screenSize) {
                      ScreenSize.extraLarge || ScreenSize.large => 24,
                      ScreenSize.normal || ScreenSize.small => 20,
                    },
                    child: SvgPicture.asset(Assets.images.icons.arrowCurve),
                  ),
                  onPressed: () {
                    Utils.launchUrlLink(
                      'https://maps.app.goo.gl/RcQwVw8JGHLHF4jUA',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ImageCarouselWidget extends StatefulWidget {
  const _ImageCarouselWidget({
    required this.imageUrls,
    required this.height,
    required this.borderRadius,
  });

  final List<String> imageUrls;
  final double height;
  final BorderRadius borderRadius;

  @override
  State<_ImageCarouselWidget> createState() => _ImageCarouselWidgetState();
}

class _ImageCarouselWidgetState extends State<_ImageCarouselWidget> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
    if (widget.imageUrls.length > 1) {
      _startAutoScroll();
    }
  }

  void _startAutoScroll() {
    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (widget.imageUrls.isEmpty || !_pageController.hasClients) return;

      final nextPage = (_currentPage + 1) % widget.imageUrls.length;
      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  void _resetTimer() {
    if (widget.imageUrls.length > 1) {
      _startAutoScroll();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageUrls.isEmpty) {
      return SizedBox(
        height: widget.height,
        child: const Center(child: Text('No images to display')),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: widget.height,
          child: ClipRRect(
            borderRadius: widget.borderRadius,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value:
                            loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                      ),
                    );
                  },
                  errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return const Center(
                      child: Icon(Icons.error, color: Colors.red, size: 50),
                    );
                  },
                );
              },
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
                _resetTimer(); // Reset timer on manual swipe
              },
            ),
          ),
        ),
        if (widget.imageUrls.length > 1) ...[
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageUrls.length, (index) {
              return GestureDetector(
                onTap: () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                  _resetTimer();
                },
                child: Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index
                            ? Colors.white
                            : const Color(0xFF0D4377),
                  ),
                ),
              );
            }),
          ),
        ],
      ],
    );
  }
}
