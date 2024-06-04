import 'package:flutter/material.dart';
import 'package:flutter_firebase_student_register_app/controller/functions_controller.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FunctionsController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD screen'),
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
                provider.postData();
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
    );
  }
}
