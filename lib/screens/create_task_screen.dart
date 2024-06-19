import 'package:flutter/material.dart';
import 'package:todoapp/widgets/widget.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';


class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();
  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DisplayWhiteText(
          text: 'Tambah tugas Baru',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CommonTextField(
                title: 'Judul Tugas',
                hintText: 'Judul tugas',
              ),
              const Gap(16),
              SelectCategory(),
              const Gap(16),
              const SelectDateTime(),
              const Gap(16),
              const CommonTextField(
                title: 'Catatan',
                hintText: 'Catatan tugas',
                maxLines: 6,
              ),
              const Gap(60),
              ElevatedButton(onPressed: () {}, child: const DisplayWhiteText(text: 'Save'))
            ],
          ),
        ),
      ),
    );
  }
}
