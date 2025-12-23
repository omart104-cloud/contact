import 'package:contact_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class HomeFab extends StatelessWidget {
  final bool hasContacts;
  final bool canAddMore;
  final VoidCallback onAdd;
  final VoidCallback onDeleteAll;

  const HomeFab({
    super.key,
    required this.hasContacts,
    required this.canAddMore,
    required this.onAdd,
    required this.onDeleteAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasContacts)
          FloatingActionButton(
            onPressed: onDeleteAll,
            backgroundColor: const Color(0xFFEE403D),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
        if (hasContacts && canAddMore) const SizedBox(height: 10),
        if (canAddMore)
          FloatingActionButton(
            onPressed: onAdd,
            backgroundColor: AppColors.gold,
            child: const Icon(Icons.add, color: Colors.black),
          ),
      ],
    );
  }
}
