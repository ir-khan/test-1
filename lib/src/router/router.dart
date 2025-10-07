import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/students/presentations/create_student_page.dart';
import '../features/students/presentations/student_details_page.dart';
import '../features/students/presentations/students_page.dart';
import 'routes.dart';

final routerConfigProvider = Provider((ref) {
  return GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.initialLocation,
    routes: [
      GoRoute(
        path: AppRoutes.students.path,
        name: AppRoutes.students.name,
        builder: StudentsPage.route,
        routes: [
          GoRoute(
            path: AppRoutes.createStudent.path,
            name: AppRoutes.createStudent.name,
            builder: CreateStudentPage.route,
          ),
          GoRoute(
            path: AppRoutes.studentDetails.path,
            name: AppRoutes.studentDetails.name,
            builder: StudentDetailsPage.route,
          ),
        ],
      ),
    ],
  );
});
