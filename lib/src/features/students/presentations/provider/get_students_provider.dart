import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/student.dart';
import '../../data/repository/student/student_repository.dart';
import 'order_mode/order_mode_provider.dart';

part 'get_students_provider.g.dart';

@riverpod
class GetStudents extends _$GetStudents {
  @override
  Stream<List<Student>> build() {
    return ref
        .watch(studentRepositoryProvider)
        .getStudents(cursor: 0, mode: ref.watch(toggleOrderModeProvider));
  }

  Future<void> getNext(int cursor, [int limit = 20]) async {
    final result = ref
        .read(studentRepositoryProvider)
        .getStudents(cursor: cursor, mode: ref.read(toggleOrderModeProvider));
    final previousState = await future;
    result.listen((studentsList) {
      state = AsyncData([...previousState, ...studentsList]);
    });
  }
}
