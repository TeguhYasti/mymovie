import 'package:flutter/material.dart';
import 'package:myshopteguh/screen_page/page_list_berita.dart';
import 'package:myshopteguh/screen_page/page_list_berita.dart';
import 'package:myshopteguh/screen_page/page_list_user.dart';
import 'package:myshopteguh/screen_page/page_movie_gallery.dart';
import 'package:myshopteguh/screen_page/page_registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageListBerita(),
    );
  }
}