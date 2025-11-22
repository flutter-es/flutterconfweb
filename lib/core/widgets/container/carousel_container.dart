import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/images/single_image.dart';

class CarouselContainer extends StatefulWidget {
  const CarouselContainer({
    required this.imageUrls,
    this.height = 400,
    this.autoPlayDuration = const Duration(seconds: 2),
    this.animationCurve = Curves.easeInOut,
    super.key,
  });

  final List<String> imageUrls;
  final double height;
  final Duration autoPlayDuration;
  final Curve animationCurve;

  @override
  State<CarouselContainer> createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  late PageController _pageController;

  int _currentPage = 0;
  Timer? _autoPlayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: .85);
    _startAutoPlay();
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(widget.autoPlayDuration, (timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        unawaited(
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 600),
            curve: widget.animationCurve,
          ),
        );
      }
    });
  }

  void _stopAutoPlay() => _autoPlayTimer?.cancel();

  void _resumeAutoPlay() => _startAutoPlay();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: MouseRegion(
        onEnter: (_) => _stopAutoPlay(),
        onExit: (_) => _resumeAutoPlay(),
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _currentPage = index),
          itemCount: widget.imageUrls.length,
          itemBuilder: (_, index) {
            return AnimatedBuilder(
              animation: _pageController,
              builder: (_, child) {
                var value = 1.0;
                if (_pageController.position.haveDimensions) {
                  value = (_pageController.page ?? 0) - index;
                  value = (1 - (value.abs() * 0.3)).clamp(0.7, 1.0);
                }

                return Center(
                  child: SizedBox(
                    height: Curves.easeOut.transform(value) * widget.height,
                    child: child,
                  ),
                );
              },
              child: _CarouselCard(
                imageUrl: widget.imageUrls[index],
                isActive: _currentPage == index,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _CarouselCard extends StatelessWidget {
  const _CarouselCard({required this.imageUrl, required this.isActive});

  final String imageUrl;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: .circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withValues(alpha: isActive ? .3 : .15),
              blurRadius: isActive ? 20 : 10,
              offset: Offset(0, isActive ? 10 : 5),
            ),
          ],
        ),
        child: Center(
          child: SingleImage(
            imageUrl: imageUrl,
            borderRadius: 12,
            size: const Size.square(360),
          ),
        ),
      ),
    );
  }
}
