import 'package:flutter/material.dart';
import 'package:todoapp/utils/utils.dart';
import 'package:todoapp/widgets/widget.dart';
import 'package:gap/gap.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoapp/providers/providers.dart';
import 'package:intl/intl.dart';


class SelectDateTime extends ConsumerWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(DateProvider);
    final time = ref.watch(TimeProvider);


    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Tanggal',
            hintText: DateFormat.yMMMd().format(date),
            suffixIcon: IconButton(
                onPressed: () => _selectDate(context, ref),
                icon: const FaIcon(FontAwesomeIcons.calendar)),
          ),
        ),
        const Gap(10),
        Expanded(
          child: CommonTextField(
            readOnly: true,
            title: 'Waktu',
            hintText: Helpers.timeToString(time),
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context, ref),
              icon: const FaIcon(FontAwesomeIcons.clock),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context, WidgetRef ref) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      //
      ref.read(TimeProvider.notifier).state = pickedTime;
    }
  }

  void _selectDate(BuildContext context, WidgetRef ref) async {
    final initialDate = ref.read(DateProvider);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2090),
    );
    if (pickedDate !=null){
      //
      ref.read(DateProvider.notifier).state = pickedDate;
    }
  }
}
