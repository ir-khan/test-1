import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/models/student.dart';
import '../../data/repository/student_repository.dart';
import 'order_mode/order_mode_provider.dart';

part 'get_students_provider.g.dart';

@riverpod
class GetStudents extends _$GetStudents {
  int _cursor = 0;

  late final _repository = ref.watch(studentRepositoryProvider);

  @override
  Stream<List<Student>> build() {
    return _repository.getStudents(
      cursor: _cursor,
      mode: ref.watch(toggleOrderModeProvider),
    );
  }

  Future<void> getNext(int cursor, [int limit = 20]) async {
    _cursor = cursor;
    final result = _repository.getStudents(
      cursor: _cursor,
      mode: ref.watch(toggleOrderModeProvider),
    );
    final previousState = await future;
    List<Student> students = [];
    result.listen((studentsList) {
      students.addAll(studentsList);
      state = AsyncData([...previousState, ...students]);
    });
  }
}

//
// @riverpod
// Stream<List<Student>> getStudents(Ref ref) {
//   return ref
//       .watch(studentRepositoryProvider)
//       .getStudents(mode: ref.watch(toggleOrderModeProvider));
// }
