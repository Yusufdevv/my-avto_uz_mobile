import 'package:flutter/material.dart';

class ServiceEntity {
  final String icon;
  final String title;
  final VoidCallback onTap;
  const ServiceEntity({required this.title, required this.icon, required this.onTap});
}