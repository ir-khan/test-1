import '../../../../../utils/enums.dart';
import '../../../../data/students/data_source/student_db_source.dart';
import '../../models/student.dart';
import '../student_repository.dart';

class StudentRepositoryImpl extends StudentRepository {
  StudentRepositoryImpl(super.database);

  @override
  Future<int> createStudent(Student student) async {
    return await StudentDbSource(database).createStudent(student.toDto());
  }

  @override
  Future<Student> getStudent(int id) async {
    final student = await StudentDbSource(database).getStudent(id);
    return student.toModel();
  }

  @override
  Stream<List<Student>> getStudents({OrderMode mode = OrderMode.asc}) {
    return StudentDbSource(database)
        .getStudents(mode: mode)
        .map(
          (students) => students.map((student) => student.toModel()).toList(),
        );
  }

  @override
  Future<int> updateStudent(int id, Student student) async {
    return StudentDbSource(database).updateStudent(id, student.toDto());
  }

  @override
  Future<int> deleteStudent(int id) async {
    return StudentDbSource(database).deleteStudent(id);
  }
}
