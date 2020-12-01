import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UtilityMethodsManager {
  String beautifyTime(String time) {
    DateFormat dateFormat = new DateFormat('hh:mm:ss');
    DateTime dateTime = dateFormat.parse(time);

    TimeOfDay timeOfDay = new TimeOfDay.fromDateTime(dateTime);
    TimeOfDay selectedTime = timeOfDay.replacing(hour: timeOfDay.hourOfPeriod);

    // very crude implementation
    String hour = "";
    String mins = "";

    if (timeOfDay.hour <= 12) {
      if (timeOfDay.hour < 10)
        hour = '0${timeOfDay.hour}';
      else
        hour = timeOfDay.hour.toString();

      if (timeOfDay.minute < 10)
        mins = '0${timeOfDay.minute}';
      else
        mins = timeOfDay.minute.toString();
    } else {
      if (selectedTime.hour < 10)
        hour = '0${selectedTime.hour}';
      else
        hour = selectedTime.hour.toString();

      if (selectedTime.minute < 10)
        mins = '0${selectedTime.minute}';
      else
        mins = selectedTime.minute.toString();
    }

    if (timeOfDay.hour <= 12)
      return "$hour:$mins AM";
    else
      return "$hour:$mins PM";
  }

  bool findDifference(String time) {
    DateTime dateTimeNow = DateTime.now();
    DateFormat dateFormat = new DateFormat('yyyy-MM-dd hh:mm:ss');
    DateTime inputTime = dateFormat.parse(
        '${dateTimeNow.year}-${dateTimeNow.month}-${dateTimeNow.day} $time');

    int difference = dateTimeNow.difference(inputTime).inMinutes;

    print(difference);
    if (difference < -20)
      return true;
    else
      return false;
  }
}
