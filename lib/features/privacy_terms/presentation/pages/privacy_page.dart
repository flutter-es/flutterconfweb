import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/privacy_terms/presentation/view_model/privacy_terms_view_model.dart';
import 'package:flutter_conf_latam/features/privacy_terms/presentation/widgets/markdown_container.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PrivacyPage extends ConsumerStatefulWidget {
  const PrivacyPage({super.key});

  @override
  ConsumerState<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends ConsumerState<PrivacyPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'privacy_page');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const _PrivacyMain(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

class _PrivacyMain extends ConsumerWidget {
  const _PrivacyMain();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final privacyPolicyData = ref.watch(
      privacyPolicyProvider(Locale(l10n.localeName)),
    );

    return privacyPolicyData.maybeWhen(
      data: (data) => MarkdownContainer(markdownData: data),
      orElse: Offstage.new,
    );
  }
}
