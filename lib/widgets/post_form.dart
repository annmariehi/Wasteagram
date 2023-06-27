// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import '../models/post.dart';
import 'dart:io';
import './format_date.dart';
import './quantity_input.dart';
import '../screens/detail_screen.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../styles.dart';

class PostForm extends StatefulWidget {
  const PostForm({super.key, required this.post, required this.image});

  final Post post;
  final File? image;

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final formKey = GlobalKey<FormState>();

  // calls imageURL, adds data to firestore, redirects to post detail page
  void uploadData() async {
    await uploadImage();
    FirebaseFirestore.instance
        .collection('posts')
        .add(widget.post.toFirestore());
    Navigator.of(context).pushReplacementNamed(DetailScreen.routeName,
        arguments: widget.post.toJson());
  }

  // gets imageURL, assigns it to Post object
  Future uploadImage() async {
    var fileName = '${DateTime.now()}.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(widget.image!);
    await uploadTask;
    widget.post.imageURL = await storageReference.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // allows user to click out of keyboard
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          appBar: AppBar(title: const Text('New Post', style: Styles.appTitle)),
          body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(height: 80),
              FormatDate(timestamp: widget.post.date, style: Styles.formDate),
              const SizedBox(height: 20),
              Image.file(
                widget.image!,
                height: 300,
                width: 400,
              ),
              const SizedBox(height: 40),
              postForm(),
            ]),
          )),
    );
  }

  Widget postForm() {
    return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuantityInput(post: widget.post),
            const SizedBox(height: 110),
            Semantics(
              button: true,
              onTapHint: 'Upload Post Button',
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(350, 100)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      uploadData();
                    }
                  },
                  child: const Icon(Icons.cloud_upload, size: 75)),
            )
          ],
        ));
  }
}
