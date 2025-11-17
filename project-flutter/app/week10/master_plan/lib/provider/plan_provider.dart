import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider({super.key, required ValueNotifier<Plan> notifier, required super.child})
      : super(notifier: notifier);

  static ValueNotifier<Plan> of(BuildContext context) {
   return context.dependOnInheritedWidgetOfExactType<PlanProvider>()!.notifier!;
  }
}
