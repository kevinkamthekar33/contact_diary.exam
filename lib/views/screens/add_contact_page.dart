import 'dart:io';
import 'package:contact_diary/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContact extends StatelessWidget {
  const AddContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD Contact'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<dataProvider>(
          builder: (context, pro, _) => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 80,
                    foregroundImage:
                        pro.image != null ? FileImage(pro.image!) : null,
                    child: const Text("Add Image"),
                  ),
                  FloatingActionButton.small(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("select"),
                          actions: [
                            ElevatedButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();

                                XFile? img = await picker.pickImage(
                                    source: ImageSource.camera);

                                if (img != null) {
                                  pro.setImage(img: File(img.path));
                                }
                                Navigator.of(context).pop();
                              },
                              child: const Text("Camera"),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();

                                XFile? img = await picker.pickImage(
                                    source: ImageSource.gallery);

                                if (img != null) {
                                  pro.setImage(img: File(img.path));
                                }
                                Navigator.of(context).pop();
                              },
                              child: const Text("Gallery"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (val) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  label: const Text('Name'),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (val) {},
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  label: const Text('Contact No.'),
                  prefixIcon: const Icon(Icons.call),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onSaved: (val) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  label: const Text('Email'),
                  prefixIcon: const Icon(Icons.email),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Save'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
