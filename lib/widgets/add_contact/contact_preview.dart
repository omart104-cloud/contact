import 'package:contact_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class ContactPreview extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const ContactPreview({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Text(
          name.isEmpty ? 'User Name' : name,
          style: const TextStyle(color: AppColors.gold, fontSize: 18),
        ),
        const Divider(color: AppColors.gold),
        Text(
          email.isEmpty ? 'example@email.com' : email,
          style: const TextStyle(color: AppColors.gold, fontSize: 18),
        ),
        const Divider(color: AppColors.gold),
        Text(
          phone.isEmpty ? 'Phone Number' : phone,
          style: const TextStyle(color: AppColors.gold, fontSize: 18),
        ),
      ],
    );
  }
}
