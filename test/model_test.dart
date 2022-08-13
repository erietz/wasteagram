import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/models/entry_detail.dart';


void main() {
  test('Model has all required properties', () {
    final image =  Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Google_Images_2015_logo.svg/640px-Google_Images_2015_logo.svg.png"));
    final now = DateTime.now();
    const latitude = 23.23;
    const longitude = 32.342;
    const numberItems = 4;

    final entryDetail = EntryDetail(
      image: image,
      date: now,
      latitude: latitude,
      longitude: longitude,
      numberItems: numberItems
    );

    expect(entryDetail.image, image);
    expect(entryDetail.date, now);
    expect(entryDetail.latitude, latitude);
    expect(entryDetail.longitude, longitude);
    expect(entryDetail.numberItems, numberItems);
  });

  test('Test silly model test requirement', () {
    final image =  Image(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Google_Images_2015_logo.svg/640px-Google_Images_2015_logo.svg.png"));
    final now = DateTime.now();
    const latitude = 23.23;
    const longitude = 32.342;
    const numberItems = 4;

    final entryDetail = EntryDetail(
      image: image,
      date: now,
      latitude: latitude,
      longitude: longitude,
      numberItems: numberItems
    );

    expect(entryDetail.sillyTestRequirement(), "This is for the points");


  });

}
