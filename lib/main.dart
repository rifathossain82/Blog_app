import 'dart:io';

import 'package:bootcamp_app/controller/blog/blogs_list_controller.dart';
import 'package:bootcamp_app/controller/blog/favorite_blog_list_controller.dart';
import 'package:bootcamp_app/views/screens/blog_list_screen.dart';
import 'package:bootcamp_app/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    ref.read(blogsListProvider.notifier).fetchBlogsList();
    ref.read(favoriteBlogsListProvider.notifier).fetchFavoriteBlogsList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog Project for Bootcamp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
