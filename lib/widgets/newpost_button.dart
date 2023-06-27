import 'package:flutter/material.dart';
import '../screens/new_post.dart';

class NewPostButton extends StatelessWidget {
  const NewPostButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30, top: 10),
      child: Semantics(
        button: true,
        onTapHint: 'Select an image',
        child: FloatingActionButton(
          child: const Icon(Icons.add_a_photo),
          onPressed: () {
            newPost(context);
          },
        ),
      ),
    );
  }
}

void newPost(BuildContext context) {
  Navigator.of(context).pushNamed(NewPost.routeName);
}
