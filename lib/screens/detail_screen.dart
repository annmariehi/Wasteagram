import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../widgets/format_date.dart';
import '../styles.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = 'detail';
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)!.settings.arguments ??
        <String, dynamic>{}) as Map;

    return Scaffold(
        appBar:
            AppBar(title: const Text('Post Details', style: Styles.appTitle)),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              FormatDate(
                  timestamp: arguments['date'], style: Styles.entryDetailDate),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInImage.memoryNetwork(
                      height: 400,
                      width: 400,
                      placeholder: kTransparentImage,
                      image: arguments['imageURL'].toString()),
                ],
              ),
              const SizedBox(height: 40),
              Text("Items: ${arguments['quantity']}",
                  style: Styles.entryDetailQuantity),
              const SizedBox(height: 20),
              Text("(${arguments['longitude']}, ${arguments['latitude']})",
                  style: Styles.entryDetailLocation),
            ]),
          ),
        ));
  }
}
