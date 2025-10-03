import '../../../../../utils/enums.dart';
import '../../../../data/students/data_source/student_db_source.dart';
import '../../models/student.dart';
import '../student_repository.dart';

class StudentRepositoryImpl extends StudentRepository {
  StudentRepositoryImpl(super.database);

  StudentDbSource get _source => StudentDbSource(database);

  @override
  Future<int> createStudent(Student student) async {
    return await _source.createStudent(student.toDto());
  }

  @override
  Future<Student> getStudent(int id) async {
    final student = await _source.getStudent(id);
    return student.toModel();
  }

  @override
  Stream<List<Student>> getStudents({OrderMode mode = OrderMode.asc}) {
    return _source
        .getStudents(mode: mode)
        .map(
          (students) => students.map((student) => student.toModel()).toList(),
        );
  }

  @override
  Future<int> updateStudent(int id, Student student) async {
    return _source.updateStudent(id, student.toDto());
  }

  @override
  Future<int> deleteStudent(int id) async {
    return _source.deleteStudent(id);
  }
}
