import 'package:flutter/material.dart';
import 'post_list.dart'; // Ini sudah menangani daftar surat

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Qur\'an App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PostList(), // Ini menggantikan fungsi `post.dart`
    );
  }
}
