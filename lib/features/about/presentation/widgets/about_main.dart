import 'dart:async'; // Added for Timer

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class AboutMain extends ConsumerWidget {
  const AboutMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final carouselImageUrls = <String>[
      'assets/images/udla/udla1.png',
      'assets/images/udla/udla2.png',
      'assets/images/udla/udla3.png',
    ];

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 122, right: 122, bottom: 48),
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: FlutterLatamColors.darkBlue),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 1440,
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(color: Color(0xFF042B59)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: SizedBox(
                        width: 1180,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 90,
                                    height: 68,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://placehold.co/90x68',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: SizedBox(
                  width: 1196, // Set specific width for the carousel container
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Using the carousel widget
                      _ImageCarouselWidget(
                        imageUrls: carouselImageUrls,
                        height: 673, // Set specific height for the carousel
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 1196,
                        child: Text(
                          l10n?.conctacUdla ?? '¡Nos vemos en la Universidad de las Américas!', // Replaced hardcoded string
                          style: TextStyle(
                            color: FlutterLatamColors.white,
                            fontSize: switch (context.screenSize) {
                              ScreenSize.extraLarge || ScreenSize.large => 40,
                              ScreenSize.normal || ScreenSize.small => 16,
                            },
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 1196,
                        child: Text(
                          l10n?.conctactDescription ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: switch (context.screenSize) {
                              ScreenSize.extraLarge || ScreenSize.large => 40,
                              ScreenSize.normal || ScreenSize.small => 16,
                            },
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Stack(),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Vía a Nayón, Quito',
                                        style: TextStyle(
                                          color: FlutterLatamColors.white,
                                          fontSize: switch (context
                                              .screenSize) {
                                            ScreenSize.extraLarge ||
                                            ScreenSize.large => 40,
                                            ScreenSize.normal ||
                                            ScreenSize.small => 16,
                                          },
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: const BoxDecoration(),
                                        child: const Stack(),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        l10n?.contactCapacity ?? '',
                                        style: TextStyle(
                                          color: FlutterLatamColors.white,
                                          fontSize: switch (context
                                              .screenSize) {
                                            ScreenSize.extraLarge ||
                                            ScreenSize.large => 40,
                                            ScreenSize.normal ||
                                            ScreenSize.small => 16,
                                          },
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            InkWell(
                              onTap: () async {
                                Uri.parse(
                                  'https://maps.app.goo.gl/RcQwVw8JGHLHF4jUA',
                                );
                              },
                              child: Container(
                                height: 68,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                ),
                                decoration: ShapeDecoration(
                                  color: FlutterLatamColors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: const BoxDecoration(),
                                      child:
                                          const Stack(),
                                    ),
                                    const SizedBox(width: 12),
                                    Text(
                                      l10n?.howToGet ?? '¿Cómo llegar?',
                                      style: TextStyle(
                                        color: FlutterLatamColors.white,
                                        fontSize: switch (context.screenSize) {
                                          ScreenSize.extraLarge ||
                                          ScreenSize.large =>
                                            20,
                                          ScreenSize.normal ||
                                          ScreenSize.small => 16,
                                        },
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
