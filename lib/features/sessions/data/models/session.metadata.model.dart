import 'package:flutter/material.dart';

class SessionMetadataModel {
  const SessionMetadataModel({
    required this.label,
    required this.value,
    required this.bgColor,
    required this.labelColor,
  });

  final String label;
  final String value;
  final Color bgColor;
  final Color labelColor;
}
