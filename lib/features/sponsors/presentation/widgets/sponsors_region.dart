import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_latam/core/enums/enums.dart';
import 'package:flutter_conf_latam/features/sponsors/presentation/providers/sponsors.providers.dart';
import 'package:flutter_conf_latam/features/sponsors/presentation/widgets/sponsor_widget.dart';
import 'package:flutter_conf_latam/features/sponsors/presentation/widgets/sponsors_region_header.dart';
import 'package:flutter_conf_latam/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorsRegion extends ConsumerWidget {
  const SponsorsRegion({required this.level, super.key});

  final SponsorshipLevels level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sponsorsData = ref.watch(filterSponsorsProvider(level));

    return sponsorsData.when(
      data: (sponsors) {
        return sponsors.isNotEmpty
            ? Column(
              children: [
                SponsorsRegionHeader(level: level),
                FlutterConfLatamStyles.mediumVGap,
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children:
                      List.generate(sponsors.length, (index) {
                            final singleSponsor = sponsors[index];
                            return SponsorWidget(sponsor: singleSponsor);
                          })
                          .animate(interval: 100.ms)
                          .scaleXY(begin: 0.5, end: 1, curve: Curves.easeInOut)
                          .fadeIn(),
                ),
                FlutterConfLatamStyles.mediumVGap,
              ],
            )
            : const SizedBox.shrink();
      },
      error: (error, stackTrace) {
        return Center(child: Text(error.toString()));
      },
      loading: () {
        return const Center(
          child: Padding(
            padding: FlutterConfLatamStyles.mediumPadding,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
