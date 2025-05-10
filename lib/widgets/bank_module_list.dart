import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bank_module_controller.dart';
import '../models/bank_module.dart';

class BankModuleList extends StatelessWidget {
  final String bankId;
  final BankModuleController controller = Get.find<BankModuleController>();

  BankModuleList({Key? key, required this.bankId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final modules = controller.getModulesByBankId(bankId);

      if (modules.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.extension_off, size: 48, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Bu banka için henüz modül eklenmemiş.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => controller.addSampleModule(bankId),
                icon: const Icon(Icons.add),
                label: const Text('Örnek Modül Ekle'),
              ),
            ],
          ),
        );
      }

      return RefreshIndicator(
        onRefresh: () async {
          // Burada modülleri yenileyebilirsiniz
          // Örneğin: await controller.refreshModules(bankId);
        },
        child: ListView.builder(
          itemCount: modules.length,
          itemBuilder: (context, index) {
            final module = modules[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: module.color.withOpacity(0.2),
                  child: Icon(module.icon, color: module.color),
                ),
                title: Text(
                  module.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(module.description),
                trailing: Switch(
                  value: module.isActive,
                  onChanged: (value) {
                    controller.toggleModuleStatus(module.id);
                  },
                ),
                onTap: () {
                  Get.toNamed('/module-details/${module.id}');
                },
              ),
            );
          },
        ),
      );
    });
  }
}
