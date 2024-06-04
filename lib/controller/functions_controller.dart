import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_student_register_app/model/student_model.dart';

class FunctionsController extends ChangeNotifier {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('student_register');

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<StudentModel> postData() async {
    StudentModel studentModel = StudentModel(
      name: nameController.text,
      phone: int.tryParse(phoneController.text),
      email: emailController.text,
      address: addressController.text,
    );
    try {
      DocumentReference docRef = collection.doc();
      studentModel.id = docRef.id;
      await docRef.set(studentModel.toJson());
      return studentModel;
    } catch (e) {
      throw Exception('ERROR: $e');
    }
  }

  Stream<List<StudentModel>> getAllData() {
    return collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => StudentModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<void> deleteData(docId) async {
    return collection.doc(docId).delete();
  }

  Future<void> updateData(docId) async {
    StudentModel studentModel = StudentModel(
      name: nameController.text,
      phone: int.tryParse(phoneController.text),
      email: emailController.text,
      address: addressController.text,
      id: docId,
    );
    try {
      return await collection.doc(docId).update(studentModel.toJson());
    } catch (e) {
      throw Exception('ERROR: $e');
    }
  }
}
