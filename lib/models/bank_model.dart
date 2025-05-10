import 'package:flutter/material.dart';

class Bank {
  final String name;
  final String logoPath;
  final Color primaryColor;
  final Color secondaryColor;
  final String description;

  const Bank({
    required this.name,
    required this.logoPath,
    required this.primaryColor,
    required this.secondaryColor,
    required this.description,
  });
}
