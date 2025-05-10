import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/account_model.dart';

class AccountsScreen extends StatelessWidget {
  AccountsScreen({super.key});

  // Örnek hesaplar
  final List<Account> accounts = [
    Account(
      id: '1',
      accountNumber: 'TR12 3456 7890 1234 5678 9012 34',
      accountName: 'Vadesiz TL Hesabı',
      bankName: 'Garanti BBVA',
      balance: 15000.50,
      currency: 'TRY',
      accountType: 'Vadesiz',
      icon: Icons.account_balance_wallet,
      color: Colors.blue,
    ),
    Account(
      id: '2',
      accountNumber: 'TR98 7654 3210 9876 5432 1098 76',
      accountName: 'Dolar Hesabı',
      bankName: 'Ziraat Bankası',
      balance: 5000.75,
      currency: 'USD',
      accountType: 'Döviz',
      icon: Icons.currency_exchange,
      color: Colors.green,
    ),
    Account(
      id: '3',
      accountNumber: 'TR45 6789 0123 4567 8901 2345 67',
      accountName: 'Euro Hesabı',
      bankName: 'İş Bankası',
      balance: 3000.25,
      currency: 'EUR',
      accountType: 'Döviz',
      icon: Icons.currency_pound,
      color: Colors.purple,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesaplarım'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Toplam Bakiye Kartı
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
                  'Toplam Bakiye',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text(
                      '₺',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '150,000.50',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBalanceItem('USD', '\$5,000.75'),
                    _buildBalanceItem('EUR', '€3,000.25'),
                    _buildBalanceItem('TRY', '₺15,000.50'),
                  ],
                ),
              ],
            ),
          ),

          // Hesap Listesi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: accounts.length,
              itemBuilder: (context, index) {
                final account = accounts[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: account.color.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(account.icon, color: account.color, size: 24),
                    ),
                    title: Text(
                      account.accountName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          account.bankName,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          account.accountNumber,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${account.balance.toStringAsFixed(2)} ${account.currency}',
                          style: TextStyle(
                            color: account.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          account.accountType,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // TODO: Hesap detaylarına git
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Yeni hesap ekleme sayfasına git
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBalanceItem(String currency, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          currency,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
