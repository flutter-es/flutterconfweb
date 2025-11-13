import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/schedule/domain/models/schedule_response_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ScheduleRepository {
  ScheduleRepository(this.functions);

  final FirebaseFunctions functions;

  static const _scheduleFunction = 'getConferenceSchedule';

  Future<ScheduleResponseModel> getSchedules({
    String language = 'es',
  }) async {
    final callableMethod = functions.httpsCallable(_scheduleFunction);
    final response = await callableMethod.call<Map<String, dynamic>>({
      'lang': language,
    });
    return ScheduleResponseModel.fromJson(response.data);
  }
}

final scheduleRepositoryProvider = Provider(
  (ref) => ScheduleRepository(ref.watch(firebaseFunctionsProvider)),
);
