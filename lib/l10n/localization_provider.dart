import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final localizationProvider = StateNotifierProvider<LocalizationNotifier, Locale>((ref) {
  return LocalizationNotifier();
});

class LocalizationNotifier extends StateNotifier<Locale> {
  LocalizationNotifier() : super(Locale('en'));

  void changeLocale(Locale locale) {
    state = locale;
  }
}
