import 'dart:io';
import 'package:flutter/material.dart';

class EntryDetail {
  final DateTime date;
  final Image image;
  final int numberItems;
  final double latitude;
  final double longitude;

  const EntryDetail({
    required this.date,
    required this.image,
    required this.numberItems,
    required this.latitude,
    required this.longitude,
  });

  String sillyTestRequirement() {
    return "This is for the points";
  }

}

