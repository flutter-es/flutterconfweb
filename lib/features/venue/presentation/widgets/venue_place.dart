import 'package:flutter/material.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/responsive/responsive_context_layout.dart';
import 'package:flutter_conf_latam/core/widgets/card/grid_card_item.dart';
import 'package:flutter_conf_latam/core/widgets/container/responsive_grid.dart';
import 'package:flutter_conf_latam/core/widgets/container/section_container.dart';
import 'package:flutter_conf_latam/core/widgets/text/title_subtitle_text.dart';
import 'package:flutter_conf_latam/features/venue/presentation/view_model/venue_view_model.dart';
import 'package:flutter_conf_latam/l10n/gen/app_localizations.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:signals/signals_flutter.dart';

class VenuePlace extends StatelessWidget {
  const VenuePlace({super.key});

  String _amenityImage(VenueAmenities amenity) {
    return switch (amenity) {
      .wifi || .chargingStations => Assets.images.about.university,
      .catering ||
      .cafeteria ||
      .waterStations ||
      .vendingMachines => Assets.images.about.food,
      .parking ||
      .valetParking ||
      .publicTransportAccess => Assets.images.about.taxi,
      .accessibility ||
      .elevators ||
      .wheelchairRamps ||
      .restrooms ||
      .nursingRoom => Assets.images.about.security,
      _ => Assets.images.about.map,
    };
  }

  String _amenityTitle(VenueAmenities amenity, AppLocalizations l10n) {
    return switch (amenity) {
      .wifi => l10n.amenityWifi,
      .chargingStations => l10n.amenityChargingStations,
      .accessibility => l10n.amenityAccessibility,
      .elevators => l10n.amenityElevators,
      .wheelchairRamps => l10n.amenityWheelchairRamps,
      .parking => l10n.amenityParking,
      .valetParking => l10n.amenityValetParking,
      .publicTransportAccess => l10n.amenityPublicTransportAccess,
      .catering => l10n.amenityCatering,
      .cafeteria => l10n.amenityCafeteria,
      .waterStations => l10n.amenityWaterStations,
      .vendingMachines => l10n.amenityVendingMachines,
      .airConditioning => l10n.amenityAirConditioning,
      .restrooms => l10n.amenityRestrooms,
      .lockers => l10n.amenityLockers,
      .coatCheck => l10n.amenityCoatCheck,
      .atm => l10n.amenityAtm,
      .security => l10n.amenitySecurity,
      .firstAid => l10n.amenityFirstAid,
      .nursingRoom => l10n.amenityNursingRoom,
      .prayerRoom => l10n.amenityPrayerRoom,
      .smokingArea => l10n.amenitySmokingArea,
      .outdoorArea => l10n.amenityOutdoorArea,
      .greenRoom => l10n.amenityGreenRoom,
      .quietRoom => l10n.amenityQuietRoom,
      .projectors => l10n.amenityProjectors,
      .soundSystem => l10n.amenitySoundSystem,
      .liveStreaming => l10n.amenityLiveStreaming,
      .translationServices => l10n.amenityTranslationServices,
      .other => l10n.amenityOther,
    };
  }

  String _amenityDescription(VenueAmenities amenity, AppLocalizations l10n) {
    return switch (amenity) {
      .wifi => l10n.amenityWifiDescription,
      .chargingStations => l10n.amenityChargingStationsDescription,
      .accessibility => l10n.amenityAccessibilityDescription,
      .parking => l10n.amenityParkingDescription,
      .publicTransportAccess => l10n.amenityPublicTransportAccessDescription,
      .catering => l10n.amenityCateringDescription,
      .cafeteria => l10n.amenityCafeteriaDescription,
      .waterStations => l10n.amenityWaterStationsDescription,
      .restrooms => l10n.amenityRestroomsDescription,
      .firstAid => l10n.amenityFirstAidDescription,
      _ => _amenityTitle(amenity, l10n),
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = appLocalizations.watch(context);

    return Watch((context) {
      final venueState = venueSignal.value;
      return venueState.maybeMap(
        data: (venue) {
          final amenities = venue.amenities;

          if (amenities.isEmpty) {
            final about = <({String title, String description, String image})>[
              (
                title: l10n.aboutPlaceInstallationTitle,
                description: l10n.aboutPlaceInstallationDescription,
                image: Assets.images.about.university,
              ),
              (
                title: l10n.aboutPlaceFoodTitle,
                description: l10n.aboutPlaceFoodDescription,
                image: Assets.images.about.food,
              ),
              (
                title: l10n.aboutPlaceMoveTitle,
                description: l10n.aboutPlaceMoveDescription,
                image: Assets.images.about.map,
              ),
            ];

            return SectionContainer(
              spacing: 30,
              children: <Widget>[
                TitleSubtitleText(
                  title: (
                    text: l10n.aboutPlaceTitle,
                    size: switch (context.screenSize) {
                      .extraLarge => 64,
                      .large => 48,
                      .normal || .small => 24,
                    },
                  ),
                  subtitle: (
                    text: l10n.aboutPlaceDescription,
                    size: switch (context.screenSize) {
                      .extraLarge || .large => 24,
                      .normal || .small => 16,
                    },
                  ),
                  spacing: 12,
                ),
                ResponsiveGrid(
                  columnSizes: switch (context.screenSize) {
                    .extraLarge => 3,
                    _ => 1,
                  },
                  rowSizes: switch (context.screenSize) {
                    .extraLarge => 2,
                    _ => about.length,
                  },
                  children: <Widget>[
                    for (final item in about)
                      GridCardItem(
                        title: item.title,
                        description: item.description,
                        imagePath: item.image,
                      ),
                  ],
                ),
              ],
            );
          }

          return SectionContainer(
            spacing: 30,
            children: <Widget>[
              TitleSubtitleText(
                title: (
                  text: l10n.aboutPlaceTitle,
                  size: switch (context.screenSize) {
                    .extraLarge => 64,
                    .large => 48,
                    .normal || .small => 24,
                  },
                ),
                subtitle: (
                  text: l10n.aboutPlaceDescription,
                  size: switch (context.screenSize) {
                    .extraLarge || .large => 24,
                    .normal || .small => 16,
                  },
                ),
                spacing: 12,
              ),
              ResponsiveGrid(
                columnSizes: switch (context.screenSize) {
                  .extraLarge => 3,
                  _ => 1,
                },
                rowSizes: switch (context.screenSize) {
                  .extraLarge => 2,
                  _ => amenities.length,
                },
                children: <Widget>[
                  for (final amenity in amenities)
                    GridCardItem(
                      title:
                          amenity.customName ??
                          _amenityTitle(amenity.type, l10n),
                      description: _amenityDescription(amenity.type, l10n),
                      imagePath: _amenityImage(amenity.type),
                    ),
                ],
              ),
            ],
          );
        },
        orElse: () => const Offstage(),
      );
    });
  }
}
