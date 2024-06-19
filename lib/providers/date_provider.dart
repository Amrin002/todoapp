import 'package:flutter_riverpod/flutter_riverpod.dart';

final DateProvider = StateProvider<DateTime>((ref){
  return DateTime.now();
});