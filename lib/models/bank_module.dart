import 'package:flutter/material.dart';

class BankModule {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final String description;
  final String bankId;
  final bool isActive;

  BankModule({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
    required this.bankId,
    this.isActive = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'bankId': bankId,
      'isActive': isActive,
      'iconCodePoint': icon.codePoint,
      'iconFontFamily': icon.fontFamily,
      'iconFontPackage': icon.fontPackage,
      'colorValue': color.value,
    };
  }

  factory BankModule.fromJson(Map<String, dynamic> json) {
    return BankModule(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      bankId: json['bankId'],
      isActive: json['isActive'] ?? true,
      icon: IconData(
        json['iconCodePoint'] ?? Icons.extension.codePoint,
        fontFamily: json['iconFontFamily'] ?? Icons.extension.fontFamily,
        fontPackage: json['iconFontPackage'] ?? Icons.extension.fontPackage,
      ),
      color: Color(json['colorValue'] ?? Colors.blue.value),
    );
  }

  BankModule copyWith({
    String? id,
    String? name,
    IconData? icon,
    Color? color,
    String? description,
    String? bankId,
    bool? isActive,
  }) {
    return BankModule(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      description: description ?? this.description,
      bankId: bankId ?? this.bankId,
      isActive: isActive ?? this.isActive,
    );
  }
}
