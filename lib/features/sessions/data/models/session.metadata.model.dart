import 'package:flutter/material.dart';

class SessionMetadataModel {

  final String label;
  final String value;
  final Color bgColor;
  final Color labelColor;

  const SessionMetadataModel({
    required this.label,
    required this.value,
    required this.bgColor,
    required this.labelColor,
  });
}