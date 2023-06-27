// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import '../styles.dart';
import '../models/post.dart';
import '../widgets/post_form.dart';

class NewPost extends StatefulWidget {
  static const routeName = 'newpost';
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

// gets location, allows user to pick image, passes it to post form
class _NewPostState extends State<NewPost> {
  File? image;
  Post post = Post.nullPost();
  final picker = ImagePicker();

  // uses image picker to set image
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    // if they hit cancel when selecting a photo, goes back to loading circle
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  // gets location data, assigns it to Post object
  void retrieveLocation() async {
    var locationData = await Location().getLocation();
    post.latitude = locationData.latitude!;
    post.longitude = locationData.longitude!;
    setState(() {
      getImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Scaffold(
          appBar: AppBar(title: const Text('New Post', style: Styles.appTitle)),
          body: const Center(child: CircularProgressIndicator()));
    } else {
      return PostForm(post: post, image: image);
    }
  }
}
