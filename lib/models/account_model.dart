import 'package:flutter/material.dart';

class Account {
  final String id;
  final String accountNumber;
  final String accountName;
  final String bankName;
  final double balance;
  final String currency;
  final String accountType;
  final IconData icon;
  final Color color;

  Account({
    required this.id,
    required this.accountNumber,
    required this.accountName,
    required this.bankName,
    required this.balance,
    required this.currency,
    required this.accountType,
    required this.icon,
    required this.color,
  });
}
