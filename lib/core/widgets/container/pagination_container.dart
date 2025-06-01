import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class PaginationContainer extends StatelessWidget {
  const PaginationContainer({
    required this.child,
    required this.totalSize,
    required this.pageSize,
    required this.onChangedPage,
    this.currentPage = 1,
    this.maxButtons = 3,
    super.key,
  });

  final Widget child;
  final int totalSize;
  final int pageSize;
  final ValueSetter<int> onChangedPage;
  final int currentPage;
  final int maxButtons;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        child,
        SizedBox(
          height: 84,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 20,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _PaginationButton(
                  onPressed: currentPage > 1
                      ? () => onChangedPage(currentPage - 1)
                      : null,
                  child: const Icon(Icons.arrow_back_ios, size: 24),
                ),
                _PaginationNumberButtons(
                  currentPage: currentPage,
                  totalPages: _totalPages,
                  onSendPage: onChangedPage,
                  maxButtons: maxButtons,
                ),
                _PaginationButton(
                  onPressed: currentPage < _totalPages
                      ? () => onChangedPage(currentPage + 1)
                      : null,
                  child: const Icon(Icons.arrow_forward_ios, size: 24),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  int get _totalPages => (totalSize / pageSize).ceil();
}

class _PaginationNumberButtons extends StatelessWidget {
  const _PaginationNumberButtons({
    required this.currentPage,
    required this.totalPages,
    required this.onSendPage,
    required this.maxButtons,
  });

  final int currentPage;
  final int totalPages;
  final ValueSetter<int> onSendPage;
  final int maxButtons;

  @override
  Widget build(BuildContext context) {
    if (totalPages <= 1) return const Offstage();

    var startPage = max(1, currentPage - (maxButtons / 2).floor());
    final endPage = min(totalPages, startPage + maxButtons - 1);

    if (endPage == totalPages) startPage = max(1, totalPages - maxButtons + 1);

    return Row(
      spacing: 20,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (startPage > 1) ...[
          _PaginationButton(
            onPressed: () => onSendPage(1),
            child: const Text('1'),
          ),
          if (startPage > 2) const _PaginationButton(child: Text('...')),
        ],
        ...[
          for (var i = startPage; i <= endPage; i++)
            _PaginationButton(
              onPressed: () => onSendPage(i),
              isActive: currentPage == i,
              child: Text('$i'),
            ),
        ],
        if (endPage < totalPages) ...[
          if (endPage < totalPages - 1)
            const _PaginationButton(child: Text('...')),
          _PaginationButton(
            onPressed: () => onSendPage(totalPages),
            child: Text('$totalPages'),
          ),
        ],
      ],
    );
  }
}

class _PaginationButton extends StatelessWidget {
  const _PaginationButton({
    required this.child,
    this.onPressed,
    this.isActive = false,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final background = isActive ? FlutterLatamColors.blue : Colors.transparent;

    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: const Size.square(64),
        shadowColor: background,
        backgroundColor: background,
        foregroundColor: FlutterLatamColors.white,
        disabledForegroundColor: FlutterLatamColors.white.withValues(alpha: .5),
        shape: RoundedRectangleBorder(
          side: isActive
              ? BorderSide.none
              : const BorderSide(color: FlutterLatamColors.white, width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(6)),
        ),
        textStyle: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: FlutterLatamColors.white,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
