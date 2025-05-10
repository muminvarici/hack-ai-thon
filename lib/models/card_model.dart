import 'package:flutter/material.dart';

class BankCard {
  final String id;
  final String cardNumber;
  final String cardHolderName;
  final String bankName;
  final String expiryDate;
  final String cardType; // Kredi, Debit, Sanal
  final double limit;
  final double availableLimit;
  final Color color;
  final IconData icon;

  BankCard({
    required this.id,
    required this.cardNumber,
    required this.cardHolderName,
    required this.bankName,
    required this.expiryDate,
    required this.cardType,
    required this.limit,
    required this.availableLimit,
    required this.color,
    required this.icon,
  });
}
