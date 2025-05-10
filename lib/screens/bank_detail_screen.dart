import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/bank_model.dart';
import '../models/bank_module.dart';
import 'home_screen.dart';

class BankDetailScreen extends StatelessWidget {
  final Bank bank;
  final HomeScreen homeScreen;

  const BankDetailScreen({
    super.key,
    required this.bank,
    required this.homeScreen,
  });

  void _addModule(BankModule module) {
    homeScreen.addedModules.add(module);
    Get.back();
    Get.snackbar(
      'Modül Eklendi',
      '${module.name} modülü başarıyla eklendi',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: module.color.withOpacity(0.1),
      colorText: module.color,
      duration: const Duration(seconds: 2),
    );
  }

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
                  itemCount: bank.modules.length,
                  itemBuilder: (context, index) {
                    final module = bank.modules[index];
                    return Card(
                      elevation: 4,
                      shadowColor: module.color.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        onTap: () => _addModule(module),
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
