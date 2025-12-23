import 'dart:io';

import 'package:contact_app/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imagePath;
  final String name;

  const ProfileImage({super.key, required this.imagePath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              topRight: Radius.circular(14),
            ),
            child: imagePath != null
                ? Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : Container(
                    color: AppColors.light.withValues(alpha: 0.2),
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.primary,
                    ),
                  ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 8,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.gold,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
