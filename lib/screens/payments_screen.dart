import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/payment_model.dart';

class PaymentsScreen extends StatelessWidget {
  PaymentsScreen({super.key});

  // Örnek ödemeler
  final List<Payment> payments = [
    const Payment(
      id: '1',
      title: 'Elektrik Faturası',
      description: 'Aydınlatma Giderleri',
      icon: Icons.lightbulb_outline,
      color: Colors.amber,
      category: 'Fatura',
      isFavorite: true,
    ),
    const Payment(
      id: '2',
      title: 'Su Faturası',
      description: 'İSKİ',
      icon: Icons.water_drop_outlined,
      color: Colors.blue,
      category: 'Fatura',
    ),
    const Payment(
      id: '3',
      title: 'Doğalgaz Faturası',
      description: 'İGDAŞ',
      icon: Icons.local_fire_department_outlined,
      color: Colors.orange,
      category: 'Fatura',
    ),
    const Payment(
      id: '4',
      title: 'Turkcell',
      description: 'Mobil Hat',
      icon: Icons.phone_android_outlined,
      color: Colors.red,
      category: 'Telefon',
      isFavorite: true,
    ),
    const Payment(
      id: '5',
      title: 'Turk Telekom',
      description: 'İnternet',
      icon: Icons.wifi_outlined,
      color: Colors.green,
      category: 'İnternet',
    ),
    const Payment(
      id: '6',
      title: 'D-Smart',
      description: 'TV Paketi',
      icon: Icons.tv_outlined,
      color: Colors.purple,
      category: 'TV',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ödemeler'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Favori Ödemeler
          Container(
            height: 120,
            margin: const EdgeInsets.all(16),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: payments.where((p) => p.isFavorite).length,
              itemBuilder: (context, index) {
                final payment =
                    payments.where((p) => p.isFavorite).toList()[index];
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [payment.color, payment.color.withOpacity(0.7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: payment.color.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        // TODO: Ödeme detayına git
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(payment.icon, color: Colors.white, size: 32),
                            const SizedBox(height: 8),
                            Text(
                              payment.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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

          // Kategoriler
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const Text(
                  'Kategoriler',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    // TODO: Tüm kategorileri göster
                  },
                  child: const Text('Tümünü Gör'),
                ),
              ],
            ),
          ),

          // Ödeme Listesi
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: payments.length,
              itemBuilder: (context, index) {
                final payment = payments[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: payment.color.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(payment.icon, color: payment.color),
                    ),
                    title: Text(
                      payment.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(payment.description),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (payment.isFavorite)
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_ios, size: 16),
                      ],
                    ),
                    onTap: () {
                      // TODO: Ödeme detayına git
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
          // TODO: Yeni ödeme ekleme sayfasına git
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
