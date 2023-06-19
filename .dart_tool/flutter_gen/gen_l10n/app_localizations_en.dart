import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get tasks => 'Tasks';

  @override
  String get projects => 'Projects';

  @override
  String get teams => 'Teams';

  @override
  String get titleNotFound => 'Title not found';

  @override
  String get dateNotFound => 'Date not found';

  @override
  String get descriptionNotFound => 'Description not found';
}
