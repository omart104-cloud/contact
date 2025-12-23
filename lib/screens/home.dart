import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/model/card_model.dart';
import 'package:contact_app/widgets/bottom_sheet.dart';
import 'package:contact_app/widgets/home/contacts_grid.dart';
import 'package:contact_app/widgets/home/empty_state.dart';
import 'package:contact_app/widgets/home/home_btns.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<CardModel> _contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Image.asset("assets/images/title.png"),
        ),
        leadingWidth: 150,
      ),
      body: _contacts.isEmpty
          ? const EmptyState()
          : ContactsGrid(contacts: _contacts, onDelete: _deleteContact),
      floatingActionButton: HomeFab(
        hasContacts: _contacts.isNotEmpty,
        canAddMore: _contacts.length < 6,
        onAdd: _addContact,
        onDeleteAll: _deleteAllContacts,
      ),
    );
  }

  void _addContact() async {
    final result = await showModalBottomSheet<CardModel>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return const AddContact();
      },
    );

    if (result != null) {
      setState(() {
        _contacts.add(result);
      });
    }
  }

  void _deleteContact(int index) {
    setState(() {
      _contacts.removeAt(index);
    });
  }

  void _deleteAllContacts() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Delete All Contacts?',
          style: TextStyle(color: AppColors.gold),
        ),
        content: const Text(
          'This will remove all contacts permanently.',
          style: TextStyle(color: AppColors.light),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.gold),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _contacts.clear();
              });
              Navigator.pop(context);
            },
            child: const Text(
              'Delete',
              style: TextStyle(color: Color(0xFFEE403D)),
            ),
          ),
        ],
      ),
    );
  }
}
