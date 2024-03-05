import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivering to",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.black45),
              // style: Theme.of(context).textTheme.titleMedium,
              // style: TextStyle(color: Colors.black45, fontSize: 14),
            ),
            Text(
              "Current location",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
