import 'package:flutter/material.dart';

class CommitPage extends StatefulWidget {
  const CommitPage({Key? key}) : super(key: key);

  @override
  State<CommitPage> createState() => _CommitPageState();
}

class _CommitPageState extends State<CommitPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Commit Page'),
      ),
    );
  }
}
