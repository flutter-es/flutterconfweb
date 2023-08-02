import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_conf_colombia/features/communities/presentation/providers/communities_provider.dart';
import 'package:flutter_conf_colombia/l10n/localization_provider.dart';
import 'package:flutter_conf_colombia/styles/styles.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunitiesList extends ConsumerWidget {

  const CommunitiesList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final communitiesData = ref.watch(communitiesProvider);
    
    return communitiesData.when(
        data: (communities) {

          return communities.isNotEmpty ? Column(
            children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: List.generate(communities.length, (index) {

                      final singleCommunity = communities[index];
                      return Image.network(singleCommunity.image,
                        width: 300,
                        height: 200,
                      );
                    }).animate(
                      interval: 100.ms,
                    ).scaleXY(
                      begin: 0.5, end: 1,
                      curve: Curves.easeInOut,
                    )
                    .fadeIn(),
                  ),
                  FlutterConfLatamStyles.mediumVGap,
            ],
          ) : const SizedBox.shrink();
        }, 
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return const Center(child: Padding(
            padding: FlutterConfLatamStyles.mediumPadding,
            child: CircularProgressIndicator(),
          ));
        },
      );
  }
}