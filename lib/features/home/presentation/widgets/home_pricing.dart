import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/styles/colors.dart';

class HomePricing extends StatelessWidget {
  const HomePricing({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      spacing: 30,
      children: <Widget>[
        TitleSubtitleText(
          title: (
            text: '¡La experiencia Flutter al alcance de todos!',
            size: switch (context.screenSize) {
              ScreenSize.extraLarge => 64,
              ScreenSize.large => 48,
              ScreenSize.normal || ScreenSize.small => 24,
            },
          ),
          subtitle: (
            text: 'Aprovecha el precio early bird y asegura tu lugar',
            size: switch (context.screenSize) {
              ScreenSize.extraLarge || ScreenSize.large => 24,
              ScreenSize.normal || ScreenSize.small => 16,
            },
          ),
          spacing: 12,
        ),
        ResponsiveGrid(
          columnSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 3,
            _ => 1,
          },
          rowSizes: switch (context.screenSize) {
            ScreenSize.extraLarge => 3,
            _ => _pricingList.length,
          },
          children: <Widget>[
            for (final item in _pricingList) _PricingCardItem(detail: item),
          ],
        ),
      ],
    );
  }
}

class _PricingCardItem extends StatelessWidget {
  const _PricingCardItem({required this.detail});

  final _PricingDetail detail;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: switch (detail.type) {
        _PricingType.early => FlutterLatamColors.yellow,
        _PricingType.regular => FlutterLatamColors.blue,
        _PricingType.late => FlutterLatamColors.red,
      },
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 30),
            child: Center(
              child: Text(
                detail.title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: switch (detail.type) {
                    _PricingType.early => FlutterLatamColors.darkBlue,
                    _ => FlutterLatamColors.white,
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: switch (detail.type) {
              _PricingType.early => const EdgeInsets.all(4),
              _ => EdgeInsets.zero,
            },
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: FlutterLatamColors.darkBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      detail.date,
                      style: TextStyle(
                        fontFamily: 'Recoleta',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: switch (detail.type) {
                          _PricingType.early => FlutterLatamColors.lightYellow,
                          _PricingType.regular => FlutterLatamColors.mediumBlue,
                          _PricingType.late => FlutterLatamColors.lightRed,
                        },
                      ),
                    ),
                    Text(
                      '\$ ${detail.price.toStringAsFixed(0)}',
                      style: TextStyle(
                        fontFamily: 'Recoleta',
                        fontSize: switch (context.screenSize) {
                          ScreenSize.extraLarge || ScreenSize.large => 64,
                          _ => 32,
                        },
                        fontWeight: FontWeight.w700,
                        color: FlutterLatamColors.white,
                      ),
                    ),
                    ...[
                      for (final item in detail.features)
                        Row(
                          children: <Widget>[
                            const Text(
                              '\u2022 ',
                              style: TextStyle(
                                fontSize: 18,
                                color: FlutterLatamColors.white,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: switch (detail.type) {
                                    _PricingType.late => FontWeight.w700,
                                    _ => FontWeight.w400,
                                  },
                                  color: FlutterLatamColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum _PricingType { early, regular, late }

class _PricingDetail {
  _PricingDetail({
    required this.type,
    required this.title,
    required this.date,
    required this.price,
    required this.features,
  });

  final _PricingType type;
  final String title;
  final String date;
  final double price;
  final List<String> features;
}

final _pricingList = <_PricingDetail>[
  _PricingDetail(
    type: _PricingType.regular,
    title: 'Regular',
    date: 'Desde 1 Ago',
    price: 80,
    features: <String>[
      'Entrada a los 2 días del evento',
      'Swag del evento',
      'Acceso a todos los talleres',
    ],
  ),
  _PricingDetail(
    type: _PricingType.early,
    title: 'Early bird',
    date: 'Hasta 31 Jul o agotar stock',
    price: 50,
    features: <String>[
      'Todo lo que incluye Entrada Regular',
      'Sorteo de una cena con speakers',
      'Sorteo de un Dash oficial',
      'Acceso prioritario a talleres',
      '87% de descuento en el libro "Flutter Engineering"',
      'Invitación al After party',
    ],
  ),
  _PricingDetail(
    type: _PricingType.late,
    title: 'Late bird',
    date: 'Desde 1 Sep',
    price: 120,
    features: <String>[
      'Entrada a los 2 días del evento',
      'Swag del evento',
      'Acceso a todos los talleres',
    ],
  ),
];
