import 'dart:io';
import 'package:contact_diary/helper/db_helper.dart';
import 'package:flutter/material.dart';

import '../modal/data_modal.dart';

class dataProvider extends ChangeNotifier {
  File? image;

  void setImage({required File img}) {
    image = img;
    notifyListeners();
  }

  List<Contact> allContacts = [];

  DbController() {
    init();
  }

  Future<void> init() async {
    allContacts = await DatabaseHelper.databaseHelper.getRecords();
    notifyListeners();
  }

  insert({required Contact contact}) async {
    await DatabaseHelper.databaseHelper.insertRecord(contact: contact).then(
          (value) => init(),
        );
    notifyListeners();
  }

  update({required Contact contact}) async {
    await DatabaseHelper.databaseHelper.updateRecord(contact: contact).then(
          (value) => init(),
        );
    notifyListeners();
  }

  delete({required Contact contact}) async {
    await DatabaseHelper.databaseHelper.deleteRecord(id: contact.id).then(
          (value) => init(),
        );
    notifyListeners();
  }
}
