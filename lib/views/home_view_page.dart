import 'package:flutter/material.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('This is the main page of the home screen'),
          ],
        ),
      ),
    );
  }
}
