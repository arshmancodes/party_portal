import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 0.0, 0.0),
              child: Text(
                "Welcome",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            )
          ],
        ),
      ),
    );
  }
}
