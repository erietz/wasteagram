import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram2/screens/new_entry_screen.dart';


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
            appBar: AppBar(
              title: const Text("Posts")
            ),
            body: ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final post = snapshot.data!.docs[index];
                return ListTile(
                  title: Text((post['date'].toDate()).toString()),
                  trailing: Text(post['numberItems'].toString()),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const NewEntryScreen();
                      })
                    );
                  }
                );
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.camera_alt)
            ),
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
