import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../base/l10n/app_localizations.dart';
import '../../../constants/sizes.dart';
import '../../../core/localization/locale_provider.dart';
import '../../../router/routes.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/confirmation_dialog.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/loading_widget.dart';
import '../data/models/student.dart';
import '../data/repository/student_repository.dart';
import 'provider/delete_student_provider.dart';
import 'provider/get_students_provider.dart';
import 'widgets/asc_desc_button.dart';
import 'widgets/student_card.dart';

class StudentsPage extends ConsumerStatefulWidget {
  const StudentsPage.route(
    BuildContext context,
    GoRouterState state, {
    super.key,
  });

  @override
  ConsumerState<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends ConsumerState<StudentsPage> {
  final _scrollController = ScrollController();
  int cursor = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(getStudentsProvider.notifier).getNext(cursor);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = AppLocalizations.of(context)!;
    final students = ref.watch(getStudentsProvider);

    return Scaffold(
      appBar: CustomAppBar(title: lang.students, actions: [AscDescButton()]),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: kSpacing10,
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
            onPressed: () async {
              await ref
                  .read(studentRepositoryProvider)
                  .storeBatchStudentRecords();
              // context.goNamed(
              //   AppRoutes.createStudent.name,
              //   pathParameters: {AppParams.studentId: 'new'},
              // );
            },
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
          log('Total : ${value.length}');
          // Future.delayed(const Duration(seconds: 1), () {
          //   WidgetsBinding.instance.addPostFrameCallback((_) {
          //     _scrollController.animateTo(
          //       _scrollController.position.maxScrollExtent,
          //       duration: Duration(seconds: 2),
          //       curve: Curves.easeOut,
          //     );
          //   });
          // });
          cursor = value.last.id!;
          return ListView.separated(
            controller: _scrollController,
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
                onDeleteTap: () async {
                  final result = await ConfirmationDialog(
                    title: lang.alert,
                    description: lang.deleteAlertText,
                    okText: lang.yes,
                    cancelText: lang.no,
                  ).show(context);

                  if (!result) return;
                  ref.read(deleteStudentProvider(student.id!));
                  ref.invalidate(getStudentsProvider);
                },
              );
            },
            separatorBuilder: (_, _) => kSizedBoxH15,
            itemCount: value.length,
          );
        }(),
      },
    );
  }
}
