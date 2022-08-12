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
            const SizedBox(height: 50),
            Text(
              entryDetail.date.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)
            ),
            const SizedBox(height: 50),
            entryDetail.image,
            const SizedBox(height: 50),
            Text(
              "Number of wasted items: ${entryDetail.numberItems.toString()}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)
            ),
            const SizedBox(height: 50),
            Text(
              "Location: (${entryDetail.latitude}, ${entryDetail.longitude})",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)
            )
          ],
        )
      )
    );
  }
}
