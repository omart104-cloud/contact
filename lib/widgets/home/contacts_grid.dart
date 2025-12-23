import 'package:contact_app/model/card_model.dart';
import 'package:contact_app/widgets/contact_card/contact_card.dart';
import 'package:flutter/material.dart';

class ContactsGrid extends StatelessWidget {
  final List<CardModel> contacts;
  final void Function(int index) onDelete;

  const ContactsGrid({
    super.key,
    required this.contacts,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.65,
        ),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ContactCard(
            contact: contacts[index],
            onDelete: () => onDelete(index),
          );
        },
      ),
    );
  }
}
