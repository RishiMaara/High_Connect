import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? hiddenText(
  String? contentText,
  int? frontText,
  int? backText,
) {
  // frontText is the number of characters from the beginning of the text backText is the number of characters from the end of the text. Make sure that as many characters are shown in the front as indicated in the fronText and as many characters are shown in the back as indicated in the backText, put * in place of the remaining characters, but leave a space instead of spaces. Here is an example: contentText - 12 44 33 43 , frontText - 2, backText - 4. Return Value: 12 ** ** 33 43
  if (contentText == null || frontText == null || backText == null) {
    return null;
  }

  if (contentText.length <= frontText + backText) {
    return contentText;
  }

  String front = contentText.substring(0, frontText);
  String back = contentText.substring(contentText.length - backText);

  String hidden = '';
  for (int i = frontText; i < contentText.length - backText; i++) {
    if (contentText[i] == ' ') {
      hidden += ' ';
    } else {
      hidden += '*';
    }
  }

  return '$front$hidden$back';
}

LatLng? doubleToLatLng(
  double? lat,
  double? lng,
) {
  // combine these numbers into latlng
  if (lat != null && lng != null) {
    return LatLng(lat, lng);
  } else {
    return null;
  }
}

String? creditCardType(String? creditCard) {
  // by card number, give me the type of this card. For example, this is a Visa or Mastercard kata
  if (creditCard == null) {
    return null;
  }

  // Remove all non-digit characters from the credit card number
  String cleanedCardNumber = creditCard.replaceAll(RegExp(r'\D'), '');

  // Check the length of the cleaned credit card number to determine the type
  if (cleanedCardNumber.length == 0) {
    return null;
  } else if (cleanedCardNumber.length == 15 &&
          cleanedCardNumber.startsWith('34') ||
      cleanedCardNumber.startsWith('37')) {
    return 'American Express';
  } else if (cleanedCardNumber.length == 16 &&
      cleanedCardNumber.startsWith('4')) {
    return 'Visa';
  } else if (cleanedCardNumber.length == 16 &&
      cleanedCardNumber.startsWith('5') &&
      int.parse(cleanedCardNumber[1]) >= 1 &&
      int.parse(cleanedCardNumber[1]) <= 5) {
    return 'Mastercard';
  } else if ((cleanedCardNumber.length == 13 ||
          cleanedCardNumber.length == 16) &&
      cleanedCardNumber.startsWith('6011')) {
    return 'Discover';
  } else {
    return 'Unknown';
  }
}

String? doubleToString(
  double? lat,
  double? lng,
) {
  // combine these numbers into string
  if (lat == null || lng == null) {
    return null;
  }

  return '$lat,$lng';
}

String? latlngToString(LatLng? inputGeopoint) {
  // give me a latlng in the form of a string
  if (inputGeopoint != null) {
    return '${inputGeopoint.latitude},${inputGeopoint.longitude}';
  } else {
    return null;
  }
}

List<String>? imageList(
  String? image1,
  String? image2,
  String? image3,
  String? image4,
  String? image5,
  String? image6,
) {
  // if the image exists, then add it to the sheet. if it does not exist, then do not add it.
  List<String> images = [];

  if (image1 != null && image1.isNotEmpty) {
    images.add(image1);
  }
  if (image2 != null && image2.isNotEmpty) {
    images.add(image2);
  }
  if (image3 != null && image3.isNotEmpty) {
    images.add(image3);
  }
  if (image4 != null && image4.isNotEmpty) {
    images.add(image4);
  }
  if (image5 != null && image5.isNotEmpty) {
    images.add(image5);
  }
  if (image6 != null && image6.isNotEmpty) {
    images.add(image6);
  }

  return images.isNotEmpty ? images : null;
}

List<String> hoursList() {
  // Give me the watch sheet. And so that they are two-digit
  List<String> hours = [];
  for (int i = 0; i < 24; i++) {
    hours.add(i.toString().padLeft(2, '0'));
  }
  return hours;
}

List<String> minutesList() {
  // Give me a few minutes. And so that they are two-digit
  List<String> minutes = [];
  for (int i = 0; i < 60; i++) {
    minutes.add(i.toString().padLeft(2, '0'));
  }
  return minutes;
}

String? shortVersion(int? quantityItems) {
  // make it so that if the number is from 1 to 4, then write them yourself, but if the number is more than 5, less than 10, write 5+, if more than 10 but less than 20, write 10+ and so on to 100+
  if (quantityItems != null) {
    if (quantityItems >= 1 && quantityItems <= 4) {
      return quantityItems.toString();
    } else if (quantityItems > 4 && quantityItems < 10) {
      return '5+';
    } else if (quantityItems >= 10 && quantityItems < 20) {
      return '10+';
    } else if (quantityItems >= 20 && quantityItems < 30) {
      return '20+';
    } else if (quantityItems >= 30 && quantityItems < 40) {
      return '30+';
    } else if (quantityItems >= 40 && quantityItems < 50) {
      return '40+';
    } else if (quantityItems >= 50 && quantityItems < 60) {
      return '50+';
    } else if (quantityItems >= 60 && quantityItems < 70) {
      return '60+';
    } else if (quantityItems >= 70 && quantityItems < 80) {
      return '70+';
    } else if (quantityItems >= 80 && quantityItems < 90) {
      return '80+';
    } else if (quantityItems >= 90 && quantityItems < 100) {
      return '90+';
    } else {
      return '100+';
    }
  }
  return null;
}

List<DateTime> customCalendar(DateTime selectedDay) {
  // give me all 7 days starting from the selected date. Make the hours of these days equal to 00:00.
  List<DateTime> days = [];
  for (int i = 0; i < 7; i++) {
    DateTime day = DateTime(
        selectedDay.year, selectedDay.month, selectedDay.day + i, 0, 0);
    days.add(day);
  }
  return days;
}

String dayOfTheWeek(DateTime day) {
  // give me the day of the week of the selected date in short form
  return DateFormat.E().format(day);
}

String dateNumber(DateTime day) {
  // Just give me the date number.
  return DateFormat('d').format(day);
}

double extractLatLng(
  LatLng inputLatLng,
  bool isLast,
) {
  // output inputLatLong as latitude or longitude as double if isLast
  if (isLast) {
    return inputLatLng.longitude;
  } else {
    return inputLatLng.latitude;
  }
}

List<RoomsStruct> roomsQuantity(List<String> roomList) {
  // Give me the name and number of rooms. For example, in RoomList: kitchen, bathroom, kitchen. Give the answer: room - kitchen, quantity - 2; room - bathroom, quantity -1:
  Map<String, int> roomMap = {};

  for (String room in roomList) {
    if (roomMap.containsKey(room)) {
      roomMap[room] = roomMap[room]! + 1;
    } else {
      roomMap[room] = 1;
    }
  }

  List<RoomsStruct> result = roomMap.entries
      .map((entry) => RoomsStruct(room: entry.key, quantity: entry.value))
      .toList();

  return result;
}

List<LatLng> geopointsList(
  LatLng serviceGeo,
  LatLng userGeo,
) {
  // Give me the location sheet.
  List<LatLng> geopoints = [serviceGeo, userGeo];
  return geopoints;
}

LatLng giveCenterLocations(
  LatLng destinations,
  LatLng origins,
) {
  // Give me the center of these locations
  final double centerLatitude = (destinations.latitude + origins.latitude) / 2;
  final double centerLongitude =
      (destinations.longitude + origins.longitude) / 2;
  return LatLng(centerLatitude, centerLongitude);
}

DateTime bookingTime(
  DateTime bookingDate,
  DateTime bookingDateTime,
) {
  // combine the date and time. the date depends on bookiingDate and the time depends on bookingDateTime
  return DateTime(
    bookingDate.year,
    bookingDate.month,
    bookingDate.day,
    bookingDateTime.hour,
    bookingDateTime.minute,
  );
}

List<DateTime> datesList(
  List<DateTime> bokedDatesList,
  DateTime selectedDate,
) {
  // add the selected date to the list
  if (!bokedDatesList.contains(selectedDate)) {
    bokedDatesList.add(selectedDate);
  }
  return bokedDatesList;
}

List<DateTime> dayHours() {
  // give me a list of the hours of the day from 1:00 AM to 00:00 PM in the date 2.02.2025
  List<DateTime> hoursList = [];

  for (int i = 1; i <= 24; i++) {
    DateTime hour = DateTime(2025, 2, 2, i);
    hoursList.add(hour);
  }

  return hoursList;
}

String dayOfTheWeek2(DateTime date) {
  // give me the day of the week for the selected date in the form monday, tuesday, ...
  return DateFormat('EEEE').format(date).toLowerCase();
}

DocumentReference noMyRef(
  List<DocumentReference> usersRef,
  DocumentReference myRef,
) {
  // give me the first link that is not equal to myRef
  for (var ref in usersRef) {
    if (ref != myRef) {
      return ref;
    }
  }
  return usersRef.first; // return the first link if none are found
}

List<DocumentReference> usersRefList(
  DocumentReference userRef,
  DocumentReference myRef,
) {
  // add them to the list
  return [userRef, myRef];
}

List<DateTime> serviceCalendar() {
  // give me all 7 days starting from the date 2.02.2025 Make the hours of these days equal to 00:00. And sort them by day of the week from monday to sunday.
  DateTime startDate = DateTime(2025, 2, 2);
  List<DateTime> days = [];

  for (int i = 0; i < 7; i++) {
    DateTime day = startDate.add(Duration(days: i));
    DateTime formattedDay = DateTime(day.year, day.month, day.day, 0, 0);
    days.add(formattedDay);
  }

  days.sort((a, b) => a.weekday.compareTo(b.weekday));

  return days;
}

bool matchingDays(
  List<DateTime> listDay,
  DateTime selectedDay,
) {
  // if the selected date has the same day of the week as one of the days of the week dates from the list, then give me the true value.
  return listDay.any((day) => day.weekday == selectedDay.weekday);
}
