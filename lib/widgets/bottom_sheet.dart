import 'dart:io';

import 'package:contact_app/core/app_colors.dart';
import 'package:contact_app/model/card_model.dart';
import 'package:contact_app/widgets/add_contact/contact_preview.dart';
import 'package:contact_app/widgets/add_contact/image_picker_box.dart';
import 'package:contact_app/widgets/add_contact/submit_button.dart';
import 'package:contact_app/widgets/add_contact/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  File? _image;
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() {}));
    _phoneController.addListener(() => setState(() {}));
    _emailController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceOptions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.primary,
        title: const Text('Choose Image Source',style: TextStyle(color: AppColors.gold),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
            child: const Text('Gallery',style: TextStyle(color: AppColors.gold),),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
            child: const Text('Camera',style: TextStyle(color: AppColors.gold),),
          ),
        ],
      ),
    );
  }

  bool get _isFormValid =>
      _nameController.text.isNotEmpty &&
      _phoneController.text.isNotEmpty &&
      _emailController.text.isNotEmpty;

  void _submitContact() {
    if (_isFormValid) {
      final contact = CardModel(
        name: _nameController.text,
        phone: _phoneController.text,
        email: _emailController.text,
        imagePath: _image?.path,
      );
      Navigator.pop(context, contact);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: ImagePickerBox(image: _image, onTap: _showImageSourceOptions),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: ContactPreview(
                    name: _nameController.text,
                    email: _emailController.text,
                    phone: _phoneController.text,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextField(hintText: "Enter User Name", controller: _nameController),
            const SizedBox(height: 10),
            CustomTextField(hintText: "Enter User Phone", controller: _phoneController),
            const SizedBox(height: 10),
            CustomTextField(hintText: "Enter User Email", controller: _emailController),
            const Spacer(),
            SubmitButton(text: "Enter User", onPressed: _submitContact),
          ],
        ),
      ),
    );
  }
}
