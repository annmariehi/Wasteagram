import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/detail_screen.dart';
import '../widgets/format_date.dart';
import '../styles.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.snapshot, required this.context});
  final AsyncSnapshot<QuerySnapshot> snapshot;
  final BuildContext context;
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: postList(widget.snapshot),
        ),
      ],
    );
  }
}

Widget postList(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data!.docs.length,
    itemBuilder: (context, index) {
      var post = snapshot.data!.docs[index];
      return Semantics(
          onTapHint: 'Expand Post Detail',
          child: Card(
            child: ListTile(
                leading: Text(post['quantity'].toString(),
                    style: Styles.listQuantity),
                title:
                    FormatDate(timestamp: post['date'], style: Styles.listDate),
                trailing: const Icon(Icons.more_horiz),
                onTap: () => {viewDetails(context, post)}),
          ));
    },
  );
}

// passes info from list tile to detail screen
void viewDetails(BuildContext context, post) {
  Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: {
    'date': post['date'],
    'quantity': post['quantity'].toString(),
    'longitude': post['longitude'].toString(),
    'latitude': post['latitude'].toString(),
    'imageURL': post['imageURL'].toString()
  });
}
