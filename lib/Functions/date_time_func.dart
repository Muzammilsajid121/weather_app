import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class Functions{

    //Date Method
String formatApiDate(String apiDate) {
  try {
    final parsedDate = DateFormat('yyyy-MM-dd HH:mm').parse(apiDate);
    return " ${DateFormat.yMMMd().add_jm().format(parsedDate)}";
  } catch (e) {
    if (kDebugMode) {
      print("Error parsing date: $e");
    }
    return "Last Update: N/A";
  }
}

 String formatApiDateWithAmPm(String apiDate) {
    try {
      final parsedDate = DateFormat('yyyy-MM-dd HH:mm').parse(apiDate);
      final formattedTime = DateFormat.jm().format(parsedDate); // Use jm to show only time

      return formattedTime;
    } catch (e) {
      if (kDebugMode) {
        print("Error parsing date: $e");
      }
      return "Last Update: N/A";
    }
  }
}

