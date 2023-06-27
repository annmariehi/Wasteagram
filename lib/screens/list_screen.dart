import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../styles.dart';
import '../widgets/list_loading.dart';
import '../widgets/newpost_button.dart';
import '../widgets/post_list.dart';

class ListScreen extends StatefulWidget {
  static const routeName = '/';
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  num sumTotal = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: quantityTotal()),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy('date', descending: true)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              return PostList(context: context, snapshot: snapshot);
            } else {
              return const ListLoading();
            }
          }),
      floatingActionButton: const NewPostButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  // EXTRA CREDIT:
  // adds up total quantity and displays it in the appbar
  Widget quantityTotal() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          // reset to 0 before adding
          sumTotal = 0;
          for (var doc in snapshot.data!.docs) {
            sumTotal = sumTotal + doc['quantity'];
          }
        }
        return Text("Posts : $sumTotal", style: Styles.appTitle);
      },
    );
  }
}
