import 'package:flutter/material.dart';

class NotificationModel {
  final int id;
  final String type;
  final IconData icon;
  final String title;
  final String message;
  final String time;
  bool read;
  final Color color;

  NotificationModel({
    required this.id,
    required this.type,
    required this.icon,
    required this.title,
    required this.message,
    required this.time,
    required this.read,
    required this.color,
  });
}