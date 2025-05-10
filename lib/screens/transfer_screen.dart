import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/account_model.dart';
import '../models/transfer_model.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
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

  Account? selectedFromAccount;
  Account? selectedToAccount;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Para Transferi'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gönderen Hesap Seçimi
            const Text(
              'Gönderen Hesap',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Account>(
                  isExpanded: true,
                  value: selectedFromAccount,
                  hint: const Text('Hesap Seçin'),
                  items:
                      accounts.map((account) {
                        return DropdownMenuItem(
                          value: account,
                          child: Row(
                            children: [
                              Icon(account.icon, color: account.color),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      account.accountName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${account.balance.toStringAsFixed(2)} ${account.currency}',
                                      style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFromAccount = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Alıcı Hesap Seçimi
            const Text(
              'Alıcı Hesap',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<Account>(
                  isExpanded: true,
                  value: selectedToAccount,
                  hint: const Text('Hesap Seçin'),
                  items:
                      accounts
                          .where(
                            (account) => account.id != selectedFromAccount?.id,
                          )
                          .map((account) {
                            return DropdownMenuItem(
                              value: account,
                              child: Row(
                                children: [
                                  Icon(account.icon, color: account.color),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          account.accountName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '${account.balance.toStringAsFixed(2)} ${account.currency}',
                                          style: TextStyle(
                                            color: Colors.grey.shade600,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          })
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedToAccount = value;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Transfer Tutarı
            const Text(
              'Transfer Tutarı',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: '0.00',
                prefixText:
                    selectedFromAccount?.currency == 'TRY'
                        ? '₺'
                        : selectedFromAccount?.currency == 'USD'
                        ? '\$'
                        : '€',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Açıklama
            const Text(
              'Açıklama',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              maxLines: 2,
              decoration: InputDecoration(
                hintText: 'Transfer açıklaması girin',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Transfer Butonu
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedFromAccount == null ||
                      selectedToAccount == null ||
                      amountController.text.isEmpty) {
                    Get.snackbar(
                      'Hata',
                      'Lütfen tüm alanları doldurun',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red.withOpacity(0.1),
                      colorText: Colors.red,
                    );
                    return;
                  }

                  // TODO: Transfer işlemini gerçekleştir
                  Get.snackbar(
                    'Başarılı',
                    'Transfer işlemi başlatıldı',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green.withOpacity(0.1),
                    colorText: Colors.green,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Transfer Et',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
