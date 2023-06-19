import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:goroutershell/common/app_style.dart';
import 'package:goroutershell/l10n/context_extensions.dart';
import 'package:goroutershell/l10n/localization_provider.dart';
import 'package:goroutershell/pages/tasks/_view/tasks_notifier.dart';
import 'package:intl/intl.dart';

class TaskDetailsPage extends ConsumerWidget {
  const TaskDetailsPage({
    super.key,
    required this.taskId,
  });
  final String taskId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskNotifierProvider(taskId));
    final locale = ref.watch(localizationProvider);
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 232) / 2 - 32,
      height: 500,
      child: task.when(
        data: (task) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 32.0,
                ),
                child: Text(task.title ?? context.tr.titleNotFound),
              ),
              Divider(
                thickness: 4,
                color: AppStyle.darkBlue,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 64),
                    Text(task.dateTime != null
                        ? DateFormat('yyyy-MM-dd | hh:mm:ss', locale.languageCode)
                            .format(task.dateTime!)
                        : context.tr.dateNotFound),
                    SizedBox(height: 32),
                    Text(task.description ?? context.tr.descriptionNotFound),
                  ],
                ),
              ),
            ],
          );
        },
        error: (e, st) {
          return Center(
            child: Text(e.toString()),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
