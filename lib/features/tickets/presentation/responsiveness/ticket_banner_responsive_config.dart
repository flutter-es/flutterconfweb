import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class TicketBannerResponsiveConfig {
  const TicketBannerResponsiveConfig({
    required this.bannerSize, 
    required this.dashSize, 
    required this.dashOffset, 
    required this.titleSize, 
    required this.dashAlignment, 
    required this.titleAlignment, 
    required this.titleTextAlign, 
    required this.ticketButtonIconSize, 
    required this.ticketButtonLabelSize, 
    required this.ticketButtonIconPadding, 
    required this.ticketButtonMargin, 
    required this.ticketButtonAlignment, 
    required this.ticketButtonColumnCrossAxis, 
    required this.ticketButtonColumnMainAxis,
});


  final double bannerSize;
  final double dashSize;
  final double dashOffset;
  final double titleSize;
  final Alignment dashAlignment;
  final Alignment titleAlignment;
  final TextAlign titleTextAlign;
  final double ticketButtonIconSize;
  final double ticketButtonLabelSize;
  final double ticketButtonIconPadding;
  final double ticketButtonMargin;
  final Alignment ticketButtonAlignment;
  final CrossAxisAlignment ticketButtonColumnCrossAxis;
  final MainAxisAlignment ticketButtonColumnMainAxis;

  static TicketBannerResponsiveConfig getTicketBannerResponsiveConfig(BuildContext ctxt) {
    final config = getValueForScreenType(
      context: ctxt,
      mobile: const TicketBannerResponsiveConfig(
        bannerSize: 600,
        dashSize: 800,
        dashOffset: -320,
        titleSize: 30,
        dashAlignment: Alignment.bottomCenter,
        titleAlignment: Alignment.topCenter,
        titleTextAlign: TextAlign.center,
        ticketButtonIconSize: 20.0,
        ticketButtonLabelSize: 20.0,
        ticketButtonIconPadding: 10.0,
        ticketButtonMargin: 0.0,
        ticketButtonAlignment: Alignment.center,
        ticketButtonColumnCrossAxis: CrossAxisAlignment.center,
        ticketButtonColumnMainAxis: MainAxisAlignment.center,
      ),
      tablet: const TicketBannerResponsiveConfig(
        bannerSize: 600,
        dashSize: 800,
        dashOffset: -250,
        titleSize: 40,
        dashAlignment: Alignment.bottomLeft,
        titleAlignment: Alignment.topRight,
        titleTextAlign: TextAlign.center,
        ticketButtonIconSize: 20.0,
        ticketButtonLabelSize: 30.0,
        ticketButtonIconPadding: 20.0,
        ticketButtonMargin: 30.0,
        ticketButtonAlignment: Alignment.bottomRight,
        ticketButtonColumnCrossAxis: CrossAxisAlignment.end,
        ticketButtonColumnMainAxis: MainAxisAlignment.end,
      ),
      desktop: const TicketBannerResponsiveConfig(
        bannerSize: 600,
        dashSize: 900,
        dashOffset: -250,
        titleSize: 50,
        dashAlignment: Alignment.bottomLeft,
        titleAlignment: Alignment.topRight,
        titleTextAlign: TextAlign.right,
        ticketButtonIconSize: 20.0,
        ticketButtonLabelSize: 30.0,
        ticketButtonIconPadding: 20.0,
        ticketButtonMargin: 40.0,
        ticketButtonAlignment: Alignment.bottomRight,
        ticketButtonColumnCrossAxis: CrossAxisAlignment.end,
        ticketButtonColumnMainAxis: MainAxisAlignment.end,
      ),
    );

    return config;
  }
}
