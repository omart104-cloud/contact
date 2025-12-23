import 'dart:io';

import 'package:contact_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ImagePickerBox extends StatelessWidget {
  final File? image;
  final VoidCallback onTap;

  const ImagePickerBox({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.gold, width: 2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: image != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.file(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              )
            : Center(child: Lottie.asset("assets/images/image_picker.json")),
      ),
    );
  }
}
