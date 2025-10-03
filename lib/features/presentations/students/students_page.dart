import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../base/l10n/app_localizations.dart';
import '../../../core/providers/locatization/locale_provider.dart';
import '../../../core/providers/order_mode/order_mode_provider.dart';
import '../../../core/providers/students/models/student.dart';
import '../../../core/providers/students/provider/delete_student_provider.dart';
import '../../../core/providers/students/provider/get_students_provider.dart';
import '../../../router/routes.dart';
import '../../../utils/enums.dart';
import '../../../widgets/custom_app_bar.dart';
import 'widgets/asc_desc_button.dart';

class StudentsPage extends ConsumerWidget {
  const StudentsPage.route(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = AppLocalizations.of(context)!;
    final orderMode = ref.watch(orderModeProvider);
    final students = ref.watch(getStudentsProvider(orderMode));

    return Scaffold(
      appBar: CustomAppBar(title: lang.students, actions: [AscDescButton()]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          FloatingActionButton(
            heroTag: 'locale_fab',
            onPressed: () {
              final locale = ref.read(localeProvider);
              if (locale.languageCode == 'en') {
                ref.read(localeProvider.notifier).setLocale(Locale('ur'));
              } else {
                ref.read(localeProvider.notifier).setLocale(Locale('en'));
              }
            },
            child: Icon(Icons.compare_arrows_rounded),
          ),
          FloatingActionButton(
            heroTag: 'add_student_fab',
            onPressed: () => context.goNamed(AppRoutes.createStudent.name),
            child: Icon(Icons.add_rounded),
          ),
        ],
      ),
      body: switch (students) {
        AsyncError(:final error) => Text('Error: $error'),
        AsyncData<List<Student>>(:final value) => () {
          if (value.isEmpty) {
            return Center(child: Text(lang.noStudents));
          }
          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            itemBuilder: (_, i) {
              final student = value[i];
              return ListTile(
                visualDensity: VisualDensity.compact,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                onTap: () => context.goNamed(
                  AppRoutes.studentDetails.name,
                  pathParameters: {AppParams.studentId: student.id.toString()},
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // tileColor: Colors.red,
                title: Text(
                  student.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit_rounded),
                      color: Colors.green,
                      onPressed: () => context.goNamed(
                        AppRoutes.editStudent.name,
                        pathParameters: {
                          AppParams.studentId: student.id.toString(),
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete_rounded),
                      color: Colors.red,
                      onPressed: () => _onDelete(context, ref, student.id!),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (_, _) => SizedBox(height: 15),
            itemCount: value.length,
          );
        }(),
        AsyncLoading() || _ => Center(child: CircularProgressIndicator()),
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
                ref.invalidate(
                  getStudentsProvider(ref.read(orderModeProvider)),
                );
                context.pop();
              },
              child: Text(lang.yes),
            ),
            TextButton(onPressed: () => context.pop(), child: Text(lang.no)),
          ],
        );
      },
    );
  }
}
