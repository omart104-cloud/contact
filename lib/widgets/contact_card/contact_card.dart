import 'package:contact_app/core/app_colors.dart';
import 'package:flutter/material.dart';

import '../../model/card_model.dart';
import 'profile_image.dart';
import 'contact_details.dart';
import 'delete_button.dart';

class ContactCard extends StatelessWidget {
  final CardModel contact;
  final VoidCallback onDelete;

  const ContactCard({super.key, required this.contact, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.gold),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 6,
            child: ProfileImage(
              imagePath: contact.imagePath,
              name: contact.name,
            ),
          ),
          Expanded(
            flex: 3,
            child: ContactDetails(email: contact.email, phone: contact.phone),
          ),
          DeleteButton(onTap: onDelete),
        ],
      ),
    );
  }
}
