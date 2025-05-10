import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/bank_model.dart';
import '../models/bank_module.dart';

class BankDetailScreen extends StatelessWidget {
  final Bank bank;

  const BankDetailScreen({super.key, required this.bank});

  List<BankModule> get modules => [
    BankModule(
      name: 'Hesaplarım',
      icon: Icons.account_balance_wallet,
      color: Colors.blue,
      description: 'Hesap bakiyelerinizi görüntüleyin',
    ),
    BankModule(
      name: 'Krediler',
      icon: Icons.credit_card,
      color: Colors.green,
      description: 'Kredi işlemlerinizi yönetin',
    ),
    BankModule(
      name: 'Para Transferi',
      icon: Icons.send,
      color: Colors.orange,
      description: 'Para transferi yapın',
    ),
    BankModule(
      name: 'Yatırım',
      icon: Icons.trending_up,
      color: Colors.purple,
      description: 'Yatırım işlemlerinizi yönetin',
    ),
    BankModule(
      name: 'Ödemeler',
      icon: Icons.payment,
      color: Colors.red,
      description: 'Fatura ve ödemelerinizi yapın',
    ),
    BankModule(
      name: 'Döviz',
      icon: Icons.currency_exchange,
      color: Colors.teal,
      description: 'Döviz işlemlerinizi yapın',
    ),
    BankModule(
      name: 'Sigorta',
      icon: Icons.security,
      color: Colors.indigo,
      description: 'Sigorta ürünlerinizi yönetin',
    ),
    BankModule(
      name: 'Kartlarım',
      icon: Icons.credit_card,
      color: Colors.amber,
      description: 'Kart işlemlerinizi yönetin',
    ),
    BankModule(
      name: 'Müşteri Hizmetleri',
      icon: Icons.support_agent,
      color: Colors.pink,
      description: 'Destek alın',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bank.name),
        backgroundColor: bank.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [bank.primaryColor.withOpacity(0.1), Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.85,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: modules.length,
                  itemBuilder: (context, index) {
                    final module = modules[index];
                    return Card(
                      elevation: 4,
                      shadowColor: module.color.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        onTap: () {
                          // TODO: Modül detay sayfasına yönlendir
                        },
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                module.color.withOpacity(0.1),
                                module.color.withOpacity(0.05),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: module.color.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  module.icon,
                                  size: 32,
                                  color: module.color,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                module.name,
                                style: TextStyle(
                                  color: module.color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                module.description,
                                style: TextStyle(
                                  color: module.color.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
