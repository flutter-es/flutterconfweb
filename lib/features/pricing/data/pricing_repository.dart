import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_conf_latam/core/dependencies.dart';
import 'package:flutter_conf_latam/features/pricing/domain/models/tickets/tickets_model.dart';
import 'package:signals/signals.dart';

class PricingRepository {
  PricingRepository(this.functions);

  final FirebaseFunctions functions;

  static const _ticketsFunction = 'getTickets';

  Future<List<TicketsModel>> getTickets({String language = 'es'}) async {
    final callableMethod = functions.httpsCallable(_ticketsFunction);
    final response = await callableMethod.call<List<dynamic>>({
      'lang': language,
    });

    return [
      for (final item in response.data)
        TicketsModel.fromJson(item as Map<String, dynamic>),
    ];
  }
}

final pricingRepository = computed(
  () => PricingRepository(firebaseFunctions.value),
);
