import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../base/l10n/app_localizations.dart';
import '../../../core/providers/students/models/student.dart';
import '../../../core/providers/students/provider/create_student_provider.dart';
import '../../../core/providers/students/provider/get_student_provider.dart';
import '../../../core/providers/students/provider/get_students_provider.dart';
import '../../../core/providers/students/provider/update_student_provider.dart';
import '../../../router/routes.dart';
import '../../../utils/enums.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/dropdown_form_field_widget.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/text_form_field_widget.dart';

class CreateStudentPage extends ConsumerStatefulWidget {
  CreateStudentPage.route(
    BuildContext context,
    GoRouterState state, {
    super.key,
  }) : id = int.tryParse(state.pathParameters[AppParams.studentId] ?? '');

  final int? id;

  @override
  ConsumerState createState() => _CreateStudentPageState();
}

class _CreateStudentPageState extends ConsumerState<CreateStudentPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _marksController;
  late final TextEditingController _fatherNameController;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool _status = false;
  Grade _grade = Grade.notGraded;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _marksController = TextEditingController();
    _fatherNameController = TextEditingController();
  }

  void _prefillForm(Student student) {
    _nameController.text = student.name;
    _marksController.text = student.marks.toString();
    _fatherNameController.text = student.fatherName;
    _status = student.status;
    _grade = student.grade;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _marksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final AsyncValue student = widget.id != -1
        ? ref.watch(getStudentProvider(widget.id!))
        : AsyncData(null);
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.id == -1 ? lang.addStudent : lang.editStudent,
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: autoValidateMode,
        child: switch (student) {
          AsyncLoading() => LoadingWidget(),
          AsyncError(:final error) => AppErrorWidget(
            error: error.toString(),
            onRetry: () => ref.refresh(getStudentProvider(widget.id!)),
          ),
          AsyncData(:final value) => () {
            if (value != null && _nameController.text.isEmpty) {
              _prefillForm(value);
            }
            return StudentForm(
              nameController: _nameController,
              marksController: _marksController,
              fatherNameController: _fatherNameController,
              status: _status,
              onStatusChange: (value) {
                _status = value;
                setState(() {});
              },
              grade: _grade,
              onGradeChange: (value) {
                if (value == null) return;
                _grade = value;
                setState(() {});
              },
              onSubmit: _onSubmit,
              isEditing: widget.id != -1,
            );
          }(),
        },
      ),
    );
  }

  void _onSubmit() async {
    final lang = AppLocalizations.of(context)!;
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) {
      autoValidateMode = AutovalidateMode.onUserInteraction;
      return;
    }
    final student = Student(
      id: widget.id == -1 ? null : widget.id,
      name: _nameController.text.trim(),
      marks: int.parse(_marksController.text.trim()),
      status: _status,
      grade: _grade,
      fatherName: _fatherNameController.text.trim(),
    );

    if (widget.id == -1) {
      ref.read(createStudentProvider(student));
    } else {
      ref.read(updateStudentProvider((student.id!, student)));
    }
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          widget.id != -1
              ? lang.updateStudentMessage
              : lang.createStudentMessage,
        ),
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ),
    );

    ref.invalidate(getStudentProvider);
    ref.invalidate(getStudentsProvider);

    context.pop();
  }
}

class StudentForm extends StatelessWidget {
  const StudentForm({
    super.key,
    required this.nameController,
    required this.marksController,
    required this.fatherNameController,
    required this.status,
    required this.onStatusChange,
    required this.grade,
    required this.onGradeChange,
    required this.onSubmit,
    this.isEditing = false,
  });

  final TextEditingController nameController;
  final TextEditingController marksController;
  final TextEditingController fatherNameController;
  final bool status;
  final void Function(bool) onStatusChange;
  final Grade grade;
  final void Function(Grade?) onGradeChange;
  final VoidCallback onSubmit;
  final bool isEditing;

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
      child: CustomScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: TextFormFieldWidget(
                controller: nameController,
                hintText: lang.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return lang.nameErrorMessage;
                  }
                  return null;
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: TextFormFieldWidget(
                controller: marksController,
                hintText: lang.marks,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return lang.marksErrorMessage1;
                  }
                  if (!RegExp(
                    r'^(100(?:\.0+)?|[0-9]?\d(?:\.\d+)?|\.\d+)$',
                  ).hasMatch(value)) {
                    return lang.marksErrorMessage2;
                  }
                  return null;
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: TextFormFieldWidget(
                controller: fatherNameController,
                hintText: lang.fatherName,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return lang.fatherNameErrorMessage;
                  }
                  return null;
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    lang.status,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  CupertinoSwitch(value: status, onChanged: onStatusChange),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: DropdownFormFieldWidget<Grade>(
                initialValue: grade,
                items: Grade.values
                    .map((g) {
                      return DropdownMenuItem(value: g, child: Text(g.value));
                    })
                    .toList(growable: false),
                onChange: onGradeChange,
                validator: (value) {
                  if (value == null || value == Grade.notGraded) {
                    return lang.gradeErrorMessage;
                  }
                  return null;
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            sliver: SliverToBoxAdapter(
              child: Button(
                label: isEditing ? lang.update : lang.create,
                onTap: onSubmit,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
