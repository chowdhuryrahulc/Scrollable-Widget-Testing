// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScrollTestingWidget(
        bookTitle: List.generate(20, (index) => 'Book $index'),
      ),
    );
  }
}

class ScrollTestingWidget extends StatelessWidget {
  final List<String> bookTitle;
  const ScrollTestingWidget({Key? key, required this.bookTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    assert(bookTitle.isNotEmpty);
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: bookTitle.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(bookTitle[index]),
              );
            }));
  }
}
