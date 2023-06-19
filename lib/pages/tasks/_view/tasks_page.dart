import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:goroutershell/common/app_style.dart';
import 'package:goroutershell/l10n/context_extensions.dart';
import 'package:goroutershell/pages/tasks/_view/tasks_notifier.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({
    Key? key,
    required this.detailsPath,
    required this.child,
  }) : super(key: key);
  final String detailsPath;
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasksNotifier = ref.watch(tasksNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: tasksNotifier.when(
        data: (data) {
          return SizedBox(
            width: MediaQuery.of(context).size.width - 232,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 232) / 2 - 16,
                  height: 500,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32.0,
                        ),
                        child: Text(context.tr.tasks),
                      ),
                      Divider(
                        thickness: 4,
                        color: AppStyle.darkBlue,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final task = data[index];
                            return Row(
                              children: [
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.go('$detailsPath/${task.id}');
                                      },
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                                          child: Text(task.title ?? context.tr.titleNotFound),
                                        ),
                                        width: 300,
                                        padding: EdgeInsets.only(left: 16),
                                        alignment: Alignment.centerLeft,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          color: Colors.grey.withOpacity(.2),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width - 232) / 2,
                  height: 500,
                  child: child,
                ),
              ],
            ),
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
