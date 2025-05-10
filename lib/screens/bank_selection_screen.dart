import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/bank_model.dart';
import '../models/bank_module.dart';
import 'bank_detail_screen.dart';
import 'home_screen.dart';

class BankSelectionScreen extends StatelessWidget {
  BankSelectionScreen({super.key});

  final List<Bank> banks = [
    Bank(
      name: 'Garanti BBVA',
      logoPath: 'assets/images/banks/garanti.png',
      primaryColor: const Color(0xFF00A0DC),
      secondaryColor: const Color(0xFF004990),
      description: 'Türkiye\'nin öncü dijital bankası',
      modules: [
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
      ],
    ),
    Bank(
      name: 'Ziraat Bankası',
      logoPath: 'assets/images/banks/ziraat.png',
      primaryColor: const Color(0xFFE30613),
      secondaryColor: const Color(0xFFF8B500),
      description: 'Türkiye\'nin en köklü bankası',
      modules: [
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
          name: 'Tarım Kredileri',
          icon: Icons.agriculture,
          color: Colors.lightGreen,
          description: 'Tarım kredileri başvurusu yapın',
        ),
        BankModule(
          name: 'KOSGEB',
          icon: Icons.business,
          color: Colors.brown,
          description: 'KOSGEB desteklerini görüntüleyin',
        ),
        BankModule(
          name: 'Ödemeler',
          icon: Icons.payment,
          color: Colors.red,
          description: 'Fatura ve ödemelerinizi yapın',
        ),
      ],
    ),
    Bank(
      name: 'Kuveyttürk',
      logoPath: 'assets/images/banks/kuveytturk.png',
      primaryColor: const Color(0xFF00A0DC),
      secondaryColor: const Color(0xFF004990),
      description: 'Katılım bankacılığında öncü',
      modules: [
        BankModule(
          name: 'Hesaplarım',
          icon: Icons.account_balance_wallet,
          color: Colors.blue,
          description: 'Hesap bakiyelerinizi görüntüleyin',
        ),
        BankModule(
          name: 'Katılım Hesapları',
          icon: Icons.account_balance,
          color: Colors.green,
          description: 'Katılım hesaplarınızı yönetin',
        ),
        BankModule(
          name: 'Murabaha',
          icon: Icons.attach_money,
          color: Colors.orange,
          description: 'Murabaha işlemlerinizi yapın',
        ),
        BankModule(
          name: 'Sukuk',
          icon: Icons.currency_pound,
          color: Colors.purple,
          description: 'Sukuk işlemlerinizi yönetin',
        ),
        BankModule(
          name: 'Ödemeler',
          icon: Icons.payment,
          color: Colors.red,
          description: 'Fatura ve ödemelerinizi yapın',
        ),
      ],
    ),
    Bank(
      name: 'İş Bankası',
      logoPath: 'assets/images/banks/isbank.png',
      primaryColor: const Color(0xFFE30613),
      secondaryColor: const Color(0xFFF8B500),
      description: 'Türkiye\'nin en büyük özel bankası',
      modules: [
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
          name: 'Yatırım',
          icon: Icons.trending_up,
          color: Colors.purple,
          description: 'Yatırım işlemlerinizi yönetin',
        ),
        BankModule(
          name: 'Sigorta',
          icon: Icons.security,
          color: Colors.indigo,
          description: 'Sigorta ürünlerinizi yönetin',
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
      ],
    ),
    Bank(
      name: 'Akbank',
      logoPath: 'assets/images/banks/akbank.png',
      primaryColor: const Color(0xFFE30613),
      secondaryColor: const Color(0xFFF8B500),
      description: 'Dijital bankacılıkta öncü',
      modules: [
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
          name: 'Kartlarım',
          icon: Icons.credit_card,
          color: Colors.amber,
          description: 'Kart işlemlerinizi yönetin',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Banka Seçimi'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: banks.length,
          itemBuilder: (context, index) {
            final bank = banks[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Card(
                elevation: 8,
                shadowColor: bank.primaryColor.withOpacity(0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(
                      () => BankDetailScreen(
                        bank: bank,
                        homeScreen: Get.find<HomeScreen>(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [bank.primaryColor, bank.secondaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                bank.logoPath,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.account_balance,
                                    size: 40,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bank.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    bank.description,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 16,
                                      height: 1.3,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Bağlan',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
