import 'package:intl/intl.dart';

const String pattern1 = "dd/MM/yyyy";
const String patternDd = "dd";
const String patternMm = "MM";
const String patternY = "yy";
const String patternYy = "yyyy";
const String pattern2 = "dd/MM";
const String pattern3 = "yyyy-MM-dd'T'HHmmss";
const String pattern4 = "h:mm a dd/MM";
const String pattern5 = "yyyy-MM-dd HH:mm:ss";
const String pattern6 = "dd/MM/yyyy HH:mm";
const String pattern7 = "HH:mm dd/MM/yyyy";
const String pattern8 = "yyyy-MM-dd'T'HH:mm:ss";
const String pattern9 = "HH:mm - dd/MM/yyyy";
const String pattern10 = "dd/MM/yyyy HH:mm:ss";
const String pattern11 = "MM/yyyy";
const String pattern13 = "HH:mm";
const String pattern12 = "HH:mm:ss";
const String patternDefault = "yyyy-MM-dd";
const String pattern14 = "dd-MM-yyyy";
const String pattern15 = "yyyy-MM-dd";
const String pattern16 = "MM/yyyy";
const String pattern17 = "MMyyyy";
const String pattern18 = "yyyy-MM-dd HH:mm:ss.SSS'Z'";
const String pattern19 = "yyyy-MM-dd HH:mm:ss:SSS";
const String pattern20 = "yyyy-MM-dd HH:mm:ss.";
const String pattern21 = "ddMMyyyy";
const String pattern22 = "HH:mm:ss dd/MM/yyyy";
const String pattern23 = "HH:mm a dd/MM/yyyy";
const String pattern24 = "dd-MM-yyyy";
const String pattern25 = "yyyy-MM-dd";

String formatDateTimeToString(DateTime dateTime) {
  return DateFormat(pattern1).format(dateTime);
}

String convertDateToStringVN({DateTime? dateTime}) {
  return DateFormat.yMMMMEEEEd("vi").format(dateTime ?? DateTime.now());
}

String convertDateToStringMonthYear({DateTime? dateTime}) {
  return DateFormat.yMMMM("vi")
      .format(dateTime ?? DateTime.now())
      .replaceAll("t", "T");
}

int? convertDMYToTimeStamps(String dateTimeStr, {String pattern = pattern1}) {
  if (dateTimeStr.isNotEmpty) {
    DateTime? dateTime = convertStringToDate(dateTimeStr, pattern);
    return dateTime!.millisecondsSinceEpoch;
  }
  return 0;
}

String convertDateToString(DateTime? dateTime, String pattern) {
  // dateTime ??= DateTime.now();
  if (dateTime == null) {
    return "";
  } else {
    return DateFormat(pattern).format(dateTime);
  }
}

DateTime? convertStringToDate(String? dateTime, String pattern) {
  if (dateTime == null) {
    return null;
  } else {
    return DateFormat(pattern).parse(dateTime);
  }
}