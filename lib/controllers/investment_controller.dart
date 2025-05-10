import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/investment_model.dart';

class InvestmentController extends GetxController {
  final RxList<Investment> investments = <Investment>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Örnek yatırımları yükle
    investments.addAll([
      const Investment(
        id: '1',
        name: 'THYAO',
        type: 'Hisse Senedi',
        currentPrice: 150.25,
        purchasePrice: 140.50,
        quantity: 100,
        totalValue: 15025.00,
        profitLoss: 975.00,
        profitLossPercentage: 6.94,
        currency: 'TRY',
        icon: Icons.show_chart,
        color: Colors.blue,
        isFavorite: true,
      ),
      const Investment(
        id: '2',
        name: 'USD/TRY',
        type: 'Döviz',
        currentPrice: 32.15,
        purchasePrice: 31.80,
        quantity: 1000,
        totalValue: 32150.00,
        profitLoss: 350.00,
        profitLossPercentage: 1.10,
        currency: 'TRY',
        icon: Icons.currency_exchange,
        color: Colors.green,
      ),
      const Investment(
        id: '3',
        name: 'Gram Altın',
        type: 'Altın',
        currentPrice: 2150.75,
        purchasePrice: 2100.00,
        quantity: 50,
        totalValue: 107537.50,
        profitLoss: 2537.50,
        profitLossPercentage: 2.42,
        currency: 'TRY',
        icon: Icons.monetization_on,
        color: Colors.amber,
      ),
      const Investment(
        id: '4',
        name: 'Bitcoin',
        type: 'Kripto',
        currentPrice: 65000.00,
        purchasePrice: 60000.00,
        quantity: 0.5,
        totalValue: 32500.00,
        profitLoss: 2500.00,
        profitLossPercentage: 8.33,
        currency: 'USD',
        icon: Icons.currency_bitcoin,
        color: Colors.orange,
      ),
    ]);
  }

  double get totalPortfolioValue => investments.fold<double>(
    0,
    (sum, investment) => sum + investment.totalValue,
  );

  double get totalProfitLoss => investments.fold<double>(
    0,
    (sum, investment) => sum + investment.profitLoss,
  );

  double get totalProfitLossPercentage =>
      (totalProfitLoss / totalPortfolioValue) * 100;
}
