import 'package:flutter/material.dart';
import 'package:todoapp/config/routes/route_location.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:todoapp/widgets/widget.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder (BuildContext context, GoRouterState state) => const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;
    final deviceSize = context.deviceSize;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                width: deviceSize.width,
                color: colors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DisplayWhiteText(
                      text: 'Sept 9, 2024',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                    DisplayWhiteText(
                      text: 'My Todo List',
                      fontSize: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const DisplayListOfTask(
                      tasks: [
                        Task(
                            title: 'title 1',
                            note: '',
                            time: '18.12',
                            date: 'Sept. 09',
                            isCompleted: false,
                            category: TaskCategories.education),
                        Task(
                            title: 'title2 title2 title2 title2',
                            note: 'note',
                            time: '22.12',
                            date: 'Sept. 09',
                            isCompleted: false,
                            category: TaskCategories.work),

                      ],
                    ),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    const DisplayListOfTask(
                      isCompletedTasks: true,
                      tasks: [
                        Task(
                            title: 'title 1',
                            note: 'note',
                            time: '18.12',
                            date: 'Sept. 09',
                            isCompleted: true,
                            category: TaskCategories.education),
                        Task(
                            title: 'title2 title2 title2 title2',
                            note: 'note',
                            time: '22.12',
                            date: 'Sept. 09',
                            isCompleted: true,
                            category: TaskCategories.work),

                      ],

                    ),
                    const Gap(20),
                    ElevatedButton(
                        onPressed: () => context.push(RouteLocation.createTask),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: DisplayWhiteText(
                            text: 'Add New task',
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
