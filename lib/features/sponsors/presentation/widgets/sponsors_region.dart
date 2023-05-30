import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/providers/sponsors.providers.dart';
import 'package:flutter_conf_colombia/features/sponsors/presentation/widgets/sponsors_region_header.dart';
import 'package:flutter_conf_colombia/helpers/enums.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class SponsorsRegion extends ConsumerWidget {

  const SponsorsRegion({
    required this.level, 
    super.key,
  });

  final SponsorshipLevels level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final sponsorsData = ref.watch(filterSponsorsProvider(level));

    return sponsorsData.when(
        data: (sponsors) {

          return sponsors.isNotEmpty ? Column(
            children: [
              SponsorsRegionHeader(level: level),
              FlutterConfLatamStyles.mediumVGap,
                  Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: List.generate(sponsors.length, (index) {

                      final singleSponsor = sponsors[index];
                      return SvgPicture.asset(singleSponsor.imgUrl,
                        width: 100, height: 100,
                      );
                    }),
                  ),
                  FlutterConfLatamStyles.mediumVGap,
            ],
          ) : const SizedBox.shrink();
        }, 
        error:(error, stackTrace) {
          return Text('error');
        }, 
        loading:() => CircularProgressIndicator(),
      );
  }
}