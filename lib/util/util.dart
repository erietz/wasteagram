import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<String> getImageAndStore() async {
  XFile? tmp = await ImagePicker().pickImage(source: ImageSource.gallery);
  final image = File(tmp!.path);
  final storageReference = FirebaseStorage.instance.ref().child(path.basename(image.path));
  await storageReference.putFile(image);
  final url = await storageReference.getDownloadURL();
  return url;
}


Image myBigNetworkImage(BuildContext context, String imageUrl) {
  return Image(
    image: NetworkImage(imageUrl),
    width: 0.7 * MediaQuery.of(context).size.width,
    height: 0.7 * MediaQuery.of(context).size.width,
    fit: BoxFit.fill
  );
}
