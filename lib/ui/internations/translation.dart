import 'package:flutter/material.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/cfp_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/contact_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/home_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/schedule_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/speakers_container.dart';
import 'package:flutter_conf_colombia/ui/widgets/organisms/tickets_container.dart';

class Translation {
  static const es = Locale('es', 'es_ES');
  static const en = Locale('en', 'en_US');

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      HomeContainer.title: 'About',
      CfpContainer.title: 'CFP',
      TicketsContainer.title: 'Tickets',
      SpeakersContainer.title: 'Speakers',
      ScheduleContainer.title: 'Schedule',
      ContactContainer.title: 'Contact'
    },
    'es': {
      HomeContainer.title: 'Acerca de',
      CfpContainer.title: 'CFP',
      TicketsContainer.title: 'Entradas',
      SpeakersContainer.title: 'Expositores',
      ScheduleContainer.title: 'Cronograma',
      ContactContainer.title: 'Contacto'
    },
  };

  static String of(
    BuildContext context,
    String key, {
    String defaultText = '-?-',
  }) {
    final locale = Localizations.localeOf(context);
    final languageCode = locale.languageCode;
    final values = _localizedValues[languageCode];
    if (values == null) return defaultText;
    return _localizedValues[languageCode]![key] ?? defaultText;
  }
}
