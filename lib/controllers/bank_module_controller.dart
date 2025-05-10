import 'package:get/get.dart';
import '../models/bank_module.dart';
import 'package:flutter/material.dart';

class BankModuleController extends GetxController {
  final RxList<BankModule> _modules = <BankModule>[].obs;

  List<BankModule> get modules => _modules;

  List<BankModule> getModulesByBankId(String bankId) {
    return _modules.where((module) => module.bankId == bankId).toList();
  }

  void addModule(BankModule module) {
    if (_modules.any((m) => m.id == module.id)) {
      Get.snackbar(
        'Hata',
        'Bu ID ile bir modül zaten mevcut',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    _modules.add(module);
  }

  void removeModule(String moduleId) {
    if (!_modules.any((m) => m.id == moduleId)) {
      Get.snackbar(
        'Hata',
        'Silinecek modül bulunamadı',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    _modules.removeWhere((module) => module.id == moduleId);
  }

  void updateModule(BankModule updatedModule) {
    final index = _modules.indexWhere(
      (module) => module.id == updatedModule.id,
    );
    if (index == -1) {
      Get.snackbar(
        'Hata',
        'Güncellenecek modül bulunamadı',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    _modules[index] = updatedModule;
  }

  void toggleModuleStatus(String moduleId) {
    final index = _modules.indexWhere((module) => module.id == moduleId);
    if (index == -1) {
      Get.snackbar(
        'Hata',
        'Modül bulunamadı',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    final module = _modules[index];
    _modules[index] = module.copyWith(isActive: !module.isActive);
  }

  // Test için örnek modül ekleme
  void addSampleModule(String bankId) {
    addModule(
      BankModule(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: 'Örnek Modül',
        description: 'Bu bir örnek modüldür',
        bankId: bankId,
        icon: Icons.extension,
        color: Colors.blue,
      ),
    );
  }
}
