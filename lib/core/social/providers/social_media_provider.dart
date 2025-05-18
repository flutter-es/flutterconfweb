import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_conf_latam/core/social/models/social_media_model.dart';
import 'package:flutter_conf_latam/styles/generated/assets.gen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final socialMediaProvider = FutureProvider((_) async {
  final content = await rootBundle.loadString(Assets.files.socialNetworks);
  final response = json.decode(content) as List<dynamic>;

  return [
    for (final item in response)
      SocialMediaModel.fromJson(item as Map<String, dynamic>),
  ];
});
