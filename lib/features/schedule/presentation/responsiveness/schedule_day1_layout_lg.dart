import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/providers/schedule_providers.dart';
import 'package:flutter_conf_latam/features/schedule/presentation/responsiveness/schedule_content_responsive_config.dart';
import 'package:flutter_conf_latam/features/sessions/data/models/session.model.dart';
import 'package:flutter_conf_latam/features/speakers/data/models/speaker.model.dart';
import 'package:flutter_conf_latam/helpers/utils.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ScheduleDay1LargeLayout extends ConsumerWidget {
  const ScheduleDay1LargeLayout({
    required this.speakers,
    required this.sessions,
    super.key,
  });

  final List<SessionModel> sessions;
  final List<SpeakerModel> speakers;

  Widget getSessionFromSlotId(String id, WidgetRef ref) {
    return ref.read(scheduleSlotProvider(id));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = ref.watch(appLocalizationsProvider);
    final uiConfig =
        ScheduleContentResponsiveConfig.getSchedulePageResponsiveConfig(
          context,
        );
    final headerCellCount = getValueForScreenType(
      context: context,
      mobile: 0.75,
      tablet: 0.5,
      desktop: 0.5,
    );

    return StaggeredGrid.count(
      axisDirection: AxisDirection.down,
      crossAxisCount: 7,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: headerCellCount,
          child: const SizedBox.shrink(),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: headerCellCount,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: uiConfig.trackTabPadding,
                color: Colors.orangeAccent,
                child: Text(
                  appLoc.scheduleTrack1,
                  style: uiConfig.trackLabelStyle.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: headerCellCount,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: uiConfig.trackTabPadding,
                color: Colors.orangeAccent,
                child: Text(
                  appLoc.scheduleTrack2,
                  style: uiConfig.trackLabelStyle.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: headerCellCount,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: uiConfig.trackTabPadding,
                color: Colors.greenAccent,
                child: Text(
                  appLoc.scheduleWorkshops,
                  style: uiConfig.trackLabelStyle.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '7:00 - 9:00 AM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 6,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-1', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '9:00 AM - 10:00 AM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 6,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-2', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '10:00 - 10:40 AM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-3', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-4', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: getSessionFromSlotId('1-5', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '10:40 - 11:00 AM'),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-6', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '11:00 - 11:40 AM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-7', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-8', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-9', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '11:40 - 12:00 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-10', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-11', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: getSessionFromSlotId('1-12', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '12:00 - 12:40 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-13', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-14', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '12:40 - 14:00 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 6,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-15', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '14:00 - 14:20 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-16', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-17', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: getSessionFromSlotId('1-18', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '14:20 - 15:00 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-19', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-20', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '15:00 - 15:20 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-21', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: getSessionFromSlotId('1-22', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '15:20 - 16:00 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-23', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-24', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '16:00 - 16:20 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-25', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-26', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '16:20 - 17:00 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-27', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-28', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: getSessionFromSlotId('1-29', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '17:00 - 17:20 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-30', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '17:20 - 18:00 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-31', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-32', ref),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-33', ref),
        ),

        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Utils.getTimeLabelHeader(context, '18:00 - 18:20 PM'),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 6,
          mainAxisCellCount: 1,
          child: getSessionFromSlotId('1-34', ref),
        ),
      ],
    );
  }
}
