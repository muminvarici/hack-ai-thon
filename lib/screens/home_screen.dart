import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bank_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fusion Bank'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance, size: 100, color: Colors.grey[400]),
            const SizedBox(height: 16),
            Text(
              'Henüz ekli banka bulunmuyor',
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () async {
                final result = await Get.to(() => BankSelectionScreen());
                if (result != null) {
                  // TODO: Seçilen bankayı kaydet
                  print('Seçilen banka: ${result.name}');
                }
              },
              icon: const Icon(Icons.add),
              label: const Text('Banka Modülü Ekle'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
