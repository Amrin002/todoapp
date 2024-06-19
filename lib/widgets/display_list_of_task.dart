import 'package:flutter/material.dart';
import 'package:todoapp/utils/extension.dart';

import '../data/data.dart';
import 'widget.dart';

class DisplayListOfTask extends StatelessWidget {
  const DisplayListOfTask({
    super.key,
    required this.tasks,
    this.isCompletedTasks = false,
  });
  final List<Task> tasks;
  final bool isCompletedTasks;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final height =
        isCompletedTasks ? deviceSize.height * 0.25 : deviceSize.height * 0.3;
    final emptyTasksMessage = isCompletedTasks
        ? 'Belum ada tugas yang selesai'
        : 'Tidak ada tugas yang perlu di lakukan';
    return CommonContainer(
      height: height,
      child: tasks.isEmpty
          ? Center(
              child: Text(
                emptyTasksMessage,
                style: context.textTheme.headlineSmall,
              ),
            )
          : ListView.separated(
              shrinkWrap: true,
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (ctx, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    // TODO-DELETE-TASK
                  },
                  onTap: () async {
                    // TODO-SHOW-DETAILS-TASK
                    await showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return TaskDetails(task: task);
                      },
                    );
                  },
                  child: TaskTile(task: task),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 1.5,
                );
              },
            ),
    );
  }
}
