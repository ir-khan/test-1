import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/student_repository.dart';


part 'delete_student_provider.g.dart';

@riverpod
Future<int> deleteStudent(Ref ref, int id) async {
  return await ref.watch(studentRepositoryProvider).deleteStudent(id);
}
