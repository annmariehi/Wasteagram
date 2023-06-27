import 'package:flutter/material.dart';
import './screens/detail_screen.dart';
import './screens/list_screen.dart';
import './screens/new_post.dart';

class App extends StatefulWidget {
  static final routes = {
    DetailScreen.routeName: (context) => const DetailScreen(),
    ListScreen.routeName: (context) => const ListScreen(),
    NewPost.routeName: (context) => const NewPost()
  };
  final String title;

  const App({Key? key, required this.title}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'wasteagram',
        theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            scaffoldBackgroundColor: Colors.blueGrey[100]),
        routes: App.routes);
  }
}
