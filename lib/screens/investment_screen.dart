import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/investment_model.dart';

class InvestmentScreen extends StatelessWidget {
  InvestmentScreen({super.key});

  // Örnek yatırımlar
  final List<Investment> investments = [
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
  ];

  @override
  Widget build(BuildContext context) {
    // Toplam portföy değeri
    final totalPortfolioValue = investments.fold<double>(
      0,
      (sum, investment) => sum + investment.totalValue,
    );

    // Toplam kar/zarar
    final totalProfitLoss = investments.fold<double>(
      0,
      (sum, investment) => sum + investment.profitLoss,
    );

    // Toplam kar/zarar yüzdesi
    final totalProfitLossPercentage =
        (totalProfitLoss / totalPortfolioValue) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Yatırımlarım'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Portföy Özeti
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.blue.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Portföy Değeri',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  '₺${totalPortfolioValue.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildPortfolioItem(
                      'Toplam Kar/Zarar',
                      '₺${totalProfitLoss.toStringAsFixed(2)}',
                      totalProfitLoss >= 0 ? Colors.green : Colors.red,
                    ),
                    _buildPortfolioItem(
                      'Kar/Zarar %',
                      '%${totalProfitLossPercentage.toStringAsFixed(2)}',
                      totalProfitLoss >= 0 ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Yatırım Listesi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: investments.length,
              itemBuilder: (context, index) {
                final investment = investments[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: investment.color.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                investment.icon,
                                color: investment.color,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        investment.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (investment.isFavorite) ...[
                                        const SizedBox(width: 4),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                      ],
                                    ],
                                  ),
                                  Text(
                                    investment.type,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '₺${investment.totalValue.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${investment.profitLoss >= 0 ? '+' : ''}₺${investment.profitLoss.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color:
                                        investment.profitLoss >= 0
                                            ? Colors.green
                                            : Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Miktar: ${investment.quantity.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Güncel: ₺${investment.currentPrice.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              '%${investment.profitLossPercentage.toStringAsFixed(2)}',
                              style: TextStyle(
                                color:
                                    investment.profitLoss >= 0
                                        ? Colors.green
                                        : Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Yeni yatırım ekleme sayfasına git
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildPortfolioItem(String label, String value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
