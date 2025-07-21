import 'package:flutter/services.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final privacyPolicyProvider = FutureProvider((ref) async {
  return rootBundle.loadString(Assets.markdown.privacyPolicy);
});
