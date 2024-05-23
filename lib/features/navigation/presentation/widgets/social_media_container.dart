import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/features/navigation/presentation/providers/navigation_providers.dart';
import 'package:flutter_conf_colombia/helpers/utils.dart';
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
            icon: Icon(social.icon, color: Colors.white.withOpacity(0.5)),
          ),
      ],
    );
  }
}
