import 'package:flutter/material.dart';
import '../models/entry_detail.dart';


class EntryDetailScreen extends StatelessWidget {
  final EntryDetail entryDetail;

  const EntryDetailScreen({
    Key? key,
    required this.entryDetail
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Date: ${entryDetail.date.toString()}"),
            entryDetail.image,
            Text("Number items: ${entryDetail.numberItems.toString()}"),
            Text("(${entryDetail.latitude}, ${entryDetail.longitude})")
          ],
        )
      )
    );
  }
}
