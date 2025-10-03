// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get students => 'طلبہ';

  @override
  String get noStudents => 'کوئی طالب علم نہیں';

  @override
  String get alert => 'انتباہ!';

  @override
  String get deleteAlertText => 'کیا آپ واقعی حذف کرنا چاہتے ہیں؟';

  @override
  String get yes => 'ہاں';

  @override
  String get no => 'نہیں';

  @override
  String get addStudent => 'طالب علم شامل کریں';

  @override
  String get editStudent => 'طالب علم میں ترمیم کریں';

  @override
  String get updateStudentMessage =>
      'طالب علم کو کامیابی کے ساتھ اپ ڈیٹ کیا گیا!';

  @override
  String get createStudentMessage => 'طالب علم کامیابی کے ساتھ بن گیا!';

  @override
  String get name => 'نام';

  @override
  String get nameErrorMessage => 'طالب علم کا نام درج کریں۔';

  @override
  String get marks => 'نمبر';

  @override
  String get marksErrorMessage1 => 'طالب علم کے نمبر درج کریں۔';

  @override
  String get marksErrorMessage2 => 'ایک نمبر (0-100) درج کریں۔';

  @override
  String get status => 'حیثیت';

  @override
  String get update => 'اپ ڈیٹ کریں';

  @override
  String get create => 'بناؤ';

  @override
  String get studentDetails => 'طالب علم کی تفصیلات';

  @override
  String get passed => 'کامیاب';

  @override
  String get failed => 'کامیاب';

  @override
  String get grade => 'گریڈ';

  @override
  String get result => 'نتیجہ';
}
