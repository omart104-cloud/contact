import 'package:contact_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  final String email;
  final String phone;

  const ContactDetails({super.key, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InfoRow(icon: Icons.email, text: email),
          const SizedBox(height: 2),
          _InfoRow(icon: Icons.phone, text: phone),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: AppColors.primary),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: AppColors.primary, fontSize: 15),
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
