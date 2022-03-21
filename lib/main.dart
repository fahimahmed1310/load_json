import 'package:flutter/material.dart';
import 'package:load_json/loading_screen.dart';

void main() {
  runApp(const LoadJson());
}


class LoadJson extends StatelessWidget {
  const LoadJson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: LoadingScreen(),
    );
  }
}

