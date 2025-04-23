import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/utils/utils.dart';
import 'package:flutter_conf_latam/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialMediaContainer extends ConsumerWidget {
  const SocialMediaContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final socialMediaList = ref.read(socialMediaProvider);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final social in socialMediaList)
          IconButton(
            onPressed: () => Utils.launchUrlLink(social.link),
            icon: Icon(social.icon, color: Colors.white.withValues(alpha: 0.5)),
          ),
      ],
    );
  }
}
