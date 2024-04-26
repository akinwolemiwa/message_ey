import 'dart:math';
import 'package:flutter/material.dart';

class RandomTimeGenerator {
  static TimeOfDay generateRandomTime() {
    final Random random = Random();
    final int hour = random.nextInt(12) + 1;
    final int minute = random.nextInt(60);
    final bool isPM = random.nextBool();

    int hour24 = hour;
    if (isPM && hour != 12) {
      hour24 += 12;
    } else if (!isPM && hour == 12) {
      hour24 = 0;
    }

    return TimeOfDay(hour: hour24, minute: minute);
  }
}
