import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../base/l10n/app_localizations.dart';
import '../../../core/providers/localization/locale_provider.dart';
import '../../../core/providers/students/models/student.dart';
import '../../../core/providers/students/provider/delete_student_provider.dart';
import '../../../core/providers/students/provider/get_students_provider.dart';
import '../../../router/routes.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/loading_widget.dart';
import 'widgets/asc_desc_button.dart';
import 'widgets/student_card.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage.route(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context)!;
    final students = ref.watch(getStudentsProvider);

    return Scaffold(
      appBar: CustomAppBar(title: lang.students, actions: [AscDescButton()]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          FloatingActionButton(
            heroTag: 'locale_fab',
            onPressed: () {
              final locale = ref.read(currentLocaleProvider);
              if (locale.languageCode == 'en') {
                ref
                    .read(currentLocaleProvider.notifier)
                    .setLocale(Locale('ur'));
              } else {
                ref
                    .read(currentLocaleProvider.notifier)
                    .setLocale(Locale('en'));
              }
            },
            child: Icon(Icons.compare_arrows_rounded),
          ),
          FloatingActionButton(
            heroTag: 'add_student_fab',
            onPressed: () => context.goNamed(
              AppRoutes.createStudent.name,
              pathParameters: {AppParams.studentId: '-1'},
            ),
            child: Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: switch (students) {
        AsyncLoading() => LoadingWidget(),
        AsyncError(:final error) => AppErrorWidget(
          error: error.toString(),
          onRetry: () => ref.refresh(getStudentsProvider),
        ),
        AsyncData<List<Student>>(:final value) => () {
          if (value.isEmpty) return Center(child: Text(lang.noStudents));
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemBuilder: (_, i) {
              final student = value[i];
              return StudentCard(
                name: student.name,
                onTap: () => context.goNamed(
                  AppRoutes.studentDetails.name,
                  pathParameters: {AppParams.studentId: student.id.toString()},
                ),
                onEditTap: () {
                  context.goNamed(
                    AppRoutes.createStudent.name,
                    pathParameters: {
                      AppParams.studentId: student.id.toString(),
                    },
                  );
                },
                onDeleteTap: () => _onDelete(context, ref, student.id!),
              );
            },
            separatorBuilder: (_, _) => SizedBox(height: 15),
            itemCount: value.length,
          );
        }(),
      },
    );
  }

  void _onDelete(BuildContext context, WidgetRef ref, int id) {
    final lang = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(lang.alert),
          content: Text(lang.deleteAlertText),
          actions: [
            TextButton(
              onPressed: () {
                ref.read(deleteStudentProvider(id));
                ref.invalidate(getStudentsProvider);
                context.pop();
              },
              child: Text(lang.yes),
            ),
            TextButton(onPressed: context.pop, child: Text(lang.no)),
          ],
        );
      },
    );
  }
}
