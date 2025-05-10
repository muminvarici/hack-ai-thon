import 'package:flutter/material.dart';

class Payment {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final String category; // Fatura, Telefon, İnternet, TV, vb.
  final bool isFavorite;

  const Payment({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.category,
    this.isFavorite = false,
  });
}
