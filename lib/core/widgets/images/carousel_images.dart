import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/extensions/extension_methods.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class CarouselImages extends StatefulWidget {
  const CarouselImages({required this.images, this.aspectRatio = 2, super.key})
    : assert(images.length >= 1, 'Carousel must have at least one image');

  final List<String> images;
  final double aspectRatio;

  @override
  State<CarouselImages> createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  late final PageController _pageController = PageController();

  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.images.length > 1) _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox.fromSize(
              size: Size(width, width / widget.aspectRatio),
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.images.length,
                onPageChanged: (page) {
                  setState(() => _currentPage = page);
                  _resetTimer();
                },
                itemBuilder: (_, index) {
                  final imagePath = widget.images[index];
                  return AspectRatio(
                    aspectRatio: widget.aspectRatio,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: switch (imagePath.isValidUrl) {
                          true => NetworkImage(imagePath),
                          false => AssetImage(imagePath),
                        },
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, loadingProgress) {
                          if (loadingProgress == null) return child;

                          final value = loadingProgress.cumulativeBytesLoaded;
                          final total = loadingProgress.expectedTotalBytes;

                          return Center(
                            child: CircularProgressIndicator(
                              color: FlutterLatamColors.white,
                              value: total != null ? value / total : null,
                            ),
                          );
                        },
                        errorBuilder: (_, _, _) {
                          return const Center(
                            child: Text('Error al cargar la imagen'),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            if (widget.images.length > 1)
              Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (_pageController.hasClients) _animatePage(index);
                        _resetTimer();
                      },
                      child: SizedBox.square(
                        dimension: 12,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: switch (_currentPage == index) {
                              true => FlutterLatamColors.white,
                              false => FlutterLatamColors.darkBlue,
                            },
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
          ],
        );
      },
    );
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!mounted && (widget.images.isEmpty || !_pageController.hasClients)) {
        timer.cancel();
        return;
      }
      _animatePage((_currentPage + 1) % widget.images.length);
    });
  }

  void _animatePage(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _resetTimer() {
    if (widget.images.length > 1) _startAutoScroll();
  }
}
