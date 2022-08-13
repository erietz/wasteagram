import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import '../util/util.dart';

class NewEntryScreen extends StatefulWidget {
  final String imageUrl;

  const NewEntryScreen({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {

  final formKey = GlobalKey<FormState>();
  int? numberItems;

  Future<LocationData> getLocation() async {
    final locationService = Location();
    final locationData = await locationService.getLocation();
    return locationData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Entry")
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            myBigNetworkImage(context, widget.imageUrl),
            const SizedBox(height: 30),
            Form(
              key: formKey,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Number of Items",
                  border: OutlineInputBorder()
                ),
                onSaved: (value) {
                  numberItems = int.tryParse(value as String);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please entry the number of wasted items";
                  } else if (int.tryParse(value) == null) {
                    return "Must be an integer";
                  }
                  return null;
                }
              )
            ),
            ElevatedButton(
              child: const Text("Upload image here"),
              onPressed: () async {


                if (formKey.currentState != null && formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }

                final locationData = await getLocation();
                FirebaseFirestore.instance.collection('posts').add({
                  'image': widget.imageUrl,
                  'date': DateTime.now(),
                  'latitude': locationData.latitude,
                  'longitude': locationData.longitude,
                  'numberItems': numberItems
                });

                Navigator.of(context).pop();

              }
            )
          ]
        )
      )
    );
  }
}
