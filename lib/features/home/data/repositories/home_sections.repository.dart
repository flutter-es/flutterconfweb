import 'package:flutter_conf_latam/features/home/data/models/home_section.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/datelocation_container.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/event_features_container.dart';
import 'package:flutter_conf_latam/features/home/presentation/widgets/home_container.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeSectionsRepository {
  const HomeSectionsRepository(this.ref);

  final Ref ref;

  List<HomeSection> getHomeSections() {
    return [
      HomeSection(builder: (_) => HomeContainer()),
      HomeSection(builder: (_) => const DateLocationContainer()),
      HomeSection(builder: (_) => const EventFeaturesContainer()),
    ];
  }
}
