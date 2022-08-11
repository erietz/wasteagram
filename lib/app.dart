import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Wasteagram',
      home: WasteEntryList()
    );
  }
}


class WasteEntryList extends StatefulWidget {
  const WasteEntryList({Key? key}) : super(key: key);

  @override
  WasteEntryListState createState() => WasteEntryListState();
}

class WasteEntryListState extends State<WasteEntryList> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (
          snapshot.hasData &&
          snapshot.data!.docs.isNotEmpty
        ) {
          return Scaffold(
            body: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final post = snapshot.data!.docs[index];
                return ListTile(
                  leading: Text((post['date'].toDate()).toString()),
                  title: Text(post['numberItems'].toString()));
              },
            )
          );
        } else {
          return Column(
            children: const [
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
      }
    );
  }

}
