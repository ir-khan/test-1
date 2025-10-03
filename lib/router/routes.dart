enum AppRoutes {
  students('students', '/students'),
  studentDetails('student-details', 'details/:${AppParams.studentId}'),
  createStudent('create-student', ':${AppParams.studentId}');

  final String name;
  final String path;

  const AppRoutes(this.name, this.path);

  static String get initialLocation => AppRoutes.students.path;
}

sealed class AppParams {
  static const studentId = 'id';
}
