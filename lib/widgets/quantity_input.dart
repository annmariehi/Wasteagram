import 'package:flutter/material.dart';
import '../styles.dart';
import '../models/post.dart';

class QuantityInput extends StatelessWidget {
  const QuantityInput({
    super.key,
    required this.post,
  });

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      textField: true,
      onTapHint: 'Enter Waste Quantity',
      child: Padding(
        padding: const EdgeInsets.only(left: 150, right: 150),
        child: TextFormField(
          textAlign: TextAlign.center,
          style: Styles.formEntry,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              floatingLabelAlignment: FloatingLabelAlignment.center,
              labelText: 'quantity'),
          keyboardType: TextInputType.number,
          onSaved: (value) {
            post.quantity = int.parse(value!);
          },
          validator: (value) {
            if (value!.isEmpty) {
              return 'enter a quantity!';
            } else {
              return null;
            }
          },
        ),
      ),
    );
  }
}
