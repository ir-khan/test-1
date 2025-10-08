import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../base/l10n/app_localizations.dart';
import '../../../constants/sizes.dart';
import '../../../router/routes.dart';
import '../../../shared/widgets/widgets.dart';
import '../data/models/student.dart';
import 'provider/get_student_provider.dart';

class StudentDetailsPage extends ConsumerWidget {
  StudentDetailsPage.route(
    BuildContext context,
    GoRouterState state, {
    super.key,
  }) : id = int.parse(state.pathParameters[AppParams.studentId]!);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context)!;
    final studentProvider = ref.watch(getStudentProvider(id));
    return Scaffold(
      appBar: CustomAppBar(title: lang.studentDetails),
      body: switch (studentProvider) {
        AsyncLoading() => LoadingWidget(),
        AsyncError(:final error) => AppErrorWidget(
          error: error.toString(),
          onRetry: () => ref.refresh(getStudentProvider(id)),
        ),
        AsyncData<Student>(:final value) => () {
          return Padding(
            padding: kPadding20,
            child: Column(
              spacing: kSpacing10,
              children: [
                DetailsRow(label: lang.name, value: value.name),
                DetailsRow(
                  label: lang.age,
                  value: value.age == 0 ? 'Update Age' : value.age.toString(),
                ),
                DetailsRow(label: lang.fatherName, value: value.fatherName),
                DetailsRow(
                  label: lang.marks,
                  value: value.marks.toStringAsFixed(0),
                ),
                DetailsRow(
                  label: lang.result,
                  value: value.status ? lang.passed : lang.failed,
                ),
                DetailsRow(label: lang.grade, value: value.grade.value),
              ],
            ),
          );
        }(),
      },
    );
  }
}

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: textTheme.titleMedium),
        Text(value, style: textTheme.bodyMedium),
      ],
    );
  }
}
