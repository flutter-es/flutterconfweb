import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conf_latam/core/widgets/container/footer.dart';
import 'package:flutter_conf_latam/features/privacy_terms/presentation/view_model/privacy_terms_view_model.dart';
import 'package:flutter_conf_latam/features/privacy_terms/presentation/widgets/markdown_container.dart';
import 'package:flutter_conf_latam/l10n/localization_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TermsPage extends ConsumerStatefulWidget {
  const TermsPage({super.key});

  @override
  ConsumerState<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends ConsumerState<TermsPage> {
  final analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    analytics.logScreenView(screenName: 'terms_page');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            const _TermsMain(),
            const Footer(),
          ]),
        ),
      ],
    );
  }
}

class _TermsMain extends ConsumerWidget {
  const _TermsMain();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(appLocalizationsProvider);
    final termsData = ref.watch(termsProvider(Locale(l10n.localeName)));

    return termsData.maybeWhen(
      data: (data) => MarkdownContainer(markdownData: data),
      orElse: Offstage.new,
    );
  }
}
