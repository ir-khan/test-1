// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Students extends Table with TableInfo<Students, StudentsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Students(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('CURRENT_TIMESTAMP'),
  );
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<double> marks = GeneratedColumn<double>(
    'marks',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<bool> status = GeneratedColumn<bool>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("status" IN (0, 1))',
    ),
  );
  late final GeneratedColumn<String> grade = GeneratedColumn<String>(
    'grade',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const CustomExpression('\'Not yet graded\''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    createdAt,
    name,
    marks,
    status,
    grade,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentsData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      marks: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}marks'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}status'],
      )!,
      grade: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grade'],
      )!,
    );
  }

  @override
  Students createAlias(String alias) {
    return Students(attachedDatabase, alias);
  }
}

class StudentsData extends DataClass implements Insertable<StudentsData> {
  final int id;
  final DateTime createdAt;
  final String name;
  final double marks;
  final bool status;
  final String grade;
  const StudentsData({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.marks,
    required this.status,
    required this.grade,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['name'] = Variable<String>(name);
    map['marks'] = Variable<double>(marks);
    map['status'] = Variable<bool>(status);
    map['grade'] = Variable<String>(grade);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      name: Value(name),
      marks: Value(marks),
      status: Value(status),
      grade: Value(grade),
    );
  }

  factory StudentsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentsData(
      id: serializer.fromJson<int>(json['id']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      name: serializer.fromJson<String>(json['name']),
      marks: serializer.fromJson<double>(json['marks']),
      status: serializer.fromJson<bool>(json['status']),
      grade: serializer.fromJson<String>(json['grade']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'name': serializer.toJson<String>(name),
      'marks': serializer.toJson<double>(marks),
      'status': serializer.toJson<bool>(status),
      'grade': serializer.toJson<String>(grade),
    };
  }

  StudentsData copyWith({
    int? id,
    DateTime? createdAt,
    String? name,
    double? marks,
    bool? status,
    String? grade,
  }) => StudentsData(
    id: id ?? this.id,
    createdAt: createdAt ?? this.createdAt,
    name: name ?? this.name,
    marks: marks ?? this.marks,
    status: status ?? this.status,
    grade: grade ?? this.grade,
  );
  StudentsData copyWithCompanion(StudentsCompanion data) {
    return StudentsData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      name: data.name.present ? data.name.value : this.name,
      marks: data.marks.present ? data.marks.value : this.marks,
      status: data.status.present ? data.status.value : this.status,
      grade: data.grade.present ? data.grade.value : this.grade,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentsData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('marks: $marks, ')
          ..write('status: $status, ')
          ..write('grade: $grade')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, name, marks, status, grade);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentsData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.name == this.name &&
          other.marks == this.marks &&
          other.status == this.status &&
          other.grade == this.grade);
}

class StudentsCompanion extends UpdateCompanion<StudentsData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  final Value<String> name;
  final Value<double> marks;
  final Value<bool> status;
  final Value<String> grade;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.name = const Value.absent(),
    this.marks = const Value.absent(),
    this.status = const Value.absent(),
    this.grade = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    required String name,
    required double marks,
    required bool status,
    this.grade = const Value.absent(),
  }) : name = Value(name),
       marks = Value(marks),
       status = Value(status);
  static Insertable<StudentsData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
    Expression<String>? name,
    Expression<double>? marks,
    Expression<bool>? status,
    Expression<String>? grade,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (name != null) 'name': name,
      if (marks != null) 'marks': marks,
      if (status != null) 'status': status,
      if (grade != null) 'grade': grade,
    });
  }

  StudentsCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
    Value<String>? name,
    Value<double>? marks,
    Value<bool>? status,
    Value<String>? grade,
  }) {
    return StudentsCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      marks: marks ?? this.marks,
      status: status ?? this.status,
      grade: grade ?? this.grade,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (marks.present) {
      map['marks'] = Variable<double>(marks.value);
    }
    if (status.present) {
      map['status'] = Variable<bool>(status.value);
    }
    if (grade.present) {
      map['grade'] = Variable<String>(grade.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('name: $name, ')
          ..write('marks: $marks, ')
          ..write('status: $status, ')
          ..write('grade: $grade')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV3 extends GeneratedDatabase {
  DatabaseAtV3(QueryExecutor e) : super(e);
  late final Students students = Students(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [students];
  @override
  int get schemaVersion => 3;
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}
