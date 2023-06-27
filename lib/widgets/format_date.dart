import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormatDate extends StatelessWidget {
  const FormatDate({super.key, required this.timestamp, required this.style});
  final Timestamp timestamp;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(timestamp.toDate().toString());
    String formattedDate = DateFormat.yMMMMEEEEd().add_jm().format(dateTime);
    return Text(formattedDate, style: style);
  }
}
