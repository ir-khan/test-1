// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get students => 'Students';

  @override
  String get noStudents => 'No Students';

  @override
  String get alert => 'Alert!';

  @override
  String get deleteAlertText => 'Are you sure want to delete?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get addStudent => 'Add Student';

  @override
  String get editStudent => 'Edit Student';

  @override
  String get updateStudentMessage => 'Student updated successfully!';

  @override
  String get createStudentMessage => 'Student created successfully!';

  @override
  String get name => 'Name';

  @override
  String get nameErrorMessage => 'Enter student name.';

  @override
  String get marks => 'Marks';

  @override
  String get marksErrorMessage1 => 'Enter student marks.';

  @override
  String get marksErrorMessage2 => 'Enter a number (0-100).';

  @override
  String get status => 'Status';

  @override
  String get update => 'Update';

  @override
  String get create => 'Create';

  @override
  String get studentDetails => 'Student Details';

  @override
  String get passed => 'Passed';

  @override
  String get failed => 'Failed';

  @override
  String get grade => 'Grade';

  @override
  String get result => 'Result';
}
