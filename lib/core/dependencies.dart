import 'package:flutter_conf_backend/flutter_conf_backend.dart';
import 'package:flutter_conf_core/flutter_conf_core.dart';
import 'package:flutter_conf_latam/core/config/config.dart';
import 'package:flutter_conf_latam/core/services/web_local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals.dart';

late final Signal<SharedPreferences> sharedPrefsInstance;

void initSharedPreferences(SharedPreferences prefs) {
  sharedPrefsInstance = signal(prefs);
}

final webLocalStorage = computed(() {
  return WebLocalStorageService(preferences: sharedPrefsInstance.value);
});

final appConfig = signal(Config());

final analyticsDataSource = signal(AnalyticsDataSource());
final sponsorDataSource = signal(SponsorDataSource());
final speakerDataSource = signal(SpeakerDataSource());
final faqDataSource = signal(FaqDataSource());
final galleryDataSource = signal(GalleryDataSource());
final communityDataSource = signal(CommunityDataSource());
final organizerDataSource = signal(OrganizerDataSource());
final ticketPricingDataSource = signal(TicketPricingDataSource());
final eventDayDataSource = signal(EventDayDataSource());
final venueDataSource = signal(VenueDataSource());

final analyticsRepository = computed(
  () => AnalyticsRepository(dataSource: analyticsDataSource.value),
);
final sponsorRepository = computed(
  () => SponsorRepository(dataSource: sponsorDataSource.value),
);
final speakerRepository = computed(
  () => SpeakerRepository(dataSource: speakerDataSource.value),
);
final faqRepository = computed(
  () => FaqRepository(dataSource: faqDataSource.value),
);
final galleryRepository = computed(
  () => GalleryRepository(dataSource: galleryDataSource.value),
);
final communityRepository = computed(
  () => CommunityRepository(dataSource: communityDataSource.value),
);
final organizerRepository = computed(
  () => OrganizerRepository(dataSource: organizerDataSource.value),
);
final ticketPricingRepository = computed(
  () => TicketPricingRepository(dataSource: ticketPricingDataSource.value),
);
final eventDayRepository = computed(
  () => EventDayRepository(dataSource: eventDayDataSource.value),
);
final venueRepository = computed(
  () => VenueRepository(dataSource: venueDataSource.value),
);
