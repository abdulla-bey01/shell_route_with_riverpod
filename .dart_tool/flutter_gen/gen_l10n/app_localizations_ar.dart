import 'app_localizations.dart';

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get tasks => 'مهام';

  @override
  String get projects => 'المشاريع';

  @override
  String get teams => 'فرق';

  @override
  String get titleNotFound => 'العنوان غير موجود';

  @override
  String get dateNotFound => 'التاريخ غير موجود';

  @override
  String get descriptionNotFound => 'الوصف غير موجود';
}
