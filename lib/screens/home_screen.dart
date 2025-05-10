import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/bank_model.dart';
import '../models/bank_module.dart';
import 'bank_selection_screen.dart';

class HomeScreen extends StatelessWidget {
  final RxList<BankModule> addedModules = <BankModule>[].obs;
  final Rx<Bank?> selectedBank = Rx<Bank?>(null);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fusion Bank'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final bank = await Get.to(() => BankSelectionScreen());
              if (bank != null) {
                selectedBank.value = bank;
              }
            },
          ),
        ],
      ),
      body: Obx(() {
        if (selectedBank.value == null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.account_balance, size: 64, color: Colors.grey),
                const SizedBox(height: 16),
                const Text(
                  'Henüz bir banka seçilmedi',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () async {
                    final bank = await Get.to(() => BankSelectionScreen());
                    if (bank != null) {
                      selectedBank.value = bank;
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Banka Ekle'),
                ),
              ],
            ),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Seçili Banka Kartı
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      selectedBank.value!.primaryColor,
                      selectedBank.value!.secondaryColor,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: selectedBank.value!.primaryColor.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              selectedBank.value!.logoPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  selectedBank.value!.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  selectedBank.value!.description,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Eklenen Modüller
              if (addedModules.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Eklenen Modüller',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: addedModules.length,
                  itemBuilder: (context, index) {
                    final module = addedModules[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: module.color.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: module.color.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            module.icon,
                            color: module.color,
                            size: 24,
                          ),
                        ),
                        title: Text(
                          module.name,
                          style: TextStyle(
                            color: module.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          module.description,
                          style: TextStyle(
                            color: module.color.withOpacity(0.7),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          color: Colors.red,
                          onPressed: () {
                            addedModules.removeAt(index);
                            Get.snackbar(
                              'Modül Kaldırıldı',
                              '${module.name} modülü kaldırıldı',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red.withOpacity(0.1),
                              colorText: Colors.red,
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ],
          ),
        );
      }),
    );
  }
}
