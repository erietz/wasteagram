import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:wasteagram2/models/entry_detail.dart';
import 'package:wasteagram2/screens/entry_detail_screen.dart';
import 'package:wasteagram2/screens/new_entry_screen.dart';
import '../util/util.dart';


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
        Widget body;
        if (
          snapshot.hasData &&
          snapshot.data!.docs.isNotEmpty
        ) {
          body = entryList(context, snapshot);
        } else {
            body = const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Posts")
          ),
          body: body,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final image = await getImageAndStore();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return NewEntryScreen(imageUrl: image);
                })
              );
            },
            child: const Icon(Icons.camera_alt)
          ),
        );
      }
    );
  }

  Widget entryList(BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) {
        final post = snapshot.data!.docs[index];
        final entryDetail = EntryDetail(
          date: post['date'].toDate(),
          numberItems: post['numberItems'],
          latitude: post['latitude'].toDouble(),
          longitude: post['longitude'].toDouble(),

          image: myBigNetworkImage(context, post['image']),

        );
        return ListTile(
          title: Text((post['date'].toDate()).toString()),
          trailing: Text(post['numberItems'].toString()),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return EntryDetailScreen(
                  entryDetail: entryDetail
                );
              })
            );
          }
        );
      },
    );
  }

}

