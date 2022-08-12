import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as path;

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  late File image;

  Future<String> getImageAndStore() async {
    XFile? tmp = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(tmp!.path);
    final storageReference = FirebaseStorage.instance.ref().child(path.basename(image.path));
    await storageReference.putFile(image);
    final url = await storageReference.getDownloadURL();
    print("url here $url");
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Entry")
      ),
      body: ElevatedButton(
        child: const Text("Upload image here"),
        onPressed: () async {
          final url = await getImageAndStore();
          FirebaseFirestore.instance.collection('posts').add({
            'image': url,
            'date': DateTime.now(),
            'latitude': 34.0,
            'longitude': 45.0,
            'numberItems': 987
          });
        }
      )
    );
  }
}
