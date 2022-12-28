import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:downlond/model.dart';
 import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Text("data"),
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = Product();

  _save() async {
    var response = await Dio().get(Product().toString(),
        options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "hello");
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Save Image"),
      ),
      body: SafeArea(
        child: Container(
          height: 550,
          color: Colors.black,
          child: Image.network(
            "",
            fit: BoxFit.cover,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _save();
        },
        label: Icon(Icons.download),
      ),
    );
  }
}
