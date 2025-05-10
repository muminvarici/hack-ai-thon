import 'package:flutter/material.dart';

class Transfer {
  final String id;
  final String fromAccountId;
  final String toAccountId;
  final String fromAccountName;
  final String toAccountName;
  final String fromBankName;
  final String toBankName;
  final double amount;
  final String currency;
  final DateTime date;
  final String description;
  final String status; // Beklemede, Tamamlandı, İptal Edildi
  final Color statusColor;

  const Transfer({
    required this.id,
    required this.fromAccountId,
    required this.toAccountId,
    required this.fromAccountName,
    required this.toAccountName,
    required this.fromBankName,
    required this.toBankName,
    required this.amount,
    required this.currency,
    required this.date,
    required this.description,
    required this.status,
    required this.statusColor,
  });
}
