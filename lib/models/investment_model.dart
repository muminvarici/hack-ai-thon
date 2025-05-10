import 'package:flutter/material.dart';

class Investment {
  final String id;
  final String name;
  final String type; // Hisse Senedi, Döviz, Altın, Kripto, vb.
  final double currentPrice;
  final double purchasePrice;
  final double quantity;
  final double totalValue;
  final double profitLoss;
  final double profitLossPercentage;
  final String currency;
  final IconData icon;
  final Color color;
  final bool isFavorite;

  const Investment({
    required this.id,
    required this.name,
    required this.type,
    required this.currentPrice,
    required this.purchasePrice,
    required this.quantity,
    required this.totalValue,
    required this.profitLoss,
    required this.profitLossPercentage,
    required this.currency,
    required this.icon,
    required this.color,
    this.isFavorite = false,
  });
}
