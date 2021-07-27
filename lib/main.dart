import 'package:flutter/material.dart';
import 'package:animeapp/screens/screens.dart';

void main() {
  runApp(AnimeApp());
}

class AnimeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/detail': (context) => DetailPage(item: 0, title: ''),
      },
    );
  }
}
