import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/speakers/domain/models/speaker_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpeakersRepository {
  SpeakersRepository(this.functions);

  final FirebaseFunctions functions;

  static const _speakersFunction = 'getSpeakers';
  static const _speakerFunction = 'getSpeakerById';

  Future<List<SpeakerModel>> getSpeakers({
    String language = 'es',
    bool isRandom = false,
  }) async {
    final callableMethod = functions.httpsCallable(_speakersFunction);
    final response = await callableMethod.call<List<dynamic>>({
      'lang': language,
      if (isRandom) ...{'random': true, 'limit': 15},
    });

    return [
      for (final item in response.data)
        SpeakerModel.fromJson(item as Map<String, dynamic>),
    ];
  }

  Future<SpeakerModel> getSpeaker({
    required String speakerId,
    String language = 'es',
  }) async {
    final callableMethod = functions.httpsCallable(_speakerFunction);
    final response = await callableMethod.call<List<dynamic>>({
      'lang': language,
      'speakerId': speakerId,
    });

    return SpeakerModel.fromJson(response.data as Map<String, dynamic>);
  }
}

final speakersRepositoryProvider = Provider(
  (ref) => SpeakersRepository(ref.watch(firebaseFunctionsProvider)),
);
