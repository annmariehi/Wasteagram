import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  Timestamp date;
  int quantity;
  double longitude;
  double latitude;
  String imageURL;

  Post(
      {required this.date,
      required this.quantity,
      required this.longitude,
      required this.latitude,
      required this.imageURL});

  Post.nullPost()
      : date = Timestamp.fromDate(DateTime.now()),
        quantity = 0,
        longitude = 0,
        latitude = 0,
        imageURL = '';

  Post.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        quantity = json['quantity'],
        longitude = json['longitude'],
        latitude = json['latitude'],
        imageURL = json['imageURL'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'quantity': quantity,
        'longitude': longitude,
        'latitude': latitude,
        'imageURL': imageURL
      };

  factory Post.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Post(
        date: data?['date'],
        quantity: data?['quantity'],
        longitude: data?['longitude'],
        latitude: data?['latitude'],
        imageURL: data?['imageURL']);
  }

  Map<String, dynamic> toFirestore() {
    return {
      "date": date,
      "quantity": quantity,
      "longitude": longitude,
      "latitude": latitude,
      "imageURL": imageURL
    };
  }

  @override
  String toString() {
    return "'date': $date, 'quantity': '$quantity', 'longitude': '$longitude', 'latitude': '$latitude', 'imageURL': '$imageURL'";
  }
}
