import 'package:flutter/material.dart';
import 'package:flutter_firebase_student_register_app/controller/functions_controller.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  final String docId;

  const UpdateScreen({super.key, required this.docId});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Update'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: provider.nameController,
            ),
            TextField(
              controller: provider.phoneController,
            ),
            TextField(
              controller: provider.emailController,
            ),
            TextField(
              controller: provider.addressController,
            ),
            ElevatedButton(
              onPressed: () {
                provider.updateData(docId);
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
