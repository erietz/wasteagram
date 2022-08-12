import 'package:flutter/material.dart';
import './screens/waste_entry_list_screen.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Wasteagram',
      home: const WasteEntryList()
    );
  }
}

